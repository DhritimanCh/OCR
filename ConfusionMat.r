#returns the caret::confusionMatrix without much hassle

ConfusionMat<-function(Predictor,Reference){
T<-table(Predictor,Reference)
Vector<-c(T)
A<-Vector[1]
C<-Vector[2]
B<-Vector[3]
D<-Vector[4]
Sensitivity<-A/(A+C)
Specificity<-D/(B+D)
Prevalence<-(A+C)/(A+B+C+D)
RevSpecificity<-(1-Specificity)
RevSensitivity<-(1-Sensitivity)
RevPrevalence<-(1-Prevalence)
PPV<-(Sensitivity*Prevalence)/((Sensitivity*Prevalence)+(RevSpecificity*RevPrevalence))
NPV<-(Specificity*(RevPrevalence))/(((RevSensitivity)*Prevalence)+((Specificity)*(RevPrevalence)))
DetectionRate<-A/(A+B+C+D)
DetectionPrevalence<-(A+B)/(A+B+C+D)
Accuracy<-(Sensitivity+Specificity)/2
Precision<-A/(A+B)
Recall<-A/(A+C)
output<-t(data.frame(Sensitivity,Specificity,Prevalence,PPV,NPV,DetectionRate,DetectionPrevalence,Accuracy,Precision,Recall))
predictor<-as.character(paste0("Predictor is ",deparse(substitute(Predictor))))
reference<-as.character(paste0("Reference is ",deparse(substitute(Reference))))
freq.table<-T
perc.table<-round(prop.table(T)*100,2)
return(list(output=output,pred=predictor,ref=reference,freq.table=freq.table,perc.table=perc.table))}
