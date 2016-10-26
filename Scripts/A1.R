# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 1
#
# 			Analisis descriptivo de las variables cuantitativas e interpretacion de los resultados.
#			Incluye: Mínimo, media, mediana, máximo, desviación estándar, 1er y 3er cuartil.
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

library(gridExtra)

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Tasa de mortalidad menores de 5 años
mortalidad5años <- as.numeric(unlist(datosUnicef["Tasa de mortalidad menores de 5 años"]))
mortalidad5añosDatos<-summary(mortalidad5años)
mortalidad5añosDatos <- c("Tasa de mortalidad menores de 5 años",mortalidad5añosDatos, sd(mortalidad5años))

# Tasa de mortalidad menores de 1 año
mortalidad1año <- as.numeric(unlist(datosUnicef["Tasa de mortalidad menores de 1 año"]))
mortalidad1añoDatos<-summary(mortalidad1año)
mortalidad1añoDatos <- c("Tasa de mortalidad menores de 1 año",mortalidad1añoDatos, sd(mortalidad1año))

# Poblacíón total (miles)
poblacionTotal <- as.numeric(unlist(datosUnicef["Poblacion total (miles)"]))
poblacionTotalDatos<-summary(poblacionTotal)
poblacionTotalDatos <- c("Poblacion total (miles)",poblacionTotalDatos, sd(poblacionTotal))

# Nacimientos anuales (miles)
nacimientosAnuales <- as.numeric(unlist(datosUnicef["Nacimientos anuales (miles)"]))
nacimientosAnualesDatos<-summary(nacimientosAnuales)
nacimientosAnualesDatos <- c("Nacimientos anuales (miles)",nacimientosAnualesDatos, sd(nacimientosAnuales))

# INB per capita (dólares)
INB <- as.numeric(unlist(datosUnicef["INB per capita (dolares)"]))
INBdatos<-summary(INB)
INBdatos <- c("INB per capita (dolares)",INBdatos, sd(INB))

# Esperanza de vida al nacer (años)
esperanzaVida <- as.numeric(unlist(datosUnicef["Esperanza de vida al nacer (años)"]))
esperanzaVidaDatos<-summary(esperanzaVida)
esperanzaVidaDatos <- c("Esperanza de vida al nacer (años)",esperanzaVidaDatos, sd(esperanzaVida))

datos <- c(mortalidad5añosDatos, mortalidad1añoDatos, poblacionTotalDatos,
		   nacimientosAnualesDatos, INBdatos, esperanzaVidaDatos)

tabla <- matrix(datos, ncol=8, byrow=TRUE)

colnames(tabla) <- c("Variable","Mínimo","1er cuartil","Mediana","Media","3er cuartil","Máximo","Desviación Estándar")
rownames(tabla) <- c("Tasa de mortalidad menores de 5 años",
					 "Tasa de mortalidad menores de 1 año",
					 "Poblacion total (miles)",
					 "Nacimientos anuales (miles)",
					 "INB per capita (dolares)",
					 "Esperanza de vida al nacer (años)")
tabla <- as.table(tabla)
row.names(tabla)=NULL
pdf("A1_Tabla1_AnalisisDescriptivo.pdf",height=3.5,width=12)
grid.table(tabla)