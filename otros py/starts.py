import sys
import os
import datetime
import datetime
import time
ts = time.time()
print(datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S'))
os.chdir('C:\\Users\\edujimenez\\PycharmProjects\\starts')
fin=open('C:\\Users\\edujimenez\\PycharmProjects\\starts\\sample.ini')
fou=open('C:\\Users\\edujimenez\\PycharmProjects\\starts\\sample2.ans','w')
bol=True
def calcular():
    starts=[]
    cont = 0
    n=0
    for l1 in lista_total:
        if len(l1)>0:
            cont += len(l1)
        if n == 0:
            starts.append(l1)
        elif n>0:
            l2 = lista_total[n - 1]
            for s in l1:
                cont -= buscar_en_lista(s,l2)
        n+=1
    lista_total.reverse() #invierte la lista para recorrerla alrevez..
    cont2=0
    n=0
    for l1 in lista_total:
        if len(l1)>0:
            cont2 += len(l1)
        if n == 0:
            starts.append(l1)
        elif n>0:
            l2 = lista_total[n - 1]
            for s in l1:
                cont2 -= buscar_en_lista(s,l2)
        n+=1
    print('Case %s: %s') % (num_test_case, min(cont,cont2))
def buscar_en_lista(s,l2):
    m=0
    for s1 in l2:
        if len(s&s1)>0:
            m+=1
            break
    return m
num_test_case=0
list_starts=[]
for line in fin:
    if bol:
        cont_f = 0
        num_test_case+=1
        num_starts = 0
        fc = line.split()
        f = int(fc[0])
        c = int(fc[1])
        lista_total=[]
        bol=False
        continue
    cont_f+=1
    line=line.replace('\n','')
    #recorrer las filas
    list_starts = []
    for k in range(c):  #recorrer las columnas
        if line[k]=='-':
            try:
                if len(list_starts[-1]&set([k-1]))>0:
                    list_starts[-1].add(k)
                else:
                    list_starts.append(set([k]))
            except IndexError,e:
                list_starts.append(set([k]))
    lista_total.append(list_starts)
    if cont_f==f:
        #Escribir el numero de estrellas:
        calcular()
        bol=True
fin.close()
fou.close()
print(datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S'))


