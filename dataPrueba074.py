import os
import glob
import shutil

BASE="H:\\F"

os.chdir(BASE)

origen=os.getcwd()+'\\'

destino="H:\F"

list1 = glob.glob("Dec*")

for dir in list1:
	os.system("ren "+dir+" "+"Nov"+dir[3:len(dir)])