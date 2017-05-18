import sys
import os

print sys.argv[1]+" "+sys.argv[2]

os.chdir(sys.argv[1])

k = sys.argv[2]
lista_definiciones=sorted(file(k))
file("_"+k,"w").writelines(lista_definiciones)