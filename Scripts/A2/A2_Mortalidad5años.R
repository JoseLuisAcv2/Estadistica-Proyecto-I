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
#		A2_Mortalidad5años.R:
#			Script para graficar variable "Tasa de mortalidad menores de 5 años".
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
mortalidad5añosAfrica <- as.numeric(unlist(subset(datosUnicef, Continente=="Africa")["Tasa de mortalidad menores de 5 años"]))
mortalidad5añosAmericaDelNorte <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Norte")["Tasa de mortalidad menores de 5 años"]))
mortalidad5añosAmericaDelSur <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Sur")["Tasa de mortalidad menores de 5 años"]))
mortalidad5añosAsia <- as.numeric(unlist(subset(datosUnicef, Continente=="Asia")["Tasa de mortalidad menores de 5 años"]))
mortalidad5añosEuropa <- as.numeric(unlist(subset(datosUnicef, Continente=="Europa")["Tasa de mortalidad menores de 5 años"]))
mortalidad5añosOceania <- as.numeric(unlist(subset(datosUnicef, Continente=="Oceania")["Tasa de mortalidad menores de 5 años"]))

# Creación de diagramas de caja por continente
jpeg("A2_Boxplot1_Mortalidad5años.jpeg")
par(mar=c(9,5,5,5))
boxplot(
	mortalidad5añosAfrica,
	mortalidad5añosAmericaDelNorte,
	mortalidad5añosAmericaDelSur,
	mortalidad5añosAsia,
	mortalidad5añosEuropa,
	mortalidad5añosOceania,
	las=2,
	main="Tasa de mortalidad menores de 5 años",
	ylab="Tasa de mortalidad",
	names=c("África",
			"América del Norte",
			"América del Sur",
			"Asia",
			"Europa",
			"Oceanía"
	)
)