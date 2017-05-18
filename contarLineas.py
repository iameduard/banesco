import operator
import sys

fr=open("1A.csv")
cont=0

#fr=open("header.txt")
for line in fr.xreadlines():
	cont=cont+1
print cont