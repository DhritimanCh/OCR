
#LibraryChecks
AV<-require("av")
Magick<-require("magick")
Tess<-require("tesseract")
Zoo<-require("zoo")
Runner<-require("runner")
Imager<-require("imager")
GGplot<-require("ggplot2")
if(!AV){install.packages("av")}
if(!Magick){install.packages("magick")}
if(!Tess){install.packages("tesseract")}
if(!Zoo){install.packages("zoo")}
if(!Runner){install.packages("runner")}
if(!Imager){install.packages("imager")}
if(!GGplot){install.packages("ggplot2")}
library(av)
library(magick)
library(tesseract)
library(zoo)
library(runner)
library(imager)
library(ggplot2)

numbers <- tesseract(options = list(tessedit_char_whitelist = "/|.0123456789"))
SessionDir<-tempdir()

Prompt<-readline("Please choose your video file. (Press Enter)\n")

av_video_images(file.choose(), destdir = SessionDir, format = "png", fps = 1)
print(paste0("Reading video data."))
FileList<-list.files(SessionDir,full.names=TRUE)
ImgData<-lapply(FileList,magick::image_read)
print(paste0("Image data imported."))


### Naming Parameters to be selected
Number<-as.numeric(readline("How many parameters are you looking to extract?\n"))


ParaNames<-list(NULL)
for(i in 1:Number){
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

print(paste0("Initiating Numeric extraction \n\n\n"))
ParameterList<-data.frame(matrix(rep(NA,Number),ncol=Number,nrow=1))
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

#########Limits Setting

ICP<-readline("Type the exact name of your ICP parameter name.\n")
SBP<-readline("Type the exact name of your SBP parameter name.\n")
MAP<-readline("Type the exact name of your MAP parameter name.\n")

names(Data)[names(Data)==ICP]<-"ICP"
names(Data)[names(Data)==SBP]<-"SBP"
names(Data)[names(Data)==MAP]<-"MAP"


Data$MAP<-ifelse(Data$MAP<20 | Data$MAP>150,NA,Data$MAP)
Data$SBP<-ifelse(Data$SBP<30 | Data$SBP>250,NA,Data$SBP)
Data$ICP<-ifelse(Data$ICP<0 | Data$ICP>100,NA,Data$ICP)


#########Quantile based cleaning function
Clean<-function(x){
x<-ifelse(x<quantile(x,0.02,na.rm=TRUE) | x>quantile(x,0.98,na.rm=TRUE),NA,x)
return(x)}

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

DataClean$Prx<-runner::runner(data.frame(DataClean$MAP,DataClean$ICP),k=60,function(x)cor(x[,1],x[,2],use="pairwise.complete.obs"),na_pad=TRUE)
DataClean$CPP<-unlist(DataClean$MAP)-unlist(DataClean$ICP)

########### Make Graphs

DataClean$PrxBins<-cut(DataClean$Prx,breaks=seq(-1,1,0.2))
jpeg("PRX CPP Graph.jpg",height=6,width=6,units="in",res=250)
G<-ggplot(data=DataClean[complete.cases(DataClean),],aes(x=PrxBins,y=CPP,fill=factor(sign(Prx))))+geom_boxplot(color="black")+scale_fill_manual(values=c("darkgreen","red"))+labs(fill="PRX Sign",x="PRX")+theme_bw()
print(G)
dev.off()

jpeg("PRX CPP Scatter.jpg",height=6,width=6,units="in",res=250)
G<-ggplot(data=DataClean[complete.cases(DataClean),],aes(x=Prx,y=CPP))+geom_point(aes(color=factor(sign(Prx))),size=1.5)+scale_color_manual(values=c("darkgreen","red"))+labs(color="PRX Sign",x="PRX")+theme_bw()+geom_smooth(color="blue",size=1.2)+geom_smooth(method="lm",color="black",size=1.2)
print(G)
dev.off()

jpeg("PRX MAP Scatter.jpg",height=6,width=6,units="in",res=250)
G<-ggplot(data=DataClean[complete.cases(DataClean),],aes(x=Prx,y=MAP))+geom_point(aes(color=factor(sign(Prx))),size=1.5)+scale_color_manual(values=c("darkgreen","red"))+labs(color="PRX Sign",x="PRX")+theme_bw()+geom_smooth(color="blue",size=1.2)+geom_smooth(method="lm",color="black",size=1.2)
print(G)
dev.off()

###########Saving data

write.csv(DataClean,"Extracted Data.csv")








