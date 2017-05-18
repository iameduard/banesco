class Node(object):
    def __init__(self, data = None, next_node = None):
        self.data = data
        self.next = next_node

 def has_cycle(head):
 	l=[]
 	l.append(head)
 	flag=1
 	while head.next!=None:
 		if head.next in l:
 			flag=0
 			break
 	return flag


x1=Node(1)
print(has_cycle(x1))
x2=Node(2,x1)
print(has_cycle(x2))
x3=Node(3,x2)
print(has_cycle(x3))
x4=Node(4,Node(3,Node(2,Node(1,3))))
print(has_cycle(x4))


