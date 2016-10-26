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
#		A2_NacimientosAnuales.R:
#			Script para graficar variable "Nacimientos anuales".
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Extracción de datos
nacimientosAnualesAfrica <- as.numeric(unlist(subset(datosUnicef, Continente=="Africa")["Nacimientos anuales (miles)"]))
nacimientosAnualesAmericaDelNorte <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Norte")["Nacimientos anuales (miles)"]))
nacimientosAnualesAmericaDelSur <- as.numeric(unlist(subset(datosUnicef, Continente=="America del Sur")["Nacimientos anuales (miles)"]))
nacimientosAnualesAsia <- as.numeric(unlist(subset(datosUnicef, Continente=="Asia")["Nacimientos anuales (miles)"]))
nacimientosAnualesEuropa <- as.numeric(unlist(subset(datosUnicef, Continente=="Europa")["Nacimientos anuales (miles)"]))
nacimientosAnualesOceania <- as.numeric(unlist(subset(datosUnicef, Continente=="Oceania")["Nacimientos anuales (miles)"]))

# Creación de histogramas por continente
jpeg("A2_Histograma7_NacimientosAnuales_Africa.jpeg")
hist(nacimientosAnualesAfrica,
	main="África",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,40)
)

jpeg("A2_Histograma8_NacimientosAnuales_AmericaDelNorte.jpeg")
hist(nacimientosAnualesAmericaDelNorte,
	main="América del Norte",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,40)
)

jpeg("A2_Histograma9_NacimientosAnuales_AmericaDelSur.jpeg")
hist(nacimientosAnualesAmericaDelSur,
	main="América del Sur",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,40)
)	

jpeg("A2_Histograma10_NacimientosAnuales_Asia.jpeg")
hist(nacimientosAnualesAsia,
	main="Asia",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,40)
)

jpeg("A2_Histograma11_NacimientosAnuales_Europa.jpeg")
hist(nacimientosAnualesEuropa,
	main="Europa",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,40)
)

jpeg("A2_Histograma12_NacimientosAnuales_Oceania.jpeg")
hist(nacimientosAnualesOceania,
	main="Oceanía",
	xlab="Nacimientos anuales (miles)",
	ylab="Nro. países",
	xlim=c(0,30000),
	ylim=c(0,40)
)