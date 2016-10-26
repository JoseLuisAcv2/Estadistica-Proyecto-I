# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 5
#
#			- Intervalo de confianza del 95% para la proporción de los países con
#			bajo ingreso.
#
#			- Intervalo de confianza del 95% para la proporción de los países con
#			alto ingreso.
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

library(gridExtra)

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
INB_bajoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)"<1035)
INB_altoIngreso <- subset(datosUnicef, datosUnicef$"INB per capita (dolares)">12616)

total <- nrow(datosUnicef)
cantidadBajos <- nrow(INB_bajoIngreso)
cantidadAltos <- nrow(INB_altoIngreso)

# Calculo de intervalo de confianza para bajos ingresos
pBajos <- cantidadBajos/total
qBajos <- 1 - pBajos
error <- qnorm(0.975)*sqrt(pBajos*qBajos/total)

bajoIngreso_extIzq <- round(pBajos - error, digits=2)
bajoIngreso_extDer <- round(pBajos + error, digits=2)

# Calculo de intervalo de confianza para altos ingresos
pAltos <- cantidadAltos/total
qAltos <- 1 - pAltos
error <- qnorm(0.975)*sqrt(pAltos*qAltos/total)

altoIngreso_extIzq <- round(pAltos - error, digits=2)
altoIngreso_extDer <- round(pAltos + error, digits=2)

# Generar tablas para mostrar resultados
datos <- c(
	"Bajo ingreso",
	cantidadBajos,
	total,
	round(pBajos, digits=3),
	paste("[",as.character(bajoIngreso_extIzq),", ",as.character(bajoIngreso_extDer),"]",sep=" "),
	"Alto ingreso",
	cantidadAltos,
	total,
	round(pAltos, digits=3),
	paste("[",as.character(altoIngreso_extIzq),", ",as.character(altoIngreso_extDer),"]",sep=" ")
)

tabla <- matrix(datos, ncol=5, byrow=TRUE)

colnames(tabla) <- c("Tipo de INB", "Cantidad de países", "Cantidad total de países", "Proporción muestral", "Intervalo de confianza del 95% para la proporción real")

tabla <- as.table(tabla)
row.names(tabla)=NULL
jpeg("A5_Tabla3_IntervaloConfianza_Proporcion.jpeg",height=150,width=850)
grid.table(tabla)