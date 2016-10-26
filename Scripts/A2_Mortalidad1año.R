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
#		A2_Mortalidad1año.R:
#			Script para graficar variable "Tasa de mortalidad menores de 1 año".
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
mortalidad1añoAfrica <- as.numeric(unlist(subset(datosUnicef, Continente=="Africa")["Tasa de mortalidad menores de 1 año"]))
mortalidad1añoAmericaDelNorte <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Norte")["Tasa de mortalidad menores de 1 año"]))
mortalidad1añoAmericaDelSur <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Sur")["Tasa de mortalidad menores de 1 año"]))
mortalidad1añoAsia <- as.numeric(unlist(subset(datosUnicef, Continente=="Asia")["Tasa de mortalidad menores de 1 año"]))
mortalidad1añoEuropa <- as.numeric(unlist(subset(datosUnicef, Continente=="Europa")["Tasa de mortalidad menores de 1 año"]))
mortalidad1añoOceania <- as.numeric(unlist(subset(datosUnicef, Continente=="Oceania")["Tasa de mortalidad menores de 1 año"]))

# Creación de diagramas de caja por continente
pdf("A2_Boxplot2_Mortalidad1año.pdf")
par(mar=c(9,5,5,5))
boxplot(
	mortalidad1añoAfrica,
	mortalidad1añoAmericaDelNorte,
	mortalidad1añoAmericaDelSur,
	mortalidad1añoAsia,
	mortalidad1añoEuropa,
	mortalidad1añoOceania,
	las=2,
	main="Tasa de mortalidad menores de 1 año",
	ylab="Tasa mortalidad",
	names=c("África",
			"America del Norte",
			"America del Sur",
			"Asia",
			"Europa",
			"Oceania")
)