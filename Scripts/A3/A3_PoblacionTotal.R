# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 3
#
#			Comparación mediante estudio de distribución de la variable "Poblacion total (miles)"
#			entre los países de bajo ingreso y los países de alto ingreso.
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

library(gridExtra)
options(scipen=999)

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
paisesBajoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)"<1035)
paisesAltoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)">12616)

# Datos de distribución de población en países de bajo ingreso.
poblacionBajoIngreso <- as.numeric(unlist(paisesBajoIngreso["Poblacion total (miles)"]))
poblacionBajoIngresoDatos<-summary(poblacionBajoIngreso)
rango <- max(poblacionBajoIngreso) - min(poblacionBajoIngreso)
poblacionBajoIngresoDatos <- c("Bajo Ingreso",poblacionBajoIngresoDatos, round(sd(poblacionBajoIngreso), digits=2), rango)

# Datos de distribución de población en países de alto ingreso.
poblacionAltoIngreso <- as.numeric(unlist(paisesAltoIngreso["Poblacion total (miles)"]))
poblacionAltoIngresoDatos<-summary(poblacionAltoIngreso)
rango <- max(poblacionAltoIngreso) - min(poblacionAltoIngreso)
poblacionAltoIngresoDatos <- c("Alto Ingreso",poblacionAltoIngresoDatos, round(sd(poblacionAltoIngreso), digits=2), rango)

# Tabla de comparación entre población de países de bajo ingreso y países de alto ingreso.
datos <- c(poblacionBajoIngresoDatos, poblacionAltoIngresoDatos)
tabla <- matrix(datos, ncol=9, byrow=TRUE)
colnames(tabla) <- c("Tipo de INB","Mínimo","1er cuartil","Mediana","Media","3er cuartil","Máximo","Desviación Estándar","Rango")
tabla <- as.table(tabla)
row.names(tabla)=NULL
jpeg("A3_Tabla5_PoblacionTotal.jpeg",height=200,width=800)
grid.table(tabla)

# Histograma para países de bajo ingreso
jpeg("A3_Histograma15_PoblacionTotal_BajoIngreso.jpeg")
hist(poblacionBajoIngreso,
	main="Población total (miles) en países de bajo ingreso",
	xlab="Población total (miles)",
	ylab="Nro. países",
	xlim=c(0,1200000),
	ylim=c(0,60)
)

# Histograma para países de alto ingreso
jpeg("A3_Histograma16_PoblacionTotal_AltoIngreso.jpeg")
hist(poblacionAltoIngreso,
	main="Población total (miles) en países de alto ingreso",
	xlab="Población total (miles)",
	ylab="Nro. países",
	xlim=c(0,1200000),
	ylim=c(0,60)
)