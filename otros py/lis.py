def f_l(i):
	if i==0:
		return [d[0]]
	else:
		l_max=[]
		for j in range(i+1):
			if j<i and d[j]<d[i]:
				if (len(l[j]))>=(len(l_max)):
					l_max=l[j]
		return l_max+[d[i]]

try:
	n = int(raw_input())
	assert (1<=n and n<=10**6), "N fuera de rango"
	d=[]
	l={}
	max_len=1
	for k in range(n):
		ai=int(raw_input())
		assert (1<=ai and ai<=10**5), "ai fuera de rango"
		d.append(ai)
		l[k]=f_l(k)
		if len(l[k])>max_len:
			max_len=len(l[k])
except AssertionError,e:
	print("Error"+e)
#print(l)
print(max_len)
