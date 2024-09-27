
#LibraryChecks
options(warnings=-1)
AV<-suppressMessages(require("av"))
Magick<-suppressMessages(require("magick"))
Tess<-suppressMessages(require("tesseract"))
Zoo<-suppressMessages(require("zoo"))
Runner<-suppressMessages(require("runner"))
Imager<-suppressMessages(require("imager"))
GGplot<-suppressMessages(require("ggplot2"))
if(!AV){install.packages("av")
suppressMessages(library(av))}
if(!Magick){install.packages("magick")
suppressMessages(library(magick))}
if(!Tess){install.packages("tesseract")
suppressMessages(library(tesseract))}
if(!Zoo){install.packages("zoo")
suppressMessages(library(zoo))}
if(!Runner){install.packages("runner")
suppressMessages(library(runner))}
if(!Imager){install.packages("imager")
suppressMessages(library(imager))}
if(!GGplot){install.packages("ggplot2")
suppressMessages(library(ggplot2))}

numbers <- tesseract(options = list(tessedit_char_whitelist = "/|.0123456789"))
SessionDir<-tempdir()

Prompt<-readline("Please choose your video file. (Press Enter)\n")

av_video_images(file.choose(), destdir = SessionDir, format = "png", fps = 1)
print(paste0("Reading video data."))
FileList<-list.files(SessionDir,full.names=TRUE)
ImgData<-lapply(FileList,magick::image_read)
print(paste0("Image data imported."))


### Naming Parameters to be selected
ParaNum<-as.numeric(readline("How many parameters are you looking to extract?\n"))


ParaNames<-list(NULL)
for(i in 1:ParaNum){
X<-readline(paste0("Name Parameter ",i," (Type out the variable name)\n"))
ParaNames[[i]]<-X}
ParaNames<-unlist(ParaNames)

###Setting Coordinates

CropFunc<-function(FileList,Name){
if(missing(Name)){Name<-readline("Which parameter are you cropping out?")}
TestImage<-imager::load.image(FileList[[1]])
dev.new() ; msgWindow(type="maximize")
plot(TestImage)
Coord<-locator(4)
Xoff<-min(Coord$x)
Yoff<-min(Coord$y)
Width<-max(Coord$x)-min(Coord$x)
Height<-max(Coord$y)-min(Coord$y)
TestImage<-magick::image_read(FileList[[1]])
Cropped<-image_crop(TestImage, geometry=geometry_area(width=Width,height=Height,x_off=Xoff,y_off=Yoff))
dev.off()
dev.new(height=500,width=500,units="px")
plot(Cropped)

input<-menu(c("Yes","No"),title=paste0("Is the ",Name," visible clearly?")) + 1
if (input == 3){
message(paste0('Repeat Coordinate setting for ',Name))}
if (input == 2){
message(paste0('Coordinates for ',Name,' set'))
return(list(Coord=list(Xoff,Yoff,Width,Height),Var=Name))}
}

ParaCoords<-list(NULL)
for(z in 1:length(ParaNames)){
for(i in 1:10){
Parameter<-readline(paste0("Please specify ",ParaNames[z]," coordinates (press Enter).\n"))
Parameter<-CropFunc(FileList,ParaNames[z])
if(is.null(Parameter)){next}
else{ParaCoords[[z]]<-Parameter
break}}}


##Getting ChannelData
ParaChannel<-list(NULL)
for(z in 1:length(ParaNames)){
P<-image_crop(ImgData[[1]], geometry=geometry_area(x_off=ParaCoords[[z]]$Coord[[1]],y_off=ParaCoords[[z]]$Coord[[2]],width=ParaCoords[[z]]$Coord[[3]],height=ParaCoords[[z]]$Coord[[4]]))#Image crop to individual variables
P_tiff <- image_convert(P, "tiff")
P_array <- as.integer(P_tiff[[1]])
Red<-sum(P_array[,,1])
Green<-sum(P_array[,,2])
Blue<-sum(P_array[,,3])
IntensityList<-c(Red,Green,Blue)
ColorList<-c("red","green","blue")
Channel<-ColorList[IntensityList==max(IntensityList)]
ParaChannel[[z]]<-Channel}

####Initiating Numeric extraction
readline("Initiating Numeric extraction. (Press Enter) \n\n")

