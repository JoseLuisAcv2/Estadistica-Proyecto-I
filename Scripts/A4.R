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
uBajo <- mean(INB_bajoIngreso)
sBajo <- sd(INB_bajoIngreso)
nBajo <- length(INB_bajoIngreso)
error <- qnorm(0.975)*sBajo/sqrt(nBajo)

bajoIngreso_extIzq <- round(uBajo - error, digits=2)
bajoIngreso_extDer <- round(uBajo + error, digits=2)

# Calculo de intervalo de confianza para altos ingresos
uAlto <- mean(INB_altoIngreso)
sAlto <- sd(INB_altoIngreso)
nAlto <- length(INB_altoIngreso)
error <- qt(0.975,df=nAlto-1)*sAlto/sqrt(nAlto)

altoIngreso_extIzq <- round(uAlto - error, digits=2)
altoIngreso_extDer <- round(uAlto + error, digits=2)

# Tabla de intervalos de confianza
datos <- c(
	"Bajo ingreso",
	nBajo,
	round(uBajo, digits=2),
	round(sBajo, digits=2),
	paste("[",as.character(bajoIngreso_extIzq),", ",as.character(bajoIngreso_extDer),"]",sep=" "),
	"Alto ingreso",
	nAlto,
	round(uAlto, digits=2),
	round(sAlto, digits=2),
	paste("[",as.character(altoIngreso_extIzq),", ",as.character(altoIngreso_extDer),"]",sep=" ")
)

tabla <- matrix(datos, ncol=5, byrow=TRUE)

colnames(tabla) <- c("Tipo de INB", "Cantidad de países", "Media muestral", "Desviación Estándar muestral", "Intervalo de confianza del 95% para la media real")

tabla <- as.table(tabla)
row.names(tabla)=NULL
jpeg("A4_Tabla2_IntervaloConfianza_INB.jpeg",height=150,width=850)
grid.table(tabla)