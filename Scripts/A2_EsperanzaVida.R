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
#		A2_EsperanzaVida.R:
#			Script para graficar variable "Esperanza de vida al nacer (años)".
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
esperanzaVidaAfrica <- as.numeric(unlist(subset(datosUnicef, Continente=="Africa")["Esperanza de vida al nacer (años)"]))
esperanzaVidaAmericaDelNorte <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Norte")["Esperanza de vida al nacer (años)"]))
esperanzaVidaAmericaDelSur <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Sur")["Esperanza de vida al nacer (años)"]))
esperanzaVidaAsia <- as.numeric(unlist(subset(datosUnicef, Continente=="Asia")["Esperanza de vida al nacer (años)"]))
esperanzaVidaEuropa <- as.numeric(unlist(subset(datosUnicef, Continente=="Europa")["Esperanza de vida al nacer (años)"]))
esperanzaVidaOceania <- as.numeric(unlist(subset(datosUnicef, Continente=="Oceania")["Esperanza de vida al nacer (años)"]))

# Creación de diagramas de caja por continente
pdf("A2_Boxplot4_EsperanzaVida.pdf")
par(mar=c(9,5,5,5))
boxplot(
	esperanzaVidaAfrica,
	esperanzaVidaAmericaDelNorte,
	esperanzaVidaAmericaDelSur,
	esperanzaVidaAsia,
	esperanzaVidaEuropa,
	esperanzaVidaOceania,
	las=2,
	main="Esperanza de vida al nacer (años)",
	ylab="Esperanza de vida",
	names=c("África",
			"America del Norte",
			"America del Sur",
			"Asia",
			"Europa",
			"Oceania")
)