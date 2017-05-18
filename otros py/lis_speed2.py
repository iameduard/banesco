# Enter your code here. Read input from STDIN. Print output to STDOUT
def f_l(i):
    l_max=[]
    di=d[i]
    n=len(lf)
    for clave in list(reversed(range(n))):
    	for listaj in lf[clave+1]:
	        if listaj[-1]<di:
	        	l_max=listaj
	        	return l_max+[di]
    return l_max+[di]

try:
	lf={} #diccionario con clave i (longitud de LIS) y valor una lista de los l[i] que tengan esa longitud)
	n = int(raw_input())
	assert (1<=n and n<=10**6), "N fuera de rango"
	d=[]
	l={}
	max_len=1
	ai=int(raw_input())
	assert (1<=ai and ai<=10**5), "ai fuera de rango"
	d.append(ai)
	l[0]=[ai]
	lf[1]=[l[0]]
	#print(l)
	for k in range(1,n):
		ai=int(raw_input())
		assert (1<=ai and ai<=10**5), "ai fuera de rango"
		d.append(ai)
		l[k]=f_l(k)
		lk=len(l[k])
		if lf.has_key(lk):
			lf[lk].append(l[k])
		else:
			lf[lk]=[l[k]]
		#print(l)
		if len(l[k])>max_len:
			max_len=len(l[k])
except AssertionError,e:
	print("Error"+e)
print(lf)
print(l)
print(max_len)
