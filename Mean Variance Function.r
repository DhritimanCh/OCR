#How to use:
#Function uses 2 arguments:
#1. Data frame of price values of assets within portfolio. Each column for each asset. DO NOT INCLUDE DATE as one of the columns being passed into the function.
#2. Precision of portfolio composition required. Default is "low" (minimum allocation size=10%). Precision "medium" has min alloc at 5%, and "high" has min alloc at 1%. The further we try to improve precision and more the assets in portfolio, longer the calculation will take. The weight matrix generated increases exponentially with number of assets.
#Example. 
#Portfolio<-MeanVar(data,"low")
#Portfolio$best_wt
#Portfolio$max_return
#Portfolio$wt_data
#PS. Return and weights in output are in percentage and will be in time scale as presented in data. Risk is in SD terms.

MeanVar<-function(x,precision=c("high","medium","low"),Riskfree){
if(missing(Riskfree)){Riskfree=0.03}
if(missing(precision)) {precision="low"}
if(precision=="high"&ncol(x)>5) stop("The weight matrix will be huge.. Reduce number of assets or reduce precision")
if(precision=="medium"&ncol(x)>10) stop("The weight matrix will be huge.. Reduce number of assets or reduce precision")
if(precision=="low"&ncol(x)>20) stop("The weight matrix will be huge.. Reduce number of assets or reduce precision")
if(!require(partitions))install.packages("partitions")
library(partitions)
Names<-names(x)
RetData<-list(NULL)
for(i in 1:ncol(x)){
PrevClose<-c(NA,x[,i][-nrow(x)])
Ret<-(x[,i]-PrevClose)/PrevClose
RetData[[i]]<-Ret}
#Ret<-log(x[,i]/PrevClose)
#RetData[[i]]<-Ret}
RetData<-matrix(unlist(RetData),ncol=length(RetData),byrow=FALSE)
MeanRet<-sapply(data.frame(RetData),function(x)mean(x,na.rm=TRUE))
print(MeanRet*100)
if(precision=="high") WtMat<-compositions(100,ncol(x))/100
if(precision=="medium") WtMat<-compositions(20,ncol(x))/20
if(precision=="low") WtMat<-compositions(10,ncol(x))/10
WtMat<-as.matrix(WtMat)
RetMat<-t(MeanRet*WtMat)
Return<-(((rowSums(RetMat)-(Riskfree/365))+1)^250-1)#Annualized return after incorporation of riskfree rate
Cov<-cov(RetData[-1,])
VarVector<-apply(t(WtMat),1,function(y)t(y)%*%Cov%*%y)
Risk<-sqrt(VarVector)*sqrt(250)#Annualized risk
Sharpe<-Return/Risk
WtMat<-t(WtMat)
colnames(WtMat)<-paste0(Names,"_Wt")
WtMat<-WtMat*100
WtData<-data.frame(WtMat,Return=Return,Risk=Risk,Sharpe)
rm(WtMat)
gc()
BestWt<-WtData[WtData$Sharpe==max(WtData$Sharpe),]
MaxRet<-WtData[WtData$Return==max(WtData$Return),]
Outlist<-list(wt_data=WtData,best_wt=BestWt,max_return=MaxRet)
return(Outlist)}




