# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 3
#
#			Comparación mediante estudio de distribución de la variable "INB per capita (dolares)"
#			entre los países de bajo ingreso y los países de alto ingreso.
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

library(gridExtra)

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
paisesBajoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)"<1035)
paisesAltoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)">12616)

# Datos de distribución de INB en países de bajo ingreso.
INBbajoIngreso <- as.numeric(unlist(paisesBajoIngreso["INB per capita (dolares)"]))
INBbajoIngresoDatos<-summary(INBbajoIngreso)
rango <- max(INBbajoIngreso) - min(INBbajoIngreso)
INBbajoIngresoDatos <- c("Bajo Ingreso",INBbajoIngresoDatos, round(sd(INBbajoIngreso), digits=2), rango)

# Datos de distribución de INB en países de alto ingreso.
INBaltoIngreso <- as.numeric(unlist(paisesAltoIngreso["INB per capita (dolares)"]))
INBaltoIngresoDatos<-summary(INBaltoIngreso)
rango <- max(INBaltoIngreso) - min(INBaltoIngreso)
INBaltoIngresoDatos <- c("Alto Ingreso",INBaltoIngresoDatos, round(sd(INBaltoIngreso), digits=2), rango)

# Tabla de comparación entre INB de países de bajo ingreso y países de alto ingreso.
datos <- c(INBbajoIngresoDatos, INBaltoIngresoDatos)
tabla <- matrix(datos, ncol=9, byrow=TRUE)
colnames(tabla) <- c("Tipo de INB","Mínimo","1er cuartil","Mediana","Media","3er cuartil","Máximo","Desviación Estándar","Rango")
tabla <- as.table(tabla)
row.names(tabla)=NULL
jpeg("A3_Tabla4_INBperCapita.jpeg",height=200,width=800)
grid.table(tabla)

# Histograma para países de bajo ingreso
jpeg("A3_Histograma13_INBperCapita_BajoIngreso.jpeg")
hist(INBbajoIngreso,
	main="INB per cápita (dólares) en países de bajo ingreso",
	xlab="INB per cápita (dólares)",
	ylab="Nro. países",
	xlim=c(0,50000),
	ylim=c(0,12)
)

# Histograma para países de alto ingreso
jpeg("A3_Histograma14_INBperCapita_AltoIngreso.jpeg")
hist(INBaltoIngreso,
	main="INB per cápita (dólares) en países de alto ingreso",
	xlab="INB per cápita (dólares)",
	ylab="Nro. países",
	xlim=c(0,50000),
	ylim=c(0,12)
)