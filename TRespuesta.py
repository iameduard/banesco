#funcion que dados dos timestamp devuelve el tiempo transcurrido en miliseg
# ts1 y ts2 : tienen este formato 2015-05-03 13:27:46.670
def TResp(ts1,ts2)
import datetime
date_object = datetime.strptime(ts1, '%Y-%m-%d %H:%M:%S')

d1 = datetime.datetime.strptime(ts1, '%Y-%m-%d %H:%M:%S.f')
d2 = datetime.datetime.strptime(ts2, '%Y-%m-%d %H:%M:%S.f')





