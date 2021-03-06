#setwd("E:/R/data")


#setwd("H:/BOD/Core TDC/PAQUETES.csv")

#message,mm,dd,hh,nod1,nod2,ts4,ts1,ts2,ts3
#summaryBy(ts4+ts1+ts2+ts3~mm+dd+hh+message+nod1+nod2, data=mydata, FUN=mean, na.rm="TRUE")


mydata<- read.csv("E:/PAQUETES.csv", head=TRUE,sep=";")

attach(mydata)

mispaquetes<-c('IN_KM_LOADINGS_AUTHOMATIZATION.PR_CARGUE_MOVIMIENTO','IN_KM_BATCH_FLOW_LOADING.PR_PROCESO_AUTOMATICO','IN_KM_VALIDATE_BRANCH_FLOW.PR_PROCESA_MVTO_OFICINAS','KE_KM_RATER_INDICATORS_CHANGE.PR_VALIDAR_TASAS_CAMBIO_AUT','KE_KM_RATES_INDICATORS.PR_VALIDAR_TASAS_CAMBIO_AUT','KE_KM_RATES_INDICATORS.PR_VALIDAR_INDICADOR_ECON_AUT','ME_KM_FINANC_CHARGES.PR_PROCESA_CARGOS','CO_KM_COMMISSION_COLLECT.PR_AUTOMATIZACION_PROCESOS','IN_KM_VALIDATE_BRANCH_FLOW.PR_PROCESA_LIBERA_CHEQUES','KE_KM_PRE_DAILY.PR_PROCESA_MOVIMIENTO','KE_KM_BALANCES_UPDATES.PR_PROCESA_MOVIMIENTO','KE_KM_PRESENT_VALUE.PR_VISTA','KE_KM_PRESENT_VALUE.PR_AUTOMATIZACION_PROCESOS','KE_KM_BALANCES_UPDATES.PR_PROCESA_COMPLEMENTO_DIA','KE_KM_APPLY_FAVOUR_BALANCE.PR_AUTOMATIZACION_PROCESOS','AC_KM_GENERATE_ACCOUNTING.PR_CONTABILIDAD_DIARIA_VISTAS','AC_KM_GENERATE_ACCOUNTING.PR_CONTABILIDAD_DIARIA','AC_KM_GENERATE_ACCOUNTING.PR_CONTAB_MVTO_PENDIENTE','AC_KM_GENERATE_ACCOUNTING.PR_CONTAB_MVTO_FRAUDES','AC_KM_GENERATE_ACCOUNTING.PR_CONTAB_MVTO_CONTRACARGOS','AC_KM_GENERATE_ACCOUNTING.PR_CONTAB_MVTO_INTERCAMBIOS','AC_KM_GENERATE_ACCOUNTING.PR_CONTAB_MVTO_TAPAS','AC_KM_GENERATE_ACCOUNTING.PR_CONTAB_NOVEDADES','AC_KM_GENERATE_ACCOUNTING.PR_CONTAB_MVTO_DEPOSITOS','AC_KM_GENERATE_ACCOUNTING.PR_AGRUPA_MOVIMIENTO','AC_KM_ACCOUNT_BALANCES_UPDATE.PR_AUTOMATIZACION_PROCESOS','AC_KM_GENERATE_AUX_CARD.PR_AUTOMATIZACION_PROCESOS','KE_KM_CLIENTS_BALANCES.PR_AUTOMATIZA_PROCESOS_ASIGNA','KE_KM_CLIENTS_BALANCES.PR_PROCESAR_SALDOS','OP_KM_PROCESS_AUTOMATIZATION.PR_CAMBIAR_FECHA_SISTEMA','BD_KM_APLICAR_REINTEGROS.PR_AUTOMATIZACION_PROCESOS','BD_KM_APLICA_CONSUMOS_POS.PR_AUTOMATIZACION_PROCESOS','BD_KM_INTERFACE_UPDATE_COSTC.PR_AUTOMATIZACION_PROCESOS','BD_KM_VALIDA_CONSUMOS_POS.PR_AUTOMATIZACION_PROCESOS','BD_KM_MERCHANT_DB_RESPONSE.PR_AUTOMATIZACION_PROCESOS','BD_KM_PROC_DEB_PAGO_MIN_IBS.PR_AUTOMATIZACION_PROCESOS','BD_KM_PROC_PAGO_INTERTAQ_IBS.PR_AUTOMATIZACION_PROCESOS','IN_KM_OUTCLEAR_PARTICION.PR_AUTOMATIZACION_PROCESOS','IN_KM_OUTCLEAR_ONUS.PR_AUTOMATIZACION_PROCESOS','VE_KM_CADIVI_ACT_DES_CUPOS.PR_AUTOMATIZA_PROCESOS','BD_KM_INTERF_SETM_SAL_FIN_41.PR_AUTOMATIZACION_PROCESOS','BD_KM_INTERF_SETM_TDC_CUOTA_42.PR_AUTOMATIZACION_PROCESOS','BD_KM_INTERF_SETM_CONSUM_43.PR_AUTOMATIZACION_PROCESOS','BD_KM_PAGOS_TARJ_MORA_ICS.PR_AUTOMATIZACION_PROCESOS','BD_KM_DEMOG_TARJ_MORA_ICS.PR_AUTOMATIZACION_PROCESOS','BD_KM_OBLIG_TARJ_MORA_ICS.PR_AUTOMATIZACION_PROCESOS','BD_KM_PAGOS_A_DEUDA_ICS.PR_AUTOMATIZACION_PROCESOS','BD_KM_MOROSIDAD_TARJ_ICS.PR_AUTOMATIZACION_PROCESOS','BD_KM_DB_PAGO_MIN.PR_AUTOMATIZACION_PROCESOS','BD_KM_CARDS_BALANCE_INTERFACE.PR_AUTOMATIZACION_PROCESOS','BD_KM_ACCOUNTING_INTERFACE.PR_AUTOMATIZACION_PROCESOS','BD_KM_MERCHANT_DEPOSIT.PR_AUTOMATIZACION_PROCESOS','BD_KM_MERCHANT_DB.PR_AUTOMATIZACION_PROCESOS','BD_KM_ARCHIVO_PAGVEN.PR_AUTOMATIZACION_PROCESOS','BD_KM_CTRL_TARJ_MORA_ICS.PR_AUTOMATIZACION_PROCESOS','KE_KM_POSTILION_LOAD_TYPES.PR_AUTOMATIZACION_PROCESOS','BD_KM_CONEC_CREDIC_1.PR_AUTOMATIZACION_PROCESOS','AC_KM_GENERATE_ACCOUNTING.PR_AUTOMATIZACION_PROCESOS','MR_KM_MERCHANTS_AFFI_DISAFFI.PR_AUTOMATIZACION_PROCESOS','BD_KM_VALIDATE_ATM.PR_PROCESA_ATM','IN_KM_DAF.PR_AUTOMATIZACION_PROCESOS','BD_KM_SURETY_CARD_ADJ.PR_AUTOMATIZACION_PROCESOS','BD_PARAMETERS_AFFINITY_GROUPS.PR_AUTOMATIZACION_PROCESOS','BD_KM_DEBT_PURCHASE.PR_AUTOMATIZACION_PROCESOS','KE_KM_GENER_ROUND_OFF_TRX.PR_PROCESAR_REDONDEO','KE_KM_ASSIGN_NODES.PR_AUTOMATIZACION_PROCESOS','KE_KM_BILLING.PR_FACTURADOR_CUOTAS','KE_KM_BILLING.PR_FACTURADOR','KE_KM_BILLING_DATES_UPDATE.PR_AUTOMATIZACION_PROCESOS','KE_KM_TRANSFER_BALANCES.PR_TRASLADA_SALDOS_PROCESO','KE_KM_FIXED_FEE.PR_AUTOMATIZACION_PROCESOS','KE_KM_LINE_CURRENCY_BALANCES.PR_PROCESAR_SALDOS','KE_KM_CR_LIMIT_UPDATE.PR_AUTOMATIZA_PROCESOS_ASIGNA','KE_KM_CR_LIMIT_UPDATE.PR_AUTOMATIZACION_PROCESOS','AC_KM_GENERATE_ACCOUNTING.PR_CONTABILIDAD_FACTURACION','BD_KM_ACCOUNT_STATES_SL.PR_AUTOMATIZACION_PROCESOS','BD_UNIFY_SL_STATEMENTS_NODES.PR_AUTOMATIZACION_PROCESOS','BD_KM_ACCOUNT_STATES_WEB.PR_AUTOMATIZACION_PROCESOS','BD_UNIFY_WEB_STATEMENTS_NODES.PR_AUTOMATIZACION_PROCESOS','IN_KM_SE_DEMOGRAPHICS_RESPONSE.PR_AUTOMATIZACION_PROCESOS','IN_KM_ONUS_RESPONSE.PR_AUTOMATIZACION_PROCESOS','BD_KM_EMBOSSING.PR_AUTOMATIZACION_PROCESOS','IN_KM_OUTCLEAR_RESPONSE.PR_AUTOMATIZACION_PROCESOS','ME_KM_DATA_COLLECTION_10.PR_AUTOMATIZACION_PROCESOS','BI_KM_PROCESSES.PR_AUTOMATIZACION_PROCESOS','IN_KM_VALIDATE_INCLEAR_AMEX.PR_PROCESA_INCLEAR','BD_KM_LOAD_VALIDATE_THIRD.PR_PROCESA_MVTO_CONVENIO','BD_KM_LOAD_VALIDATE_THIRD.PR_PROCESA_MVTO_CONVENIO_IATA','IN_KM_INCLEAR_RESPONSE.PR_AUTOMATIZACION_PROCESOS','BD_KM_APPLICATIONS.PR_AUTOMATIZACION_PROCESOS','BD_KM_ARCHIVO_MORA.PR_AUTOMATIZACION_PROCESOS','BD_KM_INTERF_FRAUD_SIAR.PR_AUTOMATIZACION_PROCESOS','BD_KM_DATOS_CLTES_WEB.PR_AUTOMATIZA_PROCESOS','IN_KM_AEGN_ELEC_FRAUDS_REPORTS.PR_AUTOMATIZACION_PROCESOS','BD_KM_CONNECTIVITY_CHANEL_1.PR_AUTOMATIZA_PROCESOS','BD_KM_MEMBERSHIP_REWARDS_POINT.PR_AUTOMATIZACION_PROCESOS','IN_KM_FRAUD_REPOSITORY_UPDATE.PR_AUTOMATIZACION_PROCESOS','IN_KM_BATCH_EXCEPTION.PR_AUTOMATIZACION_PROCESOS','BD_KM_VALIDAR_REINTEGROS.PR_AUTOMATIZACION_PROCESOS','IN_KM_FRAUDS_REPOSITORY_RESPON.PR_AUTOMATIZACION_PROCESOS','AC_KM_OTHERS_ACCOUNTINGS.PR_CONTABILIDAD_CONTINGENTES','KE_KM_MONTHLY_STATISTICAL.PR_AUTOMATIZACION_PROCESOS','BD_KM_ACCOUNT_STATES_MERC.PR_AUTOMATIZACION_PROCESOS','BD_KM_RETENCIONES_ISLR.PR_AUTOMATIZACION_PROCESOS','IN_KM_BATCH_EXCEPTION_RESPONSE.PR_AUTOMATIZACION_PROCESOS','OP_KM_PROCESS_AUTOMATIZATION.PR_VALIDAR_ENVIO_EMAIL')
misdd<-c('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31')
mismm<-c('4','5','6','7','8')
mishh<-c('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23')
misfases<-c('Precierre','Cierre','Postcierre','Otro')
mismin<-c('15','30','45','60')

for(fase in misfases){

	for(paquetes in mispaquetes){

		for(mm in mismm){
		
			for(dd in misdd) {
		
				for(hh in mishh){
					
						dur<-mydata$DURACION[PAQUETES=='IN_KM_LOADINGS_AUTHOMATIZATION.PR_CARGUE_MOVIMIENTO']
						durmax<-quantile(dur, 1.0)
						durmean<-mean(dur, na.rm=TRUE)
						dur90<-quantile(dur, 0.90)
						dur95<-quantile(dur, 0.95)
						dur99<-quantile(dur, 0.99)
						durcant<-length(dur)
						Salida<-c(mm,dd,hh,paquetes,fase,durcant,durmean,dur90,dur95,dur99,durmax)
						write.table(t(Salida),file="E:/paquetes.txt",append=FALSE,row.names=FALSE,col.names=FALSE,sep=",")
				}
			}
		}
	}
}

detach(mydata)
