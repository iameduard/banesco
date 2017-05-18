setwd("E:/Informes Eduardo/Estudios de Capacidad/Compensacion")

mydata<- read.csv("snode098.csv", head=TRUE,sep=";")
attach(mydata)
lista<-unique(mydata$FECHA)
for(fec in lista) {
	cpuf<-mydata$CPU[FECHA==fec]
	cpufmean<-mean(cpuf)
	cpuf95<-quantile(cpuf,0.95,na.rm=TRUE)
	cpufmax<-quantile(cpuf,1.0,na.rm=TRUE)
	Salida<-c(fec,cpufmean,cpuf95,cpufmax)
	write.table(t(Salida),file="E:/Informes Eduardo/Estudios de Capacidad/Compensacion/salida011015_2.txt",append=TRUE,row.names=FALSE,col.names=FALSE,sep=",")
}
detach(mydata)

