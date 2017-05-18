import os
import glob
import shutil
import zipfile
import math

BASE="H:\\BMC Software\Patrol3\BEST1\NTC\Repository"
BASE="H:\\Prueba"

os.chdir(BASE)

origen=os.getcwd()+'\\'

destino="H:\\F\\"

Mes="Nov"
Ano="2015"

list1 = glob.glob(Mes+"*"+Ano+"*")

# Mover los archivos a F:

for dir in list1:
	if os.path.exists(origen):
		ruta=shutil.move(origen+'\\'+dir,destino)
		print('El directorio ha sido movido a',ruta)
	else:
		print('El directorio origen no existe')


try:
    import zlib
    compression = zipfile.ZIP_DEFLATED
except:
    compression = zipfile.ZIP_STORED

modes = { zipfile.ZIP_DEFLATED: 'deflated',
          zipfile.ZIP_STORED:   'stored',
          }

generados=[]

dicc={1:zipfile.ZipFile("H:\\F\\"+Mes+"-01-05-"+str(Ano)+".zip", "w"), \
      2:zipfile.ZipFile("H:\\F\\"+Mes+"-06-10-"+str(Ano)+".zip", "w"), \
      3:zipfile.ZipFile("H:\\F\\"+Mes+"-11-15-"+str(Ano)+".zip", "w"), \
      4:zipfile.ZipFile("H:\\F\\"+Mes+"-16-20-"+str(Ano)+".zip", "w"), \
      5:zipfile.ZipFile("H:\\F\\"+Mes+"-21-25-"+str(Ano)+".zip", "w"), \
      6:zipfile.ZipFile("H:\\F\\"+Mes+"-26-31-"+str(Ano)+".zip", "w")}


for dir in list1:
	#print dir
	dia=dir[4:6]
	dia1=int(dia)
	dia2=dia1+4
	pos=int(math.ceil(float(dia1)/5.0))
	if pos==7:
		pos=6
	#print "Pos ",pos
	nomZip=dir[0:3]+'-'+dia+'-'+'0'*(len(str(dia2))%2)+str(dia2)  #Dec-01 ...Mes-dia
	#print nomZip
	#print "destino/dir",destino+dir
	for dirname, subdirs, files in os.walk(destino+dir):
		dicc[pos].write(dirname)
		for filename in files:
			if ".zip" not in filename:
				dicc[pos].write(os.path.join(dirname, filename),compress_type=compression)

for k in range(1,7):

	dicc[k].close()

# Mover los comprimidos a la ruta \\WKJNSARMIENTO\Gestion de Capacidad\WORKING\ADMINISTRACION\Resp Consola

dicc2={"Jan":"Enero",        \
       "Feb":"Febrero",      \
       "Mar":"Marzo",        \
       "Apr":"Abril",        \
       "May":"Mayo",         \
       "Jun":"Junio",        \
       "Jul":"Julio",        \
       "Aug":"Agosto",       \
       "Sep":"Septiembre",   \
       "Oct":"Octubre",      \
       "Nov":"Noviembre",    \
       "Dec":"Diciembre"     \
      }

BASEf = destino

os.chdir(BASEf)

os.system("dir ")

origen2=os.getcwd()+'\\'

destino2="X:\\WORKING\ADMINISTRACION\Resp Consola"

destino2="H:\\X\Resp Consola"

listF = glob.glob("*.zip*")

# Mover los archivos a F:

for dir in listF:
	# Mover los archivos a F:
	Mes=dir[0:3]
	Ano=dir[10:14]
	dir2=destino2+"\\"+dicc2[Mes]+" "+str(Ano)
	print dir2
	try:
		os.stat(dir2)
	except:
		os.mkdir(dir2)
	ruta=shutil.move(dir,dir2)

#Eliminar Archivos de F:

BASEf = destino

os.chdir(BASEf)

list1 = glob.glob(Mes+"*")

# Mover los archivos a F:

for dir in list1:
	shutil.rmtree("H:\\F\\"+dir)


