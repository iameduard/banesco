Actualizar R.

I noted that the update.packages()
function can be used to download and install the most recent version of a contributed
package.

Analytic packages for large datasets
R provides several packages for the analysis of large datasets:
The biglm and speedglm packages fit linear and generalized linear models to
large datasets in a memory efficient manner. This offers lm() and glm() type
functionality when dealing with massive datasets.
Several packages offer analytic functions for working with the massive matrices
produced by the bigmemory package . The biganalytics package offers
k-means clustering, column statistics, and a wrapper to biglm. The bigtabulate
package provides table() , split() , and tapply() functionality and the
bigalgebra package provides advanced linear algebra functions.
The biglars package offers least-angle regression, lasso, and stepwise regression
for datasets that are too large to be held in memory, when used in conjunction
with the ff package .
The Brobdingnag package can be used to manipulate large numbers (numbers
larger than 2^1024).


library(Rcmdr)

getwd()
setwd("C:/R64/data")            getwd()                                                  #### CAMBIAR DIRECTORIO DE TRABAJO  ####

   postilion01 = read.csv("PostilionFlujoMensajes01_02.txt", head=TRUE,sep=",")   #####    LEER ARCHIVO EXTERNO      #####

duration=mydata$ts4

A$x refiere a la variable x del dataframe A.

quantile(duration,c(.50,.90,.95))
quantile(duration, c(.50, .90, .95),na.rm=TRUE) 
library(Rcmdr)

help(read.csv)

heisenberg <- read.csv(file="simple.csv",head=TRUE,sep=",")
> heisenberg
trial mass velocity
1     A 10.0       12
2     A 11.0       14
3     B  5.0        8
4     B  6.0       10
5     A 10.5       13
6     B  7.0       11
> summary(heisenberg)
trial      mass          velocity
A:3   Min.   : 5.00   Min.   : 8.00
B:3   1st Bu.: 6.25   1st Qu.:10.25
      Median : 8.50   Median :11.50
      Mean   : 8.25   Mean   :11.33
      3rd Qu.:10.38   3rd Qu.:12.75
      Max.   :11.00   Max.   :14.00


library(Hmisc)
describe(mydata) 

library(psych)
describe.by(mydata, group,...)

The doBy package provides much of the functionality of SAS PROC SUMMARY. 
It defines the desired table using a model formula and a function. 
Here is a simple example.
savehistory("myfile") Salva la historia de los comandos en myfile (default= .Rhistory)

loadhistory("myfile")

save.image("myfile") salvar el workspace en myfile (defaul=.RData)   ##### Salvar workspace area de trabajo

load("myfile") carga un workspace en la sesion actual (default= .RData )

q() Salir R.

source("prog.R") ejecuta un script en la sesion actual de R. ###### Ejecutar script R - comando ######

sink("filename") redirije la salida a filename. ########## SINK ######

sink() retorna la salida al screen.

search() Dice cuales paquetes estan cargados y listos para usar.

help(package="package_name") Ayuda sobre un paquete..

funcion order.clusters() se encuentra en el paquete gclus que debe ser cargado antes de ser utilizado

patientdata$age El $ indica la variable dentro del dataset

attach() agrega un dataframe al search path de R, 
así no tiene que escribirse por ejemplo: patientdata$

summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)
 O.

attach(mtcars)
summary(mpg)
plot(mpg, disp)
plot(mpg, wt)
detach(mtcars)

 O.
with(mtcars, {
summary(mpg, disp, wt)
plot(mpg, disp)
plot(mpg, wt)
})

CASE IDENTIFIERS R

##### VOY A NECESITAR LA HORA EN EL ARCHIVO #####

str(mydata) Muestra la estructuta del data.frame las variables nominales se muestran como factores.

http://cran.r-project.org/doc/manuals/R-data.pdf.

Importar data desde Excel

library(RODBC)
channel <- odbcConnectExcel("myfile.xls")
mydataframe <- sqlFetch(channel, "mysheet")
odbcClose(channel)

www.programmingr.com

Omitir filas con valores misssing NA

newdata <- na.omit(leadership)

Formato de fecha.

strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")

Convertir de fecha a caracter.

strDate <- as.character(dates)

Mexclar dos dataframe horizontalmente por una o varias columnas.

Permite agregar variables al dataframe.

total <- merge(dataframeA, dataframeB, by="ID")

total <- merge(dataframeA, dataframeB, by=c("ID","Country"))

Concatenar horizontalmente dos dataframe, deben tener misma cantidad de filas
y el ordenadas de la misma forma.

total <- cbind(A, B)

Mezclar dos dataframe verticalmente, agregar filas.

total <- rbind(dataframeA, dataframeB)

Seleccionar Observaciones

newdata <- leadership[1:3,]
newdata <- leadership[which(leadership$gender=="M" &
leadership$age > 30),]
attach(leadership)
newdata <- leadership[which(gender=='M' & age > 30),]
detach(leadership)

