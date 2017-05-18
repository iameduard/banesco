# -*- coding: utf-8 -*-

"""

PROCESAMIENTO ARCHIVO INTERFACEZ NNM.

"""
from   math     import *
#from   openpyxl import Workbook
#import openpyxl
#import numpy as np
import operator
import datetime
import time
import sys
import glob
import shutil
import os


#JOB         SYSTEM EXISTE                      START_TIME       END_TIME
#SC0002M    S10A2849    SISTEMA INTEGRAL DE COBROS  31/08/2015 23:40    31/08/2015 23:40

BASE="C:\\Users\\edujimenez\\Downloads\\NNM Split\\"
BASE="C:\\Users\\julio\\Downloads\\Interfaces NNM\\"
BASE="C:\\STI\\NNM\\NOVIEMBRE\\IntNov\\"

os.chdir(BASE)
origen=os.getcwd()+'\\'
list1 = glob.glob("RepoNov*")
#list1 = glob.glob("prueba.txt")

#C:\\Users\\edujimenez\\Downloads\\NNM Split\\Reporte Mensual de Interfaces Red Banesco.xls
fcompara    =open(BASE+"compara.csv")
finterfaces =open(BASE+"interfaces.csv")
fenca       =open(BASE+"encabezado.txt")
#Modificar el nombre del archivo de interfaces..
#wb = openpyxl.load_workbook(BASE+"Reporte Mensual de Interfaces Red Banesco.xls")
#wb1 = xlrd.open_workbook(r'C:\\Users\\edujimenez\\Downloads\\NNM Split\\Reporte Mensual de Interfaces Red Banesco.xls')

cant_reg  = 0
cant_file = 0
compara   ={}
interfaces=[]
#encabezado=[]

def proc_file(archivo,encabezado):
    #abre el archivo del split..
    farch=open(archivo)
    #abre el archivo procesado como escritura..
    archivo_s='sal_'+archivo[-3]+archivo[-2]+archivo[-1]+'.txt'
    farch_sal=open(archivo_s,'w')
    archivo_s_no='sal_no'+archivo[-3]+archivo[-2]+archivo[-1]+'.txt'
    farch_sal_no=open(archivo_s_no,'w')
    #Escribe el encabezado..
    farch_sal.write(encabezado)
    farch_sal_no.write(encabezado)
    #Escribe los registros..
    cant=0
    for line in farch:
        cant=cant+1
        if not cant%50000: 
            print('cant reg:'+str(cant))
        campo=line.strip().split('\t')
        if True:
            try:
                nombre_Type1_InterfaceGroup      =campo[0]
                nombre_nodo                      =campo[1]
                descrip_interfaz                 =campo[2] #No va.
                alias_interfaz                   =campo[3]
                nombre_interfaz                  =campo[4]
                velocidad_interfaz_entrada_salida=campo[5]
                hora                             =campo[6]
                utilizacion_promedio             =campo[7]
                utilizacion_entrente_promedio    =campo[8]
                utilizacion_saliente_promedio    =campo[9]
                rendimiento_entrante_bps_avg     =campo[10]
                rendimiento_saliente_bps_avg     =campo[11]
                disponibilidad_promedio          =campo[12]
                tasa_errores_entrantes_promedio  =campo[13]
                tasa_errores_saliente_promedio   =campo[14]
                tasa_descartes_entrantes_promedio=campo[15]
                tasa_descartes_saliente_promedio =campo[15]
                descartes_cola_tasa_entrada_avg  =campo[16]
                descartes_cola_tasa_salida_avg   =campo[16]
                #disponibilidad_promedio_2        =campo[17]
                #Transformar nombre del nodo..
                nombre_nodo1=nombre_nodo.strip().replace('\x00','').replace(' ','')
                #nombre_nodo1=nombre_nodo1.replace(' ','')
                #print('nombre  nodo:'+nombre_nodo1)
                if nombre_nodo1.upper() in compara:
                    nombre_nodo=compara[nombre_nodo1]
                #Verifica si la interfaz esta dentro de las permitidas..
                nombre_nodo_interfaz=nombre_nodo+' '+nombre_interfaz
                nombre_nodo_interfaz_b=nombre_nodo_interfaz.replace(' ','')
                #print('Archivo %s nombre  nodo e interfaz %s:' %(archivo_s,nombre_nodo_interfaz))
                registro_intf=                  \
                nombre_Type1_InterfaceGroup+'\t'+ \
                nombre_nodo+'\t'+ \
                descrip_interfaz+'\t'+ \
                alias_interfaz+'\t'+ \
                nombre_interfaz+'\t'+ \
                velocidad_interfaz_entrada_salida+'\t'+ \
                hora+'\t'+ \
                utilizacion_promedio+'\t'+ \
                utilizacion_entrente_promedio+'\t'+ \
                utilizacion_saliente_promedio+'\t'+ \
                rendimiento_entrante_bps_avg+'\t'+ \
                rendimiento_saliente_bps_avg+'\t'+ \
                disponibilidad_promedio+'\t'+ \
                tasa_errores_entrantes_promedio+'\t'+ \
                tasa_errores_saliente_promedio+'\t'+ \
                tasa_descartes_entrantes_promedio+'\t'+ \
                tasa_descartes_saliente_promedio+'\t'+ \
                descartes_cola_tasa_entrada_avg+'\t'+ \
                descartes_cola_tasa_salida_avg+'\n'
                #disponibilidad_promedio_2+';\n'
                if nombre_nodo_interfaz_b.replace('\x00','').upper() in interfaces:
                    farch_sal.write(registro_intf.replace('\x00',''))
                else:
                    farch_sal_no.write(line.replace('\x00',''))
            except IndexError:
                pass

    #Cerrar el archivo procesado..
    farch_sal.close()
    farch_sal_no.close()

for line in fenca.readlines():
    campo=line.split('\t')
    #nig,nn,_,*resto=campo
    #encabezado=nig+"\t"+nn+""+'\t'.join(resto)+'\n'
    encabezado=line
  
for line in fcompara.readlines():
    campo=line.split('\t')
    if campo[0] not in compara:
        compara[campo[0]]=campo[1].upper()

for line in finterfaces.readlines():
    campoi=line.split(';')
    interfaces.append(campoi[0].replace(' ','').replace('\n','').upper())

#Ciclo principal para leer los splits..

nro_arch=1
for arch in list1:
    print("Procesando archivo:%s" %nro_arch)
    nro_arch+=1
    proc_file(arch,encabezado)
              
#Cierra archivos de control
fcompara.close()
finterfaces.close()

        



# -*- coding: utf-8 -*-

