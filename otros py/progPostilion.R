setwd("E:/R/data")


setwd("H:/MetricaATM_POS/Tiempos de Respuesta ATM-POS Postilion BOD Julio 2015")

#message,mm,dd,hh,nod1,nod2,ts4,ts1,ts2,ts3
#summaryBy(ts4+ts1+ts2+ts3~mm+dd+hh+message+nod1+nod2, data=mydata, FUN=mean, na.rm="TRUE")


mydata<- read.csv("sal_ppostilion.txt", head=TRUE,sep=",")

attach(mydata)

mismessage<-c(200,220)
misnodos1<-c('AtmApp', 'S7BSrc', 'MDSSrc', 'BODPosExt', 'BODPos', 'WebSrc', 'BODPosCNB')
misnodos2<-c('BODSinkATM', 'BODSinkS7B', 'BODSinkMDS', 'S7BSink', 'MDSSink', 'NIL', 'BODSinkPOS', 'BODAMEX', 'CCCSink', 'S7BAMEX', 'DigiSink', 'MoviSink', 'WebCCCSink', 'BODSinkCNB', 'BODSinkIHP')
misdd<-c('01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31')
mismm<-c('04','05','06','07')
mishh<-c('00','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23')

#mismessage<-c(200,220)
#misnodos1<-c(AtmApp, S7BSrc, MDSSrc, BODPosExt, BODPos, WebSrc, BODPosCNB)
#misnodos2<-c(BODSinkATM, BODSinkS7B, BODSinkMDS, S7BSink, MDSSink, NIL, BODSinkPOS, BODAMEX, CCCSink, S7BAMEX, DigiSink, MoviSink, WebCCCSink, BODSinkCNB, BODSinkIHP)
#misdd<-c(01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31)
#mismm<-c(03,04,05,06,07)
#mishh<-c(00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23)


for(messg in mismessage){

	for(mm1 in mismm){
	
		for(dd1 in misdd) {
	
			for(hh1 in mishh){
		
				for (nodo1 in misnodos1) {
										
					for (nodo2 in misnodos2) {

						print(c("7.",nodo2))

						lts4<-mydata$ts4[message==mm & mm==mm1 & dd==dd1 & hh==hh1 & nod1==nodo1 & nod2==nodo2]
						mts4<-mean(lts4, trim = 0.05, na.rm=TRUE)

						lts3<-mydata$ts3[message==mm & mm==mm1 & dd==dd1 & hh==hh1 & nod1==nodo1 & nod2==nodo2]
						mts3<-mean(lts3, trim = 0.05, na.rm=TRUE)

						lts2<-mydata$ts2[message==mm & mm==mm1 & dd==dd1 & hh==hh1 & nod1==nodo1 & nod2==nodo2]
						mts2<-mean(lts2, trim = 0.05, na.rm=TRUE)

						lts1<-mydata$ts1[message==mm & mm==mm1 & dd==dd1 & hh==hh1 & nod1==nodo1 & nod2==nodo2]
						mts1<-mean(lts1, trim = 0.05, na.rm=TRUE)

						larg<-length(lts4)

						Salida<-c(messg,mm1,dd1,hh1,nodo1,nodo2,larg,mts4,mts1,mts2,mts3)
						write.table(t(Salida),file="H:/MetricaATM_POS/Tiempos de Respuesta ATM-POS Postilion BOD Julio 2015/salida.txt",append=TRUE,row.names=FALSE,col.names=FALSE,sep=",")
					}
				}
			}
		}
	}
}

detach(mydata)