ParameterList<-data.frame(matrix(rep(NA,ParaNum),ncol=ParaNum,nrow=1))
names(ParameterList)<-ParaNames

for(i in 1:length(ImgData)){
X<-ImgData[[i]]
ParaVals<-list(NULL)
for(z in 1:length(ParaNames)){
P<-image_crop(X, geometry=geometry_area(x_off=ParaCoords[[z]]$Coord[[1]],y_off=ParaCoords[[z]]$Coord[[2]],width=ParaCoords[[z]]$Coord[[3]],height=ParaCoords[[z]]$Coord[[4]]))#Image crop to individual variables
P<-image_channel(P, channel = ParaChannel[[z]])
P<-image_convolve(P,"Gaussian:0x1")
PText <- tesseract::ocr(P, engine = numbers)
if(PText==""){P<-image_convolve(P,"Gaussian:0x1")#Repeat smoothening if undetected
PText <- tesseract::ocr(P, engine = numbers)}
PText<-gsub("\\n","",PText)
PText<-as.numeric(PText)
ParaVals[[z]]<-PText}
ParaVals<-unlist(ParaVals)
ParameterList<-rbind(ParameterList,ParaVals)
print(paste0((length(ImgData)-i)," images left."))
flush.console()}

Data<-ParameterList
Data<-Data[-1,]

#########Quantile based cleaning function
Clean<-function(x){
x<-ifelse(x<quantile(x,0.02,na.rm=TRUE) | x>quantile(x,0.98,na.rm=TRUE),NA,x)
return(x)}

########Setting limits for data

Input<-menu(c("Yes","No"),title=paste0("Do you want to set limits for your data?")) + 1
if (Input == 2){
for(i in 1:length(ParaNames)){
VarInput<-menu(c("Yes","No"),title=paste0("Do you want to set limits for ",ParaNames[i] ,"?")) + 1
if(VarInput==3){next}
if(VarInput==2){
Max<-readline(paste0("Type upper limit for ",ParaNames[i],".\n"))
Max<-as.numeric(Max)
Min<-readline(paste0("Type lower limit for ",ParaNames[i],".\n"))
Min<-as.numeric(Min)
Data[ParaNames[i]][Data[ParaNames[i]]>Max]<-NA
Data[ParaNames[i]][Data[ParaNames[i]]<Min]<-NA
next}}}
if (Input == 3){
message(paste0('No changes made to recorded data.\n'))}

#######zoo package based interpolation function
Interpolate<-function(x){
Sno<-1:length(x)
InterData<-zoo::zoo(data.frame(Sno,x))
zoo::index(InterData)<-InterData[,1]
x_approx <- zoo::na.approx(InterData)
return(as.numeric(x_approx[,2]))}

########Applying cleaning and interpolation
DataClean<-do.call(data.frame,lapply(Data,Clean))
DataClean<-do.call(data.frame,lapply(DataClean,Clean))#Repeat clean if too high or too low values persist
DataClean<-do.call(data.frame,lapply(DataClean,Interpolate))

###### Cors Calculation

Input<-menu(c("Yes","No"),title=paste0("Do you want calculate running window correlations?\n")) + 1
if (Input == 2){
CorNum<-readline("How many variables do you want to compute?\n")
CorNum<-as.numeric(CorNum)
for(i in 1:CorNum){
print(names(DataClean))
Var1<-readline("Please type the exact name of the 1st variable.\n")
Var2<-readline("Please type the exact name of the 2nd variable.\n")
Window<-readline("Please type the length of running window for correlation.\n")
Window<-as.numeric(Window)
if(is.na(Window)){Window<-readline("Error in window length. Please type the length of running window for correlation (numeric).\n")
Window<-as.numeric(Window)}
VarName<-readline("Please type the name of the variable to be computed.\n")
DataClean[VarName]<-runner::runner(data.frame(DataClean[Var1],DataClean[Var2]),k=Window,function(x)cor(x[,1],x[,2],use="pairwise.complete.obs"),na_pad=TRUE)
next}}
if (Input == 3){
message(paste0('No variables computed. Save file in next step.\n'))}

Prompt<-readline("Please type the name of the file to be saved.\n")
write.csv(DataClean,file=paste0(Prompt,".csv"),row.names=FALSE)


