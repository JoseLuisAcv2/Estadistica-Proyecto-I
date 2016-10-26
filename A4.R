# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 4
#
#			- Intervalo de confianza del 95% para la media del Ingreso Nacional Bruto en
#			países de bajo ingreso.
#
#			- Intervalo de confianza del 95% para la media del Ingreso Nacional Bruto en
#			países de alto ingreso.
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

library(gridExtra)

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
INB_bajoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)"<1035)
INB_altoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)">12616)

INB_bajoIngreso <- as.numeric(unlist(INB_bajoIngreso["INB per capita (dolares)"]))
INB_altoIngreso <- as.numeric(unlist(INB_altoIngreso["INB per capita (dolares)"]))

# Calculo de intervalo de confianza para bajos ingresos
u <- mean(INB_bajoIngreso)
s <- sd(INB_bajoIngreso)
n <- length(INB_bajoIngreso)
error <- qnorm(0.975)*s/sqrt(n)

bajoIngreso_extIzq <- round(u - error, digits=2)
bajoIngreso_extDer <- round(u + error, digits=2)

# Calculo de intervalo de confianza para altos ingresos
u <- mean(INB_altoIngreso)
s <- sd(INB_altoIngreso)
n <- length(INB_altoIngreso)
error <- qt(0.975,df=n-1)*s/sqrt(n)

altoIngreso_extIzq <- round(u - error, digits=2)
altoIngreso_extDer <- round(u + error, digits=2)

datos <- c("Bajo ingreso", paste("[",as.character(bajoIngreso_extIzq),", ",as.character(bajoIngreso_extDer),"]",sep=" "),
		   "Alto ingreso", paste("[",as.character(altoIngreso_extIzq),", ",as.character(altoIngreso_extDer),"]",sep=" "))

tabla <- matrix(datos, ncol=2, byrow=TRUE)

colnames(tabla) <- c("Tipo de INB", "Intervalo de confianza del 95% para la media")

tabla <- as.table(tabla)
row.names(tabla)=NULL
pdf("A4_Tabla2_IntervaloConfianza_INB.pdf",height=2,width=5)
grid.table(tabla)