otra <- mydata[which(nod1=='AtmApp' & nod2=='BODSinkATM'), ]
detach(mydata)

z <- mean(x, trim = 0.05, na.rm=TRUE)

proporciona la media truncada, dejando caer el 5 por ciento más alta y la más baja de las calificaciones y 
los valores perdidos. Utilice la función de ayuda () para obtener más información sobre cada función y sus argumentos.

1 x equals c(1, 2, 3, 4, 5, 6, 7, 8) and mean x equals 4.5 (length(x)
returns the number of elements in x).

2 (x – meanx) subtracts 4.5 from each element of x, resulting in
c(-3.5, -2.5, -1.5, -0.5, 0.5, 1.5, 2.5, 3.5).

3 (x – meanx)^2 squares each element of (x - meanx), resulting in
c(12.25, 6.25, 2.25, 0.25, 0.25, 2.25, 6.25, 12.25).

options(digits=2) limita el numero de decimales a 2

for(i in 1:10) print("Hello")

while (i > 0) {print("Hello"); i <- i - 1}

if (cond) statement1 else statement2

if (is.character(grade)) grade <- as.factor(grade)

ifelse(cond, statement1, statement2)

ifelse(score > 0.5, print("Passed"), print("Failed"))
outcome <- ifelse (score > 0.5, "Passed", "Failed")

> feelings <- c("sad", "afraid")
> for (i in feelings)
print(
switch(i,
happy = "I am glad you are happy",
afraid = "There is nothing to fear",
sad = "Cheer up",
angry = "Calm down now"
)
)
[1] "Cheer up"
[1] "There is nothing to fear"

Funciones escritas por los Usuarios

myfunction <- function(arg1, arg2, ... ){
statements
return(object)
}

Data Agregada

aggregate(x, by, FUN)

Listing 5.10 Aggregating data
> options(digits=3)
> attach(mtcars)
> aggdata <-aggregate(mtcars, by=list(cyl,gear), FUN=mean, na.rm=TRUE)
> aggdata
4 sum((x - meanx)^2) sums each of the elements of (x - meanx)^2),
resulting in 42.


Data Agregada..

> options(digits=3)
> attach(mtcars)
> aggdata <-aggregate(mtcars, by=list(cyl,gear), FUN=mean, na.rm=TRUE)
> aggdata

attach(mydata)
aggdata <- aggregate(mydata, by=list(nod1,nod2), FUN=mean, na.rm=TRUE)

> a <- rep(c("a", "b"), c(6,6))
> x <- rep(c("x", "y", "z"), c(4,4,4))
> df <- data.frame(a=a, x=x, r=rnorm(12))
> aggregate(df[,"r"], list(a=a, x=x), quantile, probs=0.25)
   a x          x
1 a x  0.1693188
2 a y  0.1566322
3 b y -0.2677410
4 b z -0.6505710

###### libreria..

library(doBy)

summaryBy(ts4+ts1+ts2+ts3~xmessage+nod1+nod2, data=mydata, FUN=mystats, na.rm="TRUE")

summaryBy(ts4+ts1+ts2+ts3~xmessage+nod1y2, data=postilion01, FUN=quantile, na.rm="TRUE", probs=0.90)


mystats <- function(x, na.omit=FALSE) {
            if (na.omit)
                x <- x[!is.na(x)]
            m <- quantile(x, c(.50, .90, .95),na.rm=TRUE) 
            return m
         }

#### R con Large Data Set #####
Use el comando rm(list=ls()) para remover todos los objetos from memoria. 
O especifique el objeto que se desea remover rm(object)

Use el comando  .ls.objects() para listar todos los objetos almacenados en (MB) en el workspace.


1138197359;2015-05-03 13:27:45.000;0200;AtmApp;2015-05-03 13:27:45.187;0;BODSinkATM;2015-05-03 13:27:45.287
1138197359;2015-05-03 13:27:45.000;0200;AtmApp;2015-05-03 13:27:45.203;1;BODSinkATM;2015-05-03 13:27:45.283

d1 = datetime.datetime.strptime('2015-05-03 23:59:59.000', '%Y-%m-%d %H:%M:%S.%f')
d3 = datetime.datetime.strptime('2015-05-04 00:00:00.000', '%Y-%m-%d %H:%M:%S.%f')

d2= time.mktime(d1.timetuple()) * 1000 + d1.microsecond / 1000

d4= time.mktime(d3.timetuple()) * 1000 + d3.microsecond / 1000

### R   #######################33


mydata = read.csv("ARCHIVO2.csv")

duration=mydata$ts4
quantile(duration,c(.50,.90,.95))

OJOOOOO...

Cuando R da error de factor, revisar porque debe estar tomando las comas (,) usadas como separador decimal como otro factor, el separador decimal debe ser punto para R (.)


