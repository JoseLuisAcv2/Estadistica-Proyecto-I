# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 2
#
# 			Gráficos descriptivos de las variables por continente:
#				- Histograma:
#						- Población total
#						- Nacimientos anuales 
#				- Diagrama de caja:
#						- Tasa de mortalidad menores de 5 años
#						- Tasa de mortalidad menores de 1 año
#						- INB per capita
#						- Esperanza de vida al nacer
#
#			Continentes:
#				- Africa
#				- America del Norte
#				- America del Sur
#				- Asia
#				- Europa
#				- Oceania
#
#		A2_INBperCapita.R:
#			Script para graficar variable "INB per capita (dólares)".
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
INB_Africa <- as.numeric(unlist(subset(datosUnicef, Continente=="Africa")["INB per capita (dolares)"]))
INB_AmericaDelNorte <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Norte")["INB per capita (dolares)"]))
INB_AmericaDelSur <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Sur")["INB per capita (dolares)"]))
INB_Asia <- as.numeric(unlist(subset(datosUnicef, Continente=="Asia")["INB per capita (dolares)"]))
INB_Europa <- as.numeric(unlist(subset(datosUnicef, Continente=="Europa")["INB per capita (dolares)"]))
INB_Oceania <- as.numeric(unlist(subset(datosUnicef, Continente=="Oceania")["INB per capita (dolares)"]))

# Creación de diagramas de caja por continente
pdf("A2_Boxplot3_INBperCapita.pdf")
par(mar=c(9,5,5,5))
boxplot(
	INB_Africa,
	INB_AmericaDelNorte,
	INB_AmericaDelSur,
	INB_Asia,
	INB_Europa,
	INB_Oceania,
	las=2,
	main="INB per capita (dólares)",
	ylab="INB",
	names=c("África",
			"America del Norte",
			"America del Sur",
			"Asia",
			"Europa",
			"Oceania")
)