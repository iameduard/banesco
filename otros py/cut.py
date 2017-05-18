try:
print("N?")
n = input()
assert (n>=3 and n<=10**5),"Error introduzca n>=3 and n<=10**5"
print("data?")
data=[]
for k in range(n):
	data.append(input())
hoja={}
hoja[1]=data[0]
edge=[]
for k in range(n-1):
	uv=input()
	uv_=uv.split(' ')
	u=int(uv_[0])
	v=int(uv_[1])
	assert (1<=u and u<=n),"Error introduzca 1<=u and u<=n"
	assert (1<=v and v<=n),"Error introduzca 1<=v and v<=n"
	if u is hoja:
		hoja[v]=data[k+1]
	else:
		hoja[u]=data[k+1]
	edge.append((u,v))
print("data")
print(date)
print("hoja")
print(hoja)
print("edge")
print(edge)
#Crear el arbol



except AssertionError,e:
	print e
	exit()
