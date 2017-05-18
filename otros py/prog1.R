setwd("H:/BOD/postilion/PostilionFlujoMensajesAbril15-01")
mydata<- read.csv("PruebaAbril.txt", head=TRUE,sep=",")
getwd()
misnodos1<-c('AtmApp', 'S7BSrc', 'MDSSrc', 'BODPosExt', 'BODPos', 'WebSrc', 'BODPosCNB')
misnodos2<-c('BODSinkATM', 'BODSinkS7B', 'BODSinkMDS', 'S7BSink', 'MDSSink', 'NIL', 'BODSinkPOS', 'BODAMEX', 'CCCSink', 'S7BAMEX', 'DigiSink', 'MoviSink', 'WebCCCSink', 'BODSinkCNB', 'BODSinkIHP')
misnodos1
for (nodo1 in misnodos1) {
	for (nodo2 in misnodos2) {
	#lts4<-mydata$ts4[nod1==nodo1 & nod2==nodo2]
	#subset(mydata, nod2=="MDSSink" & nod1=="BODPos")$ts4[1:5]
	lts4<-subset(mydata, nod1==nodo1 & nod2==nodo2)$ts4
	ts4p95<-quantile(lts4,0.95)
	ts4pmax<-quantile(lts4,1.0)
	Salida<-c(nodo1,nodo2,ts4p95,ts4pmax)
	write.csv(Salida,file="salida1806.txt",append=TRUE,row.names=FALSE,col.names=FALSE,sep=",")
	}
}