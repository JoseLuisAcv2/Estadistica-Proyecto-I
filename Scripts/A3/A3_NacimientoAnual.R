# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 3
#
#			Comparación mediante estudio de distribución de la variable "Nacimientos anuales (miles)"
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

# Datos de distribución de nacimientos anuales en países de bajo ingreso.
nacimientoBajoIngreso <- as.numeric(unlist(paisesBajoIngreso["Nacimientos anuales (miles)"]))
nacimientoBajoIngresoDatos<-summary(nacimientoBajoIngreso)
rango <- max(nacimientoBajoIngreso) - min(nacimientoBajoIngreso)
nacimientoBajoIngresoDatos <- c("Bajo Ingreso",nacimientoBajoIngresoDatos, round(sd(nacimientoBajoIngreso), digits=2), rango)

# Datos de distribución de nacimientos anuales en países de alto ingreso.
nacimientoAltoIngreso <- as.numeric(unlist(paisesAltoIngreso["Nacimientos anuales (miles)"]))
nacimientoAltoIngresoDatos<-summary(nacimientoAltoIngreso)
rango <- max(nacimientoAltoIngreso) - min(nacimientoAltoIngreso)
nacimientoAltoIngresoDatos <- c("Alto Ingreso",nacimientoAltoIngresoDatos, round(sd(nacimientoAltoIngreso), digits=2), rango)

# Tabla de comparación entre nacimientos de países de bajo ingreso y países de alto ingreso.
datos <- c(nacimientoBajoIngresoDatos, nacimientoAltoIngresoDatos)
tabla <- matrix(datos, ncol=9, byrow=TRUE)
colnames(tabla) <- c("Tipo de INB","Mínimo","1er cuartil","Mediana","Media","3er cuartil","Máximo","Desviación Estándar","Rango")
tabla <- as.table(tabla)
row.names(tabla)=NULL
jpeg("A3_Tabla6_NacimientoAnual.jpeg",height=200,width=800)
grid.table(tabla)

# Histograma para países de bajo ingreso
jpeg("A3_Histograma17_NacimientoAnual_BajoIngreso.jpeg")
hist(nacimientoBajoIngreso,
	main="Nacimientos anuales (miles) en países de bajo ingreso",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,70)
)

# Histograma para países de alto ingreso
jpeg("A3_Histograma18_NacimientoAnual_AltoIngreso.jpeg")
hist(nacimientoAltoIngreso,
	main="Nacimientos anuales (miles) en países de alto ingreso",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,70)
)