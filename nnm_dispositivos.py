# -*- coding: utf-8 -*-

"""

PROCESAMIENTO ARCHIVO DISPOSITIVOS NNM.

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
BASE="C:\\STI\\NNM\\NOVIEMBRE\\DispNov\\"
os.chdir(BASE)
origen=os.getcwd()+'\\'
list1 = glob.glob("DispNov*")

#list1 = glob.glob("prueba.txt")

#C:\\Users\\edujimenez\\Downloads\\NNM Split\\Reporte Mensual de Interfaces Red Banesco.xls

fcompara    =open(BASE+"compara.csv")
fnodos      =open(BASE+"Nodos.csv")
fenca       =open(BASE+"encabezado.txt")

#Modificar el nombre del archivo de interfaces..
#wb = openpyxl.load_workbook(BASE+"Reporte Mensual de Interfaces Red Banesco.xls")
#wb1 = xlrd.open_workbook(r'C:\\Users\\edujimenez\\Downloads\\NNM Split\\Reporte Mensual de Interfaces Red Banesco.xls')

cant_reg  = 0
cant_file = 0
compara   ={}
nodos=[]
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
    farch_sal.write(encabezado+'\n')
    farch_sal_no.write(encabezado+'\n')
    #Escribe los registros..
    cant=0
    for line in farch:
        cant=cant+1
        if not cant%50000: 
            print('cant reg:'+str(cant))
        campo=line.strip().split('\t')
        if True:
            try:
                Nombre_nodo            =campo[0]
                Hora                   =campo[1]
                Disponibilidad_promedio=campo[2] #No va.
                Tiempo_respuesta_ICMP  =campo[3]
                Utilizacion_memoria    =campo[4]
                utilizacion_cpu_5_min  =campo[5]
                Utilizacion_bufer      =campo[6]
                Utilizacion_backplane  =campo[7]
                Tasa_fallos_bufer      =campo[8]
                Tasa_falta_memoria_bufer  =campo[9]

                #disponibilidad_promedio_2        =campo[17]
                #Transformar nombre del nodo..
                nombre_nodo1=Nombre_nodo.strip().replace('\x00','').replace(' ','')
                #print(nombre_nodo1)
                #nombre_nodo1=nombre_nodo1.replace(' ','')
                #print('nombre  nodo:'+nombre_nodo1)
                if nombre_nodo1.replace('\x00','').upper() in compara:
                    Nombre_nodo=compara[nombre_nodo1]
                    #print(Nombre_nodo)
                #Verifica si la interfaz esta dentro de las permitidas..
                Nombre_nodo_2=Nombre_nodo.replace(' ','')
                #print('Archivo %s nombre  nodo e interfaz %s:' %(archivo_s,nombre_nodo_interfaz))
                registro_intf=                  \
                Nombre_nodo+'\t'+ \
                Hora+'\t'+ \
                Disponibilidad_promedio+'\t'+ \
                Tiempo_respuesta_ICMP+'\t'+ \
                Utilizacion_memoria+'\t'+ \
                utilizacion_cpu_5_min+'\t'+ \
                Utilizacion_bufer+'\t'+ \
                Utilizacion_backplane+'\t'+ \
                Tasa_fallos_bufer+'\t'+ \
                Tasa_falta_memoria_bufer+'\n'
                #disponibilidad_promedio_2+';\n'
                #print(Nombre_nodo)
                if Nombre_nodo_2.replace('\x00','').upper() in nodos:
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
        compara[campo[0]]=campo[1].replace('\n','').replace('\x00','').upper()

print("compara")
print(compara)

for line in fnodos.readlines():
    campoi=line.split(';')
    nodos.append(campoi[0].replace(' ','').replace('\n','').replace('\x00','').upper())

print("Nodos\n"*10)
print(nodos)
#Ciclo principal para leer los splits..

nro_arch=1
for arch in list1:
    print("Procesando archivo:%s" %nro_arch)
    nro_arch+=1
    proc_file(arch,encabezado)
              
#Cierra archivos de control
fcompara.close()
fnodos.close()

        



# -*- coding: utf-8 -*-

