# Enter your code here. Read input from STDIN. Print output to STDOUT
def f_l(i):
    l_max=[]
    di=d[i]
    for j in l:
        if l[j][-1]<di and len(l_max)<len(l[j]):
            l_max=l[j]
        if len(l_max)==max_len:
        	return l_max+[di]
    if l_max==[]:
        return [di]
    else:
        if l_max[-1]<di:
            return l_max+[di]
        else:
            return l_max

try:

	n = int(raw_input())
	assert (1<=n and n<=10**6), "N fuera de rango"
	d=[]
	l={}
	max_len=1
	ai=int(raw_input())
	assert (1<=ai and ai<=10**5), "ai fuera de rango"
	d.append(ai)
	l[0]=[ai]
	print(l)
	for k in range(1,n):
		ai=int(raw_input())
		assert (1<=ai and ai<=10**5), "ai fuera de rango"
		d.append(ai)
		l[k]=f_l(k)
		print(l)
		if len(l[k])>max_len:
			max_len=len(l[k])
except AssertionError,e:
	print("Error"+e)
print(max_len)
