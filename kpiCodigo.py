db=DAL('sqlite://storage.sqlite')
from gluon.tools import Auth
auth=Auth(db)
auth.define_tables(username=True)

#crud=Crud(db)

db.define_table('servidor',
	Field('desc','string',length=30),
	Field('created_on','datetime',default=request.now),
	Field('created_by','reference auth_user',default=auth.user_id))

db.define_table('dispositivo',
	Field('desc','string', length=30),
	Field('created_on','datetime',default=request.now),
	Field('created_by','reference auth_user',default=auth.user_id))

db.define_table('servicio',
	Field('servidor_id','reference servidor'),
	Field('dispositivo_id','reference dispositivo'),
	Field('desc','string',length=40),
	Field('created_on','datetime',default=request.now),
	Field('created_by','reference auth_user',default=auth.user_id))

db.define_table('informe',
	Field('servicio_id', 'reference servicio'),
	Field('desc','string',length=60),
	Field( 'tipo','string',length=30), #EC: Estudio de Capacidad, SG: Seguimiento
	Field('created_on','datetime',default=request.now),
	Field('created_by','reference auth_user',default=auth.user_id))

db.define_table('accion',
	Field('informe_id','reference informe'),
	Field('id'),
	Field('desc', 'string',length=100),
	Field('status',default='Seguimiento'),
	Field('logro','boolean'),
	Field('created_on','datetime',default=request.now),
	Field('fe_compromiso','datetime'),
	Field('fe_cierre','datetime'),
	Field('created_by','reference auth_user',default=auth.user_id))

db.servidor.desc.requires=IS_NOT_IN_DB(db,'servidor.desc')
db.servidor.desc.requires=IS_NOT_EMPTY()

db.dispositivo.desc.requires=IS_NOT_IN_DB(db,'dispositivo.desc')
db.dispositivo.desc.requires=IS_NOT_EMPTY()

db.servicio.desc.requires=IS_NOT_IN_DB(db,'servicio.desc')
db.servicio.desc.requires=IS_NOT_EMPTY()
db.servicio.servidor_id.requires=IS_NOT_EMPTY()


db.informe.desc.requires=IS_NOT_IN_DB(db,'informe.desc')
db.informe.desc.requires=IS_NOT_EMPTY()
db.informe.servicio_id.requires=IS_NOT_EMPTY()

db.accion.desc.requires=IS_NOT_IN_DB(db,'accion.desc')
db.accion.desc.requires=IS_NOT_EMPTY()
db.accion.informe_id.requires=IS_NOT_EMPTY()

db.servicio.servidor_id.readable=db.servicio.servidor_id.writable=False
db.servicio.dispositivo_id.readable=db.servicio.dispositivo_id.writable=False
db.informe.servicio_id.readable=db.informe.servicio_id.writable=False
db.accion.informe_id.readable=db.accion.informe_id.writable=False

db.servidor.created_on.readable=db.servidor.created_on.writable=False
db.dispositivo.created_on.readable=db.dispositivo.created_on.writable=False
db.servicio.created_on.readable=db.servicio.created_on.writable=False
db.informe.created_on.readable=db.informe.created_on.writable=False
db.accion.created_on.readable=db.accion.created_on.writable=False

db.servidor.created_by.readable=db.servidor.created_by.writable=False
db.dispositivo.created_by.readable=db.dispositivo.created_by.writable=False
db.servicio.created_by.readable=db.servicio.created_by.writable=False
db.informe.created_by.readable=db.informe.created_by.writable=False
db.accion.created_by.readable=db.accion.created_by.writable=False

#Controlers


####

@auth.requires_login()
def index():
	>>>index().has_key('acciones')
	True
	"""
	acciones=db().select(db.accion.ALL,orderby=db.accion.id)
	return dict(acciones=acciones)

def user():
	return dict(form=auth())

#@auth.requires_membership('manager')
def manage():
	grid=SQLFORM.smartgrid(db.accion,linked_tables=['informe'])
	return dict(grid=grid)

#Views
#manage.html
{{extend 'layout.html'}}
<h2>Administrar Interfaz</h2>
{{=grid}}

