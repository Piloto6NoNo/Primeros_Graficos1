# Introducción a RStudio y Primeros Gráficos
# Código R básico para empezar

#Instalación de los paquetes
install.packages("tidyverse", dependencies = TRUE)
install.packages("ggplot2", dependencies = TRUE)

#Instalar librerias
library(tidyverse)
library(ggplot2)
#El dataset mtcars contiene datos de coches de 1973-74
data("mtcars")

#El dataset irirs contiene medidas de sépalos y pétalos de flores iris
data("iris")

#Mostrar las primeras filas del data frame
head(mtcars)

#Obtener un resumen estadistico de cada columna
summary(mtcars)
#Se visualiza la estructura del dataframe que se esta utilizando (tipo de datos, nombres de columnas)
str(mtcars)

#Ver los nombres de las columnas
names(mtcars)

#Se vulve a utilizar head para mostrar las columnas
head(iris)

summary(iris)

str(iris)

names(iris)

#**1. primeros Graficos simples con R Base "(plot())**"
#Las funciones de gráficos a base de R son rápidas y útiles para exploraciones rápidas
#Para este caso de Gráfico de dispersión (plot()); Para mostrar la relacion entre dos variables numéricas.
#Relacion entre "hp (caballos de fuerza)" y "mpg (millas por galon) en la base de "mtcars"

plot(mtcars$hp, mtcars$mpg)

#En Esta parte se va a plotear el grafico con las siguientes caracteristicas
plot(mtcars$hp, mtcars$mpg,
     xlab = "Caballos de Fuerza (hp)", #Etiqueta del eje X
     ylab = "Millas por Galón (mpg)",   #Etiqueta del eje Y
     main = "HP vs. MPG en Coches", #Título del gráfico  
     col ="red",  # Color de los puntos
     border = "darkred",  #Color del borde
     pch = 20)    #Tipo de Símbolo del punto


#**2. Histogramas**
#Los histogramas (hist()); son para mostrar la distribución de una unica variable numérica

#para este ejemplos ocuparemos la distribución de mpg en mtcars

hist(mtcars$mpg) #Esto nos plotea un histograma sencillo

#Personalizar el histograma
hist(mtcars$mpg,
     main = "Distribución de MPG en Coches",
     xlab = "Millas por Galón (mpg)",
     col = "lightblue",
     border = "darkblue")

#**Boxplot**
#Los boxplot o cajas de bigotes (boxplot()); Son para comparar la distribución de una variable
#numerica entre diferentes categorias. 

#para este ejemplos ocuparemos la distribución de Sepal.Length por Species en iris

boxplot(Sepal.Length ~ Species, data = iris)
#Personalizar el histograma
boxplot(Sepal.Length ~ Species, data = iris,
        main = "Longitud del Sépalo por Especie de Iris",
        xlab = "Especie",
        ylab = "Longitud del Sépalo (cm)",
        col = c("yellow", "orange", "purple"))


#**Primeros pasos en ggplot2**
#ggplot2 es parte del paquete de tidyverse y sigue ña "gramatica de los gráficos",
#lo que lo hace muy potente y consistente.
#para este ejemplos ocuparemos una grafico de Dispersión con gggplot2 de mpg en mtcars

ggplot(data = mtcars, aes (x = hp, y = mpg)) +
  geom_point()

#ggplot(): Define el conbjunto de datos, **aes o esteticas** las variables mapean propiedades visuales
##**geom_point** añade una capa de puntos 
ggplot(data = mtcars,aes(x = hp, y = mpg, color = as.factor(cyl))) +
  geom_point()+
  labs(title = "HP vs. MPG coloreado por Cilindros",
       x = "Caballos de Fuerza",
       y = "Millas por Gálon",
       color = "Cilindros")



##**Histograma**
ggplot(data = mtcars, aes(x=mpg))+
  geom_histogram(binwidth = 2, fill = "cyan", color = "gray")+
  labs(title = "Distribución de MPG",
       x = "Millas por Gálon",
       y = "Frecuencia")

#**binwidth** define lo ancho de las barras

##**Boxplot**
ggplot(data = iris, aes(x= Species, y = Sepal.Length, fill = Species))+
  geom_boxplot()+
  labs(title = "Longitud del Sépalo por Especie de Iris",
       x = "Especie",
       y = "Longitud del Sépalo (cm)")+
  theme_minimal()#Un tema de ggplot2 para una aparencia más limpia

##**4.Guardar los Graficos**
#Guarda el ultimo grafico de ggplot creado
ggsave("mi_primer_boxplot.png", width = 7, height = 5)

#Tambien puedes guardar un grafico especifico que hayas asignado a un objeto
p_scatter <- ggplot(data = mtcars, aes(x = hp, y = mpg, color = as.factor(cyl)))+
  geom_point()
ggsave("mtcars_hp_mpg_scatter.pdf", plot = p_scartter, width = 8, height = 6)


