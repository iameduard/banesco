
import threading

def h():
	execfile("mar01.py")
	execfile("mar02.py")
	print "Listo.."

t.threading.Timer(8500,h)
t.start()
print "Espera.."
