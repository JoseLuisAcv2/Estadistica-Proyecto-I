# 	
#		ESTADISTICA PARA INGENIEROS - PROYECTO 1
#
#		ACTIVIDAD 1
#
# 			Analisis descriptivo de las variables cuantitativas e 
#			interpretacion de los resultados.
#			
#			Incluye: Mínimo, media, mediana, máximo,
#			desviación estándar, 1er y 3er cuartil.
#
#		AUTORES:
#			- Jose Acevedo 13-10006
#			- Pablo Betancourt 13-10147

library(gridExtra)

datosUnicef <- read.csv2("Unicef.csv", fileEncoding="latin1", check.names=FALSE)

# Tasa de mortalidad menores de 5 años
mortalidad5años <- as.numeric(unlist(datosUnicef["Tasa de mortalidad menores de 5 años"]))
mortalidad5añosDatos <- summary(mortalidad5años)
mortalidad5añosDatos <- c("Tasa de mortalidad menores de 5 años",mortalidad5añosDatos, round(sd(mortalidad5años), digits=2))

# Tasa de mortalidad menores de 1 año
mortalidad1año <- as.numeric(unlist(datosUnicef["Tasa de mortalidad menores de 1 año"]))
mortalidad1añoDatos <- summary(mortalidad1año)
mortalidad1añoDatos <- c("Tasa de mortalidad menores de 1 año",mortalidad1añoDatos, round(sd(mortalidad1año), digits=2))

# Poblacíón total (miles)
poblacionTotal <- as.numeric(unlist(datosUnicef["Poblacion total (miles)"]))
poblacionTotalDatos <- summary(poblacionTotal)
poblacionTotalDatos <- c("Población total (miles)",poblacionTotalDatos, round(sd(poblacionTotal), digits=2))

# Nacimientos anuales (miles)
nacimientosAnuales <- as.numeric(unlist(datosUnicef["Nacimientos anuales (miles)"]))
nacimientosAnualesDatos <- summary(nacimientosAnuales)
nacimientosAnualesDatos <- c("Nacimientos anuales (miles)",nacimientosAnualesDatos, round(sd(nacimientosAnuales), digits=2))

# INB per capita (dólares)
INB <- as.numeric(unlist(datosUnicef["INB per capita (dolares)"]))
INBdatos <- summary(INB)
INBdatos <- c("INB per cápita (dolares)",INBdatos, round(sd(INB), digits=2))

# Esperanza de vida al nacer (años)
esperanzaVida <- as.numeric(unlist(datosUnicef["Esperanza de vida al nacer (años)"]))
esperanzaVidaDatos <- summary(esperanzaVida)
esperanzaVidaDatos <- c("Esperanza de vida al nacer (años)",esperanzaVidaDatos, round(sd(esperanzaVida), digits=2))

datos <- c(mortalidad5añosDatos, mortalidad1añoDatos, poblacionTotalDatos, nacimientosAnualesDatos, INBdatos, esperanzaVidaDatos)

tabla <- matrix(datos, ncol=8, byrow=TRUE)

colnames(tabla) <- c("Variable","Mínimo","1er cuartil","Mediana","Media","3er cuartil","Máximo","Desviación Estándar")
tabla <- as.table(tabla)
row.names(tabla)=NULL
jpeg("A1_Tabla1_AnalisisDescriptivo.jpeg",height=200,width=800)
grid.table(tabla)
