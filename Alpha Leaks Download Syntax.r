##########Daily automated download syntax

CDate<-Sys.Date()
########IRF

Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Interest Rate Futures Data 2009 Onwards/2022 Zips", recursive = TRUE, full.names = TRUE)
DateList<-NULL
for(i in 1:length(Data)){
X<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Interest Rate Futures Data 2009 Onwards/2022 Zips/IRF_NSE","",Data[i],fixed=TRUE)
X<-gsub(".zip","",X)
X<-as.character(as.Date(X,format="%d%m%Y"))
DateList[i]<-X}
DateList<-DateList[!is.na(DateList)]
DateList<-as.Date(DateList,format = "%Y-%m-%d")
CurrDate<-CDate
if(max(DateList)<CurrDate){
Start<-max(DateList)+1
End<-CurrDate
Dates<-seq(Start,End,1)
for(i in 1:length(Dates)){
tryCatch({
if(weekdays(Dates[i])=="Sunday"){next}
if(weekdays(Dates[i])=="Saturday"){next}
Year<-unlist(strsplit(as.character(Dates[i]),"-"))[1]
Year<-substr(Year,3,4)
Month<-unlist(strsplit(as.character(Dates[i]),"-"))[2]
Day<-unlist(strsplit(as.character(Dates[i]),"-"))[3]
if(Dates[i]<="2016-02-15"){File<-paste0("https://archives.nseindia.com/archives/ird/bhav/IRF_NSE",Day,Month,Year,".dbf.zip")
Dest<-paste0("C:/Users/dhrit/Desktop/IRF Data/IRF_NSE_",Day,Month,Year,".zip")}else{
if(Dates[i]>"2016-02-15" & Dates[i]<="2019-12-20"){File<-paste0("https://archives.nseindia.com/archives/ird/bhav/IRF_NSE",Day,Month,Year,".csv")
Dest<-paste0("C:/Users/dhrit/Desktop/IRF Data/IRF_NSE",Day,Month,Year,".csv")}else{
File<-paste0("https://archives.nseindia.com/archives/ird/bhav/IRF_Bhavcopy",Day,Month,Year,".zip")
Dest<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Interest Rate Futures Data 2009 Onwards/2022 Zips/IRF_NSE",Day,Month,"20",Year,".zip")}}

download.file(File,Dest)
print(paste0("IRF ",Day,"-",Month,"-",Year," done"))
flush.console()
Sys.sleep(0.5)},error=function(e){})}}else{print("Directory is already updated")}

#########Commodity

Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Commodity Bhavcopies 2018 onwards/2022 Zips", recursive = TRUE, full.names = TRUE)
DateList<-NULL
for(i in 1:length(Data)){
X<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Commodity Bhavcopies 2018 onwards/2022 Zips/com_","",Data[i],fixed=TRUE)
X<-gsub(".zip","",X)
X<-as.character(as.Date(X,format="%d%m%Y"))
DateList[i]<-X}
DateList<-DateList[!is.na(DateList)]
DateList<-as.Date(DateList,format = "%Y-%m-%d")
CurrDate<-CDate
if(max(DateList)<CurrDate){
Start<-max(DateList)+1
End<-CurrDate
Dates<-seq(Start,End,1)

for(i in 1:length(Dates)){
tryCatch({if(weekdays(Dates[i])=="Sunday"){next}
if(weekdays(Dates[i])=="Saturday"){next}
Year<-unlist(strsplit(as.character(Dates[i]),"-"))[1]
Month<-unlist(strsplit(as.character(Dates[i]),"-"))[2]
Day<-unlist(strsplit(as.character(Dates[i]),"-"))[3]
File<-paste0("https://archives.nseindia.com/archives/com/bhavcopy/com_",Day,Month,Year,".zip")
Dest<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Commodity Bhavcopies 2018 onwards/2022 Zips/com_",Day,Month,Year,".zip")
download.file(File,Dest)
print(paste0("Com ",Day,"-",Month,"-",Year," done"))
flush.console()
Sys.sleep(0.5)},error=function(e){})}}

########Currency

Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Currency Derivatives Bhavcopies 2008 Onwards/2022 Zips", recursive = TRUE, full.names = TRUE)
DateList<-NULL
for(i in 1:length(Data)){
X<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Currency Derivatives Bhavcopies 2008 Onwards/2022 Zips/CD_","",Data[i],fixed=TRUE)
X<-gsub(".zip","",X)
X<-as.character(as.Date(X,format="%d%m%y"))
DateList[i]<-X}
DateList<-DateList[!is.na(DateList)]
DateList<-as.Date(DateList,format = "%Y-%m-%d")
CurrDate<-CDate
if(max(DateList)<CurrDate){
Start<-max(DateList)+1
End<-CurrDate
Dates<-seq(Start,End,1)

for(i in 1:length(Dates)){
tryCatch({
if(weekdays(Dates[i])=="Sunday"){next}
if(weekdays(Dates[i])=="Saturday"){next}
Year<-unlist(strsplit(as.character(Dates[i]),"-"))[1]
Year<-substr(Year,3,4)
Month<-unlist(strsplit(as.character(Dates[i]),"-"))[2]
Day<-unlist(strsplit(as.character(Dates[i]),"-"))[3]
File<-paste0("https://archives.nseindia.com/archives/cd/bhav/CD_Bhavcopy",Day,Month,Year,".zip")
Dest<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Currency Derivatives Bhavcopies 2008 Onwards/2022 Zips/CD_",Day,Month,Year,".zip")
download.file(File,Dest)
print(paste0("CD ",Day,"-",Month,"-",Year," done"))
flush.console()
Sys.sleep(0.5)},error=function(e){})}}

#####FnO Equity
Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/FnO Daily Bhavcopies 2001 Onwards/2023 Bhavcopies", recursive = TRUE, full.names = TRUE,pattern="*.csv")
DateList<-NULL
for(i in 1:length(Data)){
X<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/FnO Daily Bhavcopies 2001 Onwards/2023 Bhavcopies/fo","",Data[i],fixed=TRUE)
X<-gsub("bhav.csv","",X)
X<-as.character(as.Date(X,format="%d%b%Y"))
DateList[i]<-X}
DateList<-DateList[!is.na(DateList)]
DateList<-as.Date(DateList,format = "%Y-%m-%d")
CurrDate<-CDate
if(max(DateList)<CurrDate){
Start<-max(DateList)+1
End<-CurrDate
Dates<-seq(Start,End,1)

for(i in 1:length(Dates)){
tryCatch({
if(weekdays(Dates[i])=="Sunday"){next}
if(weekdays(Dates[i])=="Saturday"){next}
Year<-unlist(strsplit(as.character(Dates[i]),"-"))[1]
Month<-as.numeric(unlist(strsplit(as.character(Dates[i]),"-"))[2])
Month<-toupper(substr(month.name,1,3))[Month]
Day<-unlist(strsplit(as.character(Dates[i]),"-"))[3]
File<-paste0("https://archives.nseindia.com/content/historical/DERIVATIVES/2023/",Month,"/fo",Day,Month,Year,"bhav.csv.zip")
Dest<-paste0("C:/Users/dhrit/Desktop/FnO Bhavcopies/NSE FnO 2002-2022/2023/fo",Day,Month,Year,"bhav.csv.zip")
download.file(File,Dest)
Latest<-unzip(Dest)
CurrentCSV<-read.csv(Latest,header=TRUE)
write.csv(CurrentCSV,file=paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/FnO Daily Bhavcopies 2001 Onwards/2023 Bhavcopies/",substr(Latest,3,nchar(Latest))),row.names=FALSE)
print(paste0("FnO ",Day,"-",Month,"-",Year," done"))
flush.console()
Sys.sleep(0.5)},error=function(e){})}}else{print("Directory is already updated")}

################
CDate<-Sys.Date()
##########CM Data
Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/CM Daily Bhavcopies 1995 Onwards/2022 Zips", recursive = TRUE, full.names = TRUE)
DateList<-NULL
for(i in 1:length(Data)){
X<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/CM Daily Bhavcopies 1995 Onwards/2022 Zips/","",Data[i],fixed=TRUE)
X<-gsub(".zip","",X)
X<-as.character(as.Date(X,format="%d%b%Y"))
DateList[i]<-X}
DateList<-DateList[!is.na(DateList)]
DateList<-as.Date(DateList,format = "%Y-%m-%d")
CurrDate<-CDate
if(max(DateList)<CurrDate){
Start<-max(DateList)+1
End<-CurrDate
Dates<-seq(Start,End,1)

for(i in 1:length(Dates)){
tryCatch({
if(weekdays(Dates[i])=="Sunday"){next}
if(weekdays(Dates[i])=="Saturday"){next}
StrMonth<-toupper(substr(months(Dates[i]),1,3))
Year<-unlist(strsplit(as.character(Dates[i]),"-"))[1]
Month<-unlist(strsplit(as.character(Dates[i]),"-"))[2]
Day<-unlist(strsplit(as.character(Dates[i]),"-"))[3]
File<-paste0("https://archives.nseindia.com/content/historical/EQUITIES/",Year,"/",StrMonth,"/cm",Day,StrMonth,Year,"bhav.csv.zip")
Dest<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/CM Daily Bhavcopies 1995 Onwards/2022 Zips/",Day,StrMonth,Year,".zip")
download.file(File,Dest)
print(paste0("CM ",Day,"-",Month,"-",Year," done"))
flush.console()
Sys.sleep(1.5)},error=function(e){})}}

################Index Data download


Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022", recursive = TRUE, full.names = TRUE)
DateList<-NULL
for(i in 1:length(Data)){
X<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/","",Data[i],fixed=TRUE)
X<-gsub(" IndexData.csv","",X)
X<-as.character(as.Date(X,format="%d-%m-%Y"))
DateList[i]<-X}
DateList<-DateList[!is.na(DateList)]
DateList<-as.Date(DateList,format = "%Y-%m-%d")
CurrDate<-CDate
if(max(DateList)<CurrDate){
Start<-max(DateList)+1
End<-CurrDate
Dates<-seq(Start,End,1)

for(i in 1:length(Dates)){
tryCatch({if(weekdays(Dates[i])=="Sunday"){next}
if(weekdays(Dates[i])=="Saturday"){next}
Year<-unlist(strsplit(as.character(Dates[i]),"-"))[1]
Month<-unlist(strsplit(as.character(Dates[i]),"-"))[2]
Day<-unlist(strsplit(as.character(Dates[i]),"-"))[3]
File<-paste0("https://archives.nseindia.com/content/indices/ind_close_all_",Day,Month,Year,".csv")
File<-read.csv(File,header=TRUE)
write.csv(File,file=paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/",Day,"-",Month,"-",Year," IndexData.csv"),row.names=FALSE)
print(paste0(Day,"-",Month,"-",Year," done"))
flush.console()
Sys.sleep(0.5)},error=function(e){})}}


##################BTST Calcs

###########ACLR Calcs
Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022", recursive = TRUE, full.names = TRUE)
DateList<-NULL
for(i in 1:length(Data)){
X<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/","",Data[i],fixed=TRUE)
X<-gsub(" IndexData.csv","",X)
X<-as.character(as.Date(X,format="%d-%m-%Y"))
DateList[i]<-X}
DateList<-DateList[!is.na(DateList)]
DateList<-sort(as.Date(DateList,format = "%Y-%m-%d"))
Last5<-DateList[c((length(DateList)-4):length(DateList))]

Year<-sapply(Last5,function(x)unlist(strsplit(as.character(x),"-"))[1])
Month<-sapply(Last5,function(x)unlist(strsplit(as.character(x),"-"))[2])
Day<-sapply(Last5,function(x)unlist(strsplit(as.character(x),"-"))[3])

Files5<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/",Day,"-",Month,"-",Year," IndexData.csv")

Data<-data.table::rbindlist(lapply(Files5,function(x)read.csv(x,header=TRUE,stringsAsFactors=FALSE)))
Data<-Data[Data$Index.Name=="Nifty 50",]


Window<-5
Lag<-1
AC1<-rep(NA,Window-1)
LR<-rep(NA,Window-1)
for(i in Window:length(Data$Closing.Index.Value)){
X<-Data$Closing.Index.Value[(i-Window+1):i]
Sno<-c((i-Window+1):i)
LR<-c(LR,lm(X~Sno)$coeff[2])
AC1<-c(AC1,as.numeric(unlist(acf(X)[Lag])[1]))}
Data$AC<-round(AC1,2)
Data$LR<-round(LR,2)



ForPrint<-Data[5,c(2:8,14,15)]
names(ForPrint)<-c("Date","Open","High","Low","Close","Returns","Returns_Perc","AutoCorr","LinReg")
library(ggplot2)
library(gridExtra)
ForPrint<-data.frame(ForPrint,row.names="")
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/BTST Blurb/ACLR.png", height=1, width=10,units="in",res=250)
p<-tableGrob(ForPrint)
grid.arrange(p)
dev.off()


############# Mean Var Portfolio Calcs
Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022", recursive = TRUE, full.names = TRUE)
Date<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/","",Data,fixed=TRUE)
Date<-gsub(" IndexData.csv","",Date)
DateList<-as.Date(Date,format="%d-%m-%Y")

DateList<-sort(DateList)
Dates<-DateList[(length(DateList)-20):length(DateList)]
Year<-substr(Dates,1,4)
Month<-substr(Dates,6,7)
Day<-substr(Dates,9,10)

FileList<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/",Day,"-",Month,"-",Year," IndexData.csv")
Data<-data.table::rbindlist(lapply(FileList,function(x)read.csv(x,header=TRUE,stringsAsFactors=FALSE)),fill=TRUE)
Imp<-c("Nifty 50","Nifty PSE","Nifty Pharma","Nifty Auto","Nifty Bank","Nifty FMCG","Nifty Commodities","Nifty IT")
ImpData<-Data[Data$Index.Name%in%Imp,]

ImpData<-data.frame(ImpData$Index.Name,ImpData$Closing.Index.Value,ImpData$Index.Date)
names(ImpData)<-c("Index","Close","Date")

ImpData<-t(reshape(ImpData, idvar="Index",timevar = "Date", direction = "wide"))
Names<-ImpData[1,]
ImpData<-ImpData[-1,]
colnames(ImpData)<-Names
ImpData<-apply(ImpData,2,as.numeric)
ImpData<-data.frame(ImpData)
source("Mean Variance Function.R")
X<-MeanVar(ImpData)
Out<-round(X$best_wt,2)
MaxOut<-round(X$max_return,2)
Graph<-rbind(Out,MaxOut)
Graph<-t(Graph)
Names<-rownames(Graph)
Graph<-data.frame(Names,Graph)
names(Graph)<-c("Names","Vals","MaxVals") 
Wts<-Graph[1:(nrow(Graph)-3),]
Stats<-Graph[(nrow(Graph)-2):nrow(Graph),]
 
 
row.names(Out)<-NULL
row.names(MaxOut)<-NULL
library(ggplot2)
library(gridExtra)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Mean Var Portfolio/Best_Wt.png", height=4, width=12,units="in",res=250)
G1<-ggplot(data=Wts,aes(x=unlist(gsub("_Wt","",Names)),y=as.numeric(Vals),fill=unlist(gsub("_Wt","",Names))))+geom_bar(stat="identity",position="dodge")+labs(y="Weights (%)",x="Assets",fill="Assets",title=paste0(max(DateList)))+scale_fill_brewer(palette="Dark2")+coord_flip()
G2<-ggplot(data=Stats,aes(x=unlist(Names),y=as.numeric(Vals),fill=unlist(Names)))+geom_bar(stat="identity",position="dodge")+labs(y="Values",x="Stats",fill="Stats")+scale_fill_brewer(palette="Dark2")
grid.arrange(G1,G2,nrow=1)
dev.off()

png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Mean Var Portfolio/Max_Return.png", height=4, width=12,units="in",res=250)
G1<-ggplot(data=Wts,aes(x=unlist(gsub("_Wt","",Names)),y=as.numeric(MaxVals),fill=unlist(gsub("_Wt","",Names))))+geom_bar(stat="identity",position="dodge")+labs(y="Weights (%)",x="Assets",fill="Assets",title=paste0(max(DateList)))+scale_fill_brewer(palette="Dark2")+coord_flip()
G2<-ggplot(data=Stats,aes(x=unlist(Names),y=as.numeric(MaxVals),fill=unlist(Names)))+geom_bar(stat="identity",position="dodge")+labs(y="Values",x="Stats",fill="Stats")+scale_fill_brewer(palette="Dark2")
grid.arrange(G1,G2,nrow=1)
dev.off()

############CorrPlot

library(corrplot)
########20Day Data
Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022", recursive = TRUE, full.names = TRUE)
Data<-c(Data,list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2021", recursive = TRUE, full.names = TRUE))
Date<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/","",Data,fixed=TRUE)
Date<-gsub(" IndexData.csv","",Date)
DateList<-as.Date(Date,format="%d-%m-%Y")

DateList<-sort(DateList)
Dates<-DateList[(length(DateList)-20):length(DateList)]
Year<-substr(Dates,1,4)
Month<-substr(Dates,6,7)
Day<-substr(Dates,9,10)

FileList<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/",Day,"-",Month,"-",Year," IndexData.csv")
Data<-data.table::rbindlist(lapply(FileList,function(x)read.csv(x,header=TRUE,stringsAsFactors=FALSE)),fill=TRUE)
Imp<-c("Nifty 50","Nifty PSE","Nifty Pharma","Nifty Auto","Nifty Bank","Nifty IT","Nifty Financial Services","Nifty FMCG","Nifty Commodities","Nifty Energy","Nifty Metal","Nifty Infrastructure","Nifty Realty","Nifty Consumer Durables")
D20Corr<-Data[Data$Index.Name%in%Imp,]

D20Corr<-data.frame(D20Corr$Index.Name,D20Corr$Closing.Index.Value,D20Corr$Index.Date)
names(D20Corr)<-c("Index","Close","Date")
D20Corr$Date<-as.Date(D20Corr$Date,format="%d-%m-%Y")
MinDate<-min(D20Corr$Date)
MaxDate<-max(D20Corr$Date)
D20Corr$Date<-as.character(D20Corr$Date)
D20Corr<-t(reshape(D20Corr, idvar="Index",timevar = "Date", direction = "wide"))
Names<-D20Corr[1,]
D20Corr<-D20Corr[-1,]
colnames(D20Corr)<-Names
D20Corr<-apply(D20Corr,2,as.numeric)
D20Corr<-data.frame(D20Corr)
names(D20Corr)<-gsub("."," ",names(D20Corr),fixed=TRUE)

res<-Hmisc::rcorr(as.matrix(D20Corr),type="spearman")$r
col2 = colorRampPalette(c('red', 'white', 'darkgreen'))
jpeg(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/CorrPlot/D20 CorrPlot.jpg"),width=10,height=10,units="in",res=250)
corrplot(res, type = "upper", order = "original", tl.col = "black", tl.srt = 45,title=paste0(MinDate," to ",MaxDate),mar=c(0,0,2,0),col=col2(10))
dev.off()

########## 50 day Data
DateList<-sort(DateList)
Dates<-DateList[(length(DateList)-50):length(DateList)]
Year<-substr(Dates,1,4)
Month<-substr(Dates,6,7)
Day<-substr(Dates,9,10)

FileList<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/",Day,"-",Month,"-",Year," IndexData.csv")
Data<-data.table::rbindlist(lapply(FileList,function(x)read.csv(x,header=TRUE,stringsAsFactors=FALSE)),fill=TRUE)
Imp<-c("Nifty 50","Nifty PSE","Nifty Pharma","Nifty Auto","Nifty Bank","Nifty IT","Nifty Financial Services","Nifty FMCG","Nifty Commodities","Nifty Energy","Nifty Metal","Nifty Infrastructure","Nifty Realty","Nifty Consumer Durables")
D50Corr<-Data[Data$Index.Name%in%Imp,]

D50Corr<-data.frame(D50Corr$Index.Name,D50Corr$Closing.Index.Value,D50Corr$Index.Date)
names(D50Corr)<-c("Index","Close","Date")
D50Corr$Date<-as.Date(D50Corr$Date,format="%d-%m-%Y")
MinDate<-min(D50Corr$Date)
MaxDate<-max(D50Corr$Date)
D50Corr$Date<-as.character(D50Corr$Date)
D50Corr<-t(reshape(D50Corr, idvar="Index",timevar = "Date", direction = "wide"))
Names<-D50Corr[1,]
D50Corr<-D50Corr[-1,]
colnames(D50Corr)<-Names
D50Corr<-apply(D50Corr,2,as.numeric)
D50Corr<-data.frame(D50Corr)
names(D50Corr)<-gsub("."," ",names(D50Corr),fixed=TRUE)

res<-Hmisc::rcorr(as.matrix(D50Corr),type="spearman")$r
col2 = colorRampPalette(c('red', 'white', 'darkgreen'))
jpeg(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/CorrPlot/D50 CorrPlot.jpg"),width=10,height=10,units="in",res=250)
corrplot(res, type = "upper", order = "original", tl.col = "black", tl.srt = 45,title=paste0(MinDate," to ",MaxDate),mar=c(0,0,2,0),col=col2(10))
dev.off()

########## 100 day Data
DateList<-sort(DateList)
Dates<-DateList[(length(DateList)-100):length(DateList)]
Year<-substr(Dates,1,4)
Month<-substr(Dates,6,7)
Day<-substr(Dates,9,10)

FileList<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/",Day,"-",Month,"-",Year," IndexData.csv")
Data<-data.table::rbindlist(lapply(FileList,function(x)read.csv(x,header=TRUE,stringsAsFactors=FALSE)),fill=TRUE)
Imp<-c("Nifty 50","Nifty PSE","Nifty Pharma","Nifty Auto","Nifty Bank","Nifty IT","Nifty Financial Services","Nifty FMCG","Nifty Commodities","Nifty Energy","Nifty Metal","Nifty Infrastructure","Nifty Realty","Nifty Consumer Durables")
D100Corr<-Data[Data$Index.Name%in%Imp,]

D100Corr<-data.frame(D100Corr$Index.Name,D100Corr$Closing.Index.Value,D100Corr$Index.Date)
names(D100Corr)<-c("Index","Close","Date")
D100Corr$Date<-as.Date(D100Corr$Date,format="%d-%m-%Y")
MinDate<-min(D100Corr$Date)
MaxDate<-max(D100Corr$Date)
D100Corr$Date<-as.character(D100Corr$Date)
D100Corr<-t(reshape(D100Corr, idvar="Index",timevar = "Date", direction = "wide"))
Names<-D100Corr[1,]
D100Corr<-D100Corr[-1,]
colnames(D100Corr)<-Names
D100Corr<-apply(D100Corr,2,as.numeric)
D100Corr<-data.frame(D100Corr)
names(D100Corr)<-gsub("."," ",names(D100Corr),fixed=TRUE)

res<-Hmisc::rcorr(as.matrix(D100Corr),type="spearman")$r
col2 = colorRampPalette(c('red', 'white', 'darkgreen'))
jpeg(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/CorrPlot/D100 CorrPlot.jpg"),width=10,height=10,units="in",res=250)
corrplot(res, type = "upper", order = "original", tl.col = "black", tl.srt = 45,title=paste0(MinDate," to ",MaxDate),mar=c(0,0,2,0),col=col2(10))
dev.off()

############ Momentum Screener

Data.Names<-list.files("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/CM Daily Bhavcopies 1995 Onwards/2022 Zips",recursive =TRUE, full.names=TRUE,pattern = "*.zip")

Data<-list(NULL)

for(i in 1:length(Data.Names)){
X<-unzip(Data.Names[i],exdir=tempdir())
X<-read.csv(X,header=TRUE,stringsAsFactors=TRUE)
Data[[i]]<-X}

CollData<-data.table::rbindlist(Data,fill=TRUE)
CollData$Date<-as.Date(CollData$TIMESTAMP,format="%d-%b-%Y")
CollData<-CollData[order(CollData$Date),]
CollData$SYMBOL[CollData$SYMBOL=="MOTHERSUMI"]<-"MOTHERSON"
CollData$SYMBOL[CollData$SYMBOL=="SUPPETRO"]<-"SPLPETRO"
CollData$SYMBOL[CollData$SYMBOL=="RUCHI"]<-"PATANJALI"
CollData<-CollData[CollData$SERIES=="EQ"|CollData$SERIES=="BE"|CollData$SERIES=="BZ"|CollData$SERIES=="SM"|CollData$SERIES=="ST",]
Split<-split(CollData,CollData$SYMBOL,drop=TRUE)

RetFuncBackward<-function(x,Days){
FuturePrice<-c(x[-c(1:Days)],rep(NA,Days))
PercChange<-(FuturePrice-x)/x
PercChangeBackward<-c(rep(NA,sum(is.na(PercChange))),PercChange[!is.na(PercChange)])
return(PercChangeBackward)}

MomData<-list(NULL)
for(i in 1:length(Split)){
if(nrow(Split[[i]])<=252){next}
X<-Split[[i]]
X$D1Ret<-RetFuncBackward(X$CLOSE,1)
X$D20Ret<-RetFuncBackward(X$CLOSE,20)
X$D60Ret<-RetFuncBackward(X$CLOSE,60)
QrtrlySD<-sd(X$D1Ret[(length(X$D1Ret)-250):length(X$D1Ret)],na.rm=TRUE)*sqrt(250)
D20Ret<-X$D20Ret[length(X$D20Ret)]
D60Ret<-X$D60Ret[length(X$D60Ret)]
M20Ratio<-D20Ret/QrtrlySD
M60Ratio<-D60Ret/QrtrlySD
Symbol<-unique(X$SYMBOL)
Date<-max(X$Date,na.rm=TRUE)
Out<-data.frame(Date,Symbol,D20Ret,D60Ret,QrtrlySD,M20Ratio,M60Ratio)
MomData[[i]]<-Out}

MomData<-do.call(rbind,MomData)

MCap<-read.csv("MCap.csv",header=TRUE)
MCap$Mcap<-as.numeric(MCap$Mcap)
MCap<-MCap[order(MCap$Mcap,decreasing=TRUE),]
LCap<-MCap$Symbol[1:100]
MedCap<-MCap$Symbol[101:250]
SCap<-MCap$Symbol[251:500]

Mom100<-MomData[MomData$Symbol %in% LCap,]
Mom150<-MomData[MomData$Symbol %in% MedCap,]
Mom250<-MomData[MomData$Symbol %in% SCap,]

Mom100$M20Z<-(Mom100$M20Ratio-mean(Mom100$M20Ratio,na.rm=TRUE))/sd(Mom100$M20Ratio,na.rm=TRUE)
Mom100$M60Z<-(Mom100$M60Ratio-mean(Mom100$M60Ratio,na.rm=TRUE))/sd(Mom100$M60Ratio,na.rm=TRUE)
Mom100$EqWtMR<-(Mom100$M20Z*0.5)+(Mom100$M60Z*0.5)
Mom100$QuickMR<-(Mom100$M20Z*0.75)+(Mom100$M60Z*0.25)
Mom100$SteadyMR<-(Mom100$M20Z*0.25)+(Mom100$M60Z*0.75)

Mom150$M20Z<-(Mom150$M20Ratio-mean(Mom150$M20Ratio,na.rm=TRUE))/sd(Mom150$M20Ratio,na.rm=TRUE)
Mom150$M60Z<-(Mom150$M60Ratio-mean(Mom150$M60Ratio,na.rm=TRUE))/sd(Mom150$M60Ratio,na.rm=TRUE)
Mom150$EqWtMR<-(Mom150$M20Z*0.5)+(Mom150$M60Z*0.5)
Mom150$QuickMR<-(Mom150$M20Z*0.75)+(Mom150$M60Z*0.25)
Mom150$SteadyMR<-(Mom150$M20Z*0.25)+(Mom150$M60Z*0.75)

Mom250$M20Z<-(Mom250$M20Ratio-mean(Mom250$M20Ratio,na.rm=TRUE))/sd(Mom250$M20Ratio,na.rm=TRUE)
Mom250$M60Z<-(Mom250$M60Ratio-mean(Mom250$M60Ratio,na.rm=TRUE))/sd(Mom250$M60Ratio,na.rm=TRUE)
Mom250$EqWtMR<-(Mom250$M20Z*0.5)+(Mom250$M60Z*0.5)
Mom250$QuickMR<-(Mom250$M20Z*0.75)+(Mom250$M60Z*0.25)
Mom250$SteadyMR<-(Mom250$M20Z*0.25)+(Mom250$M60Z*0.75)

Top30LCapEMR<-Mom100[order(Mom100$EqWtMR,decreasing=TRUE),][1:30,]
Top30LCapQMR<-Mom100[order(Mom100$QuickMR,decreasing=TRUE),][1:30,]
Top30LCapSMR<-Mom100[order(Mom100$SteadyMR,decreasing=TRUE),][1:30,]

Top30MCapEMR<-Mom150[order(Mom150$EqWtMR,decreasing=TRUE),][1:30,]
Top30MCapQMR<-Mom150[order(Mom150$QuickMR,decreasing=TRUE),][1:30,]
Top30MCapSMR<-Mom150[order(Mom150$SteadyMR,decreasing=TRUE),][1:30,]

Top30SCapEMR<-Mom250[order(Mom250$EqWtMR,decreasing=TRUE),][1:30,]
Top30SCapQMR<-Mom250[order(Mom250$QuickMR,decreasing=TRUE),][1:30,]
Top30SCapSMR<-Mom250[order(Mom250$SteadyMR,decreasing=TRUE),][1:30,]

write.csv(Top30LCapEMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30LCapEMR.csv",row.names=FALSE)
write.csv(Top30LCapQMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30LCapQMR.csv",row.names=FALSE)
write.csv(Top30LCapSMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30LCapSMR.csv",row.names=FALSE)

write.csv(Top30MCapEMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30MCapEMR.csv",row.names=FALSE)
write.csv(Top30MCapQMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30MCapQMR.csv",row.names=FALSE)
write.csv(Top30MCapSMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30MCapSMR.csv",row.names=FALSE)

write.csv(Top30SCapEMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30SCapEMR.csv",row.names=FALSE)
write.csv(Top30SCapQMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30SCapQMR.csv",row.names=FALSE)
write.csv(Top30SCapSMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/MCap Split Screener Data/Top30SCapSMR.csv",row.names=FALSE)


library(ggplot2)
library(gridExtra)
FinalFrame<-data.frame(Equi_Weighted=Top30LCapEMR$Symbol,Quick_Weighted=Top30LCapQMR$Symbol,Steady_Weighted=Top30LCapSMR$Symbol)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/20-60EQS LCap Momentum Screen.png", height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom100$Date)," LCap Momentum Screen.png"), height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

LatestEntrants<-FinalFrame[,2][!(FinalFrame[,2] %in% FinalFrame[,1])]
MediumEntrants<-FinalFrame[,1][!(FinalFrame[,1] %in% FinalFrame[,3])]
LatestEntrants<-data.frame(LatestEntrants)
MediumEntrants<-data.frame(MediumEntrants)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/LCapLatestEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/LCapMediumEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom100$Date),"LCap LatestEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom100$Date),"LCap MediumEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()
##########
FinalFrame<-data.frame(Equi_Weighted=Top30MCapEMR$Symbol,Quick_Weighted=Top30MCapQMR$Symbol,Steady_Weighted=Top30MCapSMR$Symbol)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/20-60EQS MCap Momentum Screen.png", height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom150$Date)," MCap Momentum Screen.png"), height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

LatestEntrants<-FinalFrame[,2][!(FinalFrame[,2] %in% FinalFrame[,1])]
MediumEntrants<-FinalFrame[,1][!(FinalFrame[,1] %in% FinalFrame[,3])]
LatestEntrants<-data.frame(LatestEntrants)
MediumEntrants<-data.frame(MediumEntrants)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/MCapLatestEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/MCapMediumEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom150$Date),"MCap LatestEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom150$Date),"MCap MediumEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()

###########
FinalFrame<-data.frame(Equi_Weighted=Top30SCapEMR$Symbol,Quick_Weighted=Top30SCapQMR$Symbol,Steady_Weighted=Top30SCapSMR$Symbol)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/20-60EQS SCap Momentum Screen.png", height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom250$Date)," SCap Momentum Screen.png"), height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

LatestEntrants<-FinalFrame[,2][!(FinalFrame[,2] %in% FinalFrame[,1])]
MediumEntrants<-FinalFrame[,1][!(FinalFrame[,1] %in% FinalFrame[,3])]
LatestEntrants<-data.frame(LatestEntrants)
MediumEntrants<-data.frame(MediumEntrants)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/SCapLatestEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/SCapMediumEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom250$Date),"SCap LatestEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom250$Date),"SCap MediumEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()
#######################################Fast Momentum (5/20) Stocks List
MomData<-list(NULL)
for(i in 1:length(Split)){
if(nrow(Split[[i]])<=252){next}
X<-Split[[i]]
X$D1Ret<-RetFuncBackward(X$CLOSE,1)
X$D5Ret<-RetFuncBackward(X$CLOSE,5)
X$D20Ret<-RetFuncBackward(X$CLOSE,20)
QrtrlySD<-sd(X$D1Ret[(length(X$D1Ret)-250):length(X$D1Ret)],na.rm=TRUE)*sqrt(250)
D5Ret<-X$D5Ret[length(X$D5Ret)]
D20Ret<-X$D20Ret[length(X$D20Ret)]
M5Ratio<-D5Ret/QrtrlySD
M20Ratio<-D20Ret/QrtrlySD
Symbol<-unique(X$SYMBOL)
Date<-max(X$Date,na.rm=TRUE)
Out<-data.frame(Date,Symbol,D5Ret,D20Ret,QrtrlySD,M5Ratio,M20Ratio)
MomData[[i]]<-Out}

MomData<-do.call(rbind,MomData)

MCap<-read.csv("MCap.csv",header=TRUE)
MCap<-MCap[order(MCap$Mcap,decreasing=TRUE),]
N500<-MCap$Symbol[1:500]

Mom500<-MomData[MomData$Symbol %in% N500,]

Mom500$M5Z<-(Mom500$M5Ratio-mean(Mom500$M5Ratio,na.rm=TRUE))/sd(Mom500$M5Ratio,na.rm=TRUE)
Mom500$M20Z<-(Mom500$M20Ratio-mean(Mom500$M20Ratio,na.rm=TRUE))/sd(Mom500$M20Ratio,na.rm=TRUE)
Mom500$EqWtMR<-(Mom500$M5Z*0.5)+(Mom500$M20Z*0.5)
Mom500$QuickMR<-(Mom500$M5Z*0.75)+(Mom500$M20Z*0.25)
Mom500$SteadyMR<-(Mom500$M5Z*0.25)+(Mom500$M20Z*0.75)

Fast30EMR<-Mom500[order(Mom500$EqWtMR,decreasing=TRUE),][1:30,]
Fast30QMR<-Mom500[order(Mom500$QuickMR,decreasing=TRUE),][1:30,]
Fast30SMR<-Mom500[order(Mom500$SteadyMR,decreasing=TRUE),][1:30,]

write.csv(Fast30EMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/Fast30EMR.csv",row.names=FALSE)
write.csv(Fast30QMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/Fast30QMR.csv",row.names=FALSE)
write.csv(Fast30SMR,"C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/Fast30SMR.csv",row.names=FALSE)
write.csv(Mom500,paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/Data Downloads/",as.character(unique(Date))," Entire Fast Momentum Data.csv"),row.names=FALSE)

FinalFrame<-data.frame(Equi_Weighted=Fast30EMR$Symbol,Quick_Weighted=Fast30QMR$Symbol,Steady_Weighted=Fast30SMR$Symbol)
library(ggplot2)
library(gridExtra)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/5-20EQS Momentum Screen.png", height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom500$Date)," 5-20 Momentum Screen.png"), height=10, width=6,units="in",res=250)
p<-tableGrob(FinalFrame)
grid.arrange(p)
dev.off()

LatestEntrants<-FinalFrame[,2][!(FinalFrame[,2] %in% FinalFrame[,1])]
MediumEntrants<-FinalFrame[,1][!(FinalFrame[,1] %in% FinalFrame[,3])]
LatestEntrants<-data.frame(LatestEntrants)
MediumEntrants<-data.frame(MediumEntrants)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/5-20LatestEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/5-20MediumEntrants.png", height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom500$Date)," 5-20LatestEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(LatestEntrants))
grid.arrange(p)
dev.off()

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Momentum Screener/History/",unique(Mom500$Date)," 5-20MediumEntrants.png"), height=0.5, width=10,units="in",res=250)
p<-tableGrob(t(MediumEntrants))
grid.arrange(p)
dev.off()

############Sector Momentum Page

Data<-list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022", recursive = TRUE, full.names = TRUE)
Data<-c(Data,list.files(path = "C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2021", recursive = TRUE, full.names = TRUE))
Date1<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/","",Data,fixed=TRUE)
Date2<-gsub("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2021/","",Data,fixed=TRUE)
Date1<-gsub(" IndexData.csv","",Date1)
Date2<-gsub(" IndexData.csv","",Date2)
DateList1<-as.Date(Date1,format="%d-%m-%Y")
DateList2<-as.Date(Date2,format="%d-%m-%Y")

Dates1<-sort(DateList1)
Dates2<-sort(DateList2)
Year1<-substr(Dates1,1,4)
Month1<-substr(Dates1,6,7)
Day1<-substr(Dates1,9,10)
Year2<-substr(Dates2,1,4)
Month2<-substr(Dates2,6,7)
Day2<-substr(Dates2,9,10)

FileList1<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2022/",Day1,"-",Month1,"-",Year1," IndexData.csv")
FileList2<-paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Index Data 2012 Onwards/2021/",Day2,"-",Month2,"-",Year2," IndexData.csv")
DataList<-list(NULL)
DataList[[1]]<-lapply(FileList1,function(x)read.csv(x,header=TRUE,stringsAsFactors=FALSE))
DataList[[2]]<-lapply(FileList2,function(x)read.csv(x,header=TRUE,stringsAsFactors=FALSE))
Data1<-data.table::rbindlist(DataList[[1]],fill=TRUE)
Data2<-data.table::rbindlist(DataList[[2]],fill=TRUE)
Data<-rbind(Data1,Data2)
Imp<-c("Nifty 50","Nifty Next 50","NIFTY Midcap 100","NIFTY Smallcap 100","Nifty Microcap 250","Nifty Auto","Nifty Bank","Nifty Energy","Nifty Financial Services","Nifty FMCG","Nifty IT","Nifty Media","Nifty Metal","Nifty MNC","Nifty Pharma","Nifty PSU Bank","Nifty Realty","Nifty India Consumption","Nifty Commodities","Nifty Infrastructure","Nifty PSE","Nifty CPSE","NIFTY Alpha Low-Volatility 30","Nifty200 Momentum 30","NIFTY SME EMERGE","Nifty Oil & Gas","Nifty Healthcare Index","Nifty India Digital","Nifty Mobility","Nifty Consumer Durables")
ImpData<-Data[Data$Index.Name%in%Imp,]

##############Bounce strategy Implementation
ImpData$Index.Date<-as.Date(ImpData$Index.Date,format="%d-%m-%Y")
Split<-split(ImpData,ImpData$Index.Name,drop=TRUE)

BounceMat<-list(NULL)
for(i in 1:length(Split)){
X<-Split[[i]]
X<-X[order(X$Index.Date),]
z<-nrow(X)
Num<-1:z
Slope60<-round(lm(X$Closing.Index.Value[(z-59):z]~Num[(z-59):z])$coeff[2],2)
Slope5<-round(lm(X$Closing.Index.Value[(z-4):z]~Num[(z-4):z])$coeff[2],2)
AutoCorr<-round(as.numeric(unlist(acf(X$Points.Change[(z-19):z])[ACLag])[1]),3)
Signal<-ifelse(sign(Slope60)==(-1) & sign(Slope5)==1 & sign(AutoCorr)==(-1),"Buy","Nope")
BounceMat[[i]]<-data.frame(Index=unique(X$Index.Name),Date=as.character(max(X$Index.Date)),Slope60=Slope60,Slope5=Slope5,AutoCorr=AutoCorr,Signal=Signal)}
BounceMat<-do.call(rbind,BounceMat)
write.csv(BounceMat,file=paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Bounce Strategy for Index/Alphaleaks Daily Tables/",unique(BounceMat$Date)," IndexBounce.csv"),row.names=FALSE)
rownames(BounceMat)<-rep("",nrow(BounceMat))
png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Bounce Strategy for Index/Alphaleaks Daily Tables/BounceMat.png"), height=9, width=8,units="in",res=250)
p<-tableGrob(BounceMat)
grid.arrange(p)
dev.off()

############Sector Momentum Page Continued
ImpData<-data.frame(ImpData$Index.Name,ImpData$Closing.Index.Value,ImpData$Index.Date)
names(ImpData)<-c("Index","Close","Date")
ImpData$Date<-as.Date(ImpData$Date,format="%d-%m-%Y")
ImpData<-ImpData[order(ImpData$Date),]

Split<-split(ImpData,ImpData$Index)

RetFuncBackward<-function(x,Days){
FuturePrice<-c(x[-c(1:Days)],rep(NA,Days))
PercChange<-(FuturePrice-x)/x
PercChangeBackward<-c(rep(NA,sum(is.na(PercChange))),PercChange[!is.na(PercChange)])
return(PercChangeBackward)}

MomData<-list(NULL)
for(i in 1:length(Split)){
if(nrow(Split[[i]])<=252){next}
X<-Split[[i]]
X$D1Ret<-RetFuncBackward(X$Close,1)
X$D20Ret<-RetFuncBackward(X$Close,20)
X$D60Ret<-RetFuncBackward(X$Close,60)
QrtrlySD<-sd(X$D1Ret[(length(X$D1Ret)-250):length(X$D1Ret)],na.rm=TRUE)*sqrt(250)
D20Ret<-X$D20Ret[length(X$D20Ret)]
D60Ret<-X$D60Ret[length(X$D60Ret)]
M20Ratio<-D20Ret/QrtrlySD
M60Ratio<-D60Ret/QrtrlySD
Symbol<-unique(X$Index)
Date<-max(X$Date,na.rm=TRUE)
Out<-round(data.frame(D20Ret,D60Ret,QrtrlySD,M20Ratio,M60Ratio),2)
Out<-data.frame(Date,Symbol,Out)
MomData[[i]]<-Out}

MomData<-do.call(rbind,MomData)
MomData$M20Z<-round((MomData$M20Ratio-mean(MomData$M20Ratio,na.rm=TRUE))/sd(MomData$M20Ratio,na.rm=TRUE),2)
MomData$M60Z<-round((MomData$M60Ratio-mean(MomData$M60Ratio,na.rm=TRUE))/sd(MomData$M60Ratio,na.rm=TRUE),2)
MomData$EqWtMR<-round((MomData$M20Z*0.5)+(MomData$M60Z*0.5),2)
MomData<-MomData[order(MomData$EqWtMR,decreasing=TRUE),]
write.csv(MomData,paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Sector Momentum Screener/Data Downloads/",as.character(unique(Date))," Sector Momentum.csv"),row.names=FALSE)

MaxMom<-MomData[1:10,]
MaxMom$Symbol<-factor(MaxMom$Symbol,levels=MaxMom$Symbol)
MinMom<-MomData[(nrow(MomData)-10):nrow(MomData),]
MinMom$Symbol<-factor(MinMom$Symbol,levels=MinMom$Symbol)
library(ggplot2)

jpeg("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Sector Momentum Screener/Max Momentum Sectors.jpg",height=6,width=7,units="in",res=250)
G<-ggplot(data=MaxMom,aes(x=Symbol,y=EqWtMR,fill=Symbol))+geom_bar(stat="identity",position="dodge",color="black")+scale_fill_brewer(palette="Spectral")+labs(x="Nifty Sectors",y="Momentum Score (20/60)",fill="Sector",title=paste0(unique(MaxMom$Date)," Max Momentum Sectors"))+theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
G
dev.off()

jpeg("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Sector Momentum Screener/Min Momentum Sectors.jpg",height=6,width=7,units="in",res=250)
G<-ggplot(data=MinMom,aes(x=Symbol,y=EqWtMR,fill=Symbol))+geom_bar(stat="identity",position="dodge",color="black")+scale_fill_brewer(palette="Spectral")+labs(x="Nifty Sectors",y="Momentum Score (20/60)",fill="Sector",title=paste0(unique(MinMom$Date)," Min Momentum Sectors"))+theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
G
dev.off()


####################Sector Rank History

IndexMomList<-list.files("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Sector Momentum Screener/Data Downloads/",full.names = TRUE,pattern="*.csv")
IndexMomData<-list(NULL)
for(i in 1:length(IndexMomList)){
IndexMomData[[i]]<-read.csv(IndexMomList[i],header=TRUE,stringsAsFactors=TRUE)
IndexMomData[[i]]$Rank<-rank(-1*IndexMomData[[i]]$EqWtMR)}
IndexMomData<-do.call(rbind,IndexMomData)

IndexMomData$Date<-as.Date(IndexMomData$Date)
IndexMomData$DateRank<-as.numeric(factor(IndexMomData$Date))
Imp<-IndexMomData[IndexMomData$DateRank>max(IndexMomData$DateRank-7),]

FinalMatrix<-list(NULL)
for(i in 1:length(unique(Imp$Date))){
CurrDate<-as.character(unique(Imp$Date)[i])
CurrMat<-Imp[as.character(Imp$Date)==CurrDate,]
CurrMat<-CurrMat[order(CurrMat$Symbol),]
FinalMatrix[[i]]<-CurrMat$Rank
names(FinalMatrix)[i]<-CurrDate}
FinalMatrix<-do.call(cbind,FinalMatrix)
FinalMatrix<-data.frame(Symbol=CurrMat$Symbol,FinalMatrix)
FinalMatrix$MomSlope<-apply(FinalMatrix[,-1],1,function(x)round(lm(x~c(1:length(x)))$coeff[2],2))*(-1)
names(FinalMatrix)<-gsub("X","",names(FinalMatrix))
FinalMatrix<-FinalMatrix[order(FinalMatrix[,9],decreasing=TRUE),]
library(ggplot2)
library(gridExtra)
png("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Screener Page/Sector Momentum Screener/Sector Rank List.png", height=10, width=11,units="in",res=250)
p<-tableGrob(FinalMatrix)
grid.arrange(p)
dev.off()


###################Nifty Momentum Data
Nf<-ImpData[ImpData$Index=="Nifty 50",]
Nf<-Nf[order(Nf$Date),]


RetFuncBackward<-function(x,Days){
FuturePrice<-c(x[-c(1:Days)],rep(NA,Days))
PercChange<-(FuturePrice-x)/x
PercChangeBackward<-c(rep(NA,sum(is.na(PercChange))),PercChange[!is.na(PercChange)])
return(PercChangeBackward)}


DataCompile<-list(NULL)
for(z in 252:length(unique(Nf$Date))){
Y<-Nf[Nf$Date>=unique(Nf$Date)[z-251] & Nf$Date<=unique(Nf$Date)[z],]
Y<-Y[order(Y$Date),]
X<-Y
X$D1Ret<-RetFuncBackward(X$Close,1)
X$D20Ret<-RetFuncBackward(X$Close,20)
X$D60Ret<-RetFuncBackward(X$Close,60)
QrtrlySD<-sd(X$D1Ret[(length(X$D1Ret)-250):length(X$D1Ret)],na.rm=TRUE)*sqrt(250)
D20Ret<-X$D20Ret[length(X$D20Ret)]
D60Ret<-X$D60Ret[length(X$D60Ret)]
M20Ratio<-D20Ret/QrtrlySD
M60Ratio<-D60Ret/QrtrlySD
Symbol<-unique(X$Index)
Date<-max(X$Date,na.rm=TRUE)
Out<-data.frame(D20Ret,D60Ret,AnnualizedSD=QrtrlySD,M20Ratio,M60Ratio)
Out<-data.frame(Date,Symbol,Out)
DataCompile[[z-251]]<-Out}

FinalCompile<-do.call(rbind,DataCompile)

FinalCompile$Status<-ifelse(sign(FinalCompile$M20Ratio)==(-1) & sign(FinalCompile$M60Ratio)==(-1),"Negative",ifelse(sign(FinalCompile$M20Ratio)==(1) & sign(FinalCompile$M60Ratio)==(1),"Positive",ifelse(sign(FinalCompile$M20Ratio)==(-1) & sign(FinalCompile$M60Ratio)==(1),"Recent Crash","Recent Bounce")))

FinalCompile$Close<-Nf$Close[Nf$Date>=min(FinalCompile$Date)]
PrintMom<-tail(FinalCompile)
PrintMom[,c(3:7)]<-round(PrintMom[,c(3:7)],2)

png(paste0("C:/Users/dhrit/My Drive (alphaleaks.info@gmail.com)/Leaks Page Stuff/Momentum Backtest/Nifty SIP Based on Momentum/Latest Nf Momentum.png"), height=3, width=10,units="in",res=250)
p<-gridExtra::tableGrob(PrintMom)
gridExtra::grid.arrange(p)
dev.off()

