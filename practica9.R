##====================================================================##
# Tema: Personalización Avanzada de Gráficos con 'ggplot2'            #
# Sesión: Practica 6                                                  #
# Fecha:08/10/25                                                      #
# Autor: Adolfo Salinas Vargas                                        #
##====================================================================##

#Instalación de paqueterias, en este solamente ocuparemos 'todyverse'

install.packages("tidyverse", dependencies = TRUE)
install.packages("viridis", dep = T)

#Carga el paquete tidyverse, que incluye ggplot para visualizaciones y 
#dplyr para manipulación de datos. Necesario para esta sesión

library(tidyverse)
library(viridis)

#Carga el dataset iris, que contiene medidas de sépalos y pétalos de 
#flores de iris de tres especies diferentes

data(iris)

#Muestra las primeras 6 filas de iris para una vista previa

head(iris)

#proporciona un resumen estadistíco de iris

summary(iris)

#Muestra la estructura interna de iris

str(iris)

#**Tambien cargaremos la data de 'USArrests'**

#carga el dataset USArrests, que contiene estadisticas de arrestos en EE.UU.
#por asalto, asesinato y violación por cada 100, 000 hab en 1973, asi como el 
#porcentaje de la poblacion que vive en áreas urbanas

data(USArrests)

#Muestra las primeras 6 filas de USArrests para una vista previa

head(USArrests)

#proporciona un resumen estadistíco de USArrests

summary(USArrests)

#Muestra la estructura interna de USArrests

str(USArrests)

################################Parte Uno#######################################
#**Ejercicio: Control de Títulos, Subtítulos y Etiquetas (labs())**

#**1. Gráfico de Dispersión Básico (iris)**

#Creamos un gráfico de dispersión base de longitud sel Sépalo vs. longitud del pétalo,
#coloreando por especie. Lo guardamos en un objeto p_iris para añadirle capas despúes.

# - 'size': Ajusta el tamaño de los puntos
#- 'alpha': controla la transparencia de los puntos

p_iris <- ggplot(data = iris, aes(x= Sepal.Length, y= Petal.Length, color= Species))+
  geom_point(size= 3, alpha= 0.7)

#**Explicación de cada una de las partes que contiene el script**
#'labs(): Función para añadir y personalizar etiquetas y títulos
#'subtitle': Subtítulo, debajo del título principal
#'x' y 'y': Etiquetas para los ejes x e y 
#'color': Etiqueta para la leyenda que corresponde a la estética color.
#'caption': texto de pie de página, a menudo para la fuente de datos

p_iris + labs(title = "Relación entre Longitud del Sépalo y Pétalo en Flores de Iris",
              subtitle = "Análisis por Especie",
              x= "Longitud del Sépalo (cm)",
              y= "Longitud del Pétalo (cm)",
              color = "Especie de Iris",# Etiqueta para la leyenda de color
              caption = "Fuente: Dataset iris de R"
              )

#**2. Ajuste de Posición y Estilo del Título (theme())**
#Explicacion de cada una de las partes del codigo
#'theme()': Función para personalizar elementos no relacionados con los datos, 
#como el texto,los fondos, las líneas de cuadrícula, etc.
#'plot.title', 'plot.subtitle', 'plot.caption': Elementos específicos para el 
#el título, subtítulo y pie de pagina.
#'element_text()': Funcion para controlar las propedades del texto
#'hjust' es la alineación
#'face' estilo de fuente
#'size' es el tamaño
#'color' es el color
p_iris +
  labs(title= "Relación entre longitus del Sépalo y Pétalo en Flores de Iris",
       subtitle= "Análisis por Especie",
       x= "longitud del Sépalo (cm)",
       y = "Logitud del Pétalo (cm)",
       color ="Especie de Iris",
       caption = "Fuente:Dataset de iris de R"
    
  )+
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 16), #Centrar, negrita, tamaño
        plot.subtitle = element_text(hjust = 0.5, size = 12, color = "azure3"),#Centrar, tamaño, color
        plot.caption = element_text(hjust = 1, size = 9, color = "azure4")#Alinear a la derecha, tamaño, color
        )
  

################################Parte dos#######################################
#**Aplicación y Modificación de Temas (theme_*(),theme())**

#**1. Explorar Temas Predefinidos**
#Tema por defecto (gray)

ggplot(data = iris, aes(x=Sepal.Length, y= Petal.Length, color = Species)) +
  geom_point()+
  labs(title = "Tema por Defecto")

#Tema clásico (theme_classic)
ggplot(data = iris, aes(x=Sepal.Length, y= Petal.Length, color = Species)) +
  geom_point() +
  theme_classic() + #Fondo blanco, sin líneas de cuadrícula, ejes simples
  labs(title = "Tema Clásico")

#Tema minimalista (theme_minimal)

ggplot(data = iris, aes(x=Sepal.Length, y= Petal.Length, color = Species))+
  geom_point()+
  theme_minimal()+ #Fondo blanco, líneas de cuadrícula mínimas
  labs(title = "Tema Minimalista")

#Tema blanco y negro (theme_bw)

ggplot(data = iris, aes(x=Sepal.Length, y= Petal.Length, color = Species))+
  geom_point()+
  theme_bw()+ #Fondo blanco, líneas de cuadrícula grises
  labs(title = "Tema Blanco y Negro")

#**2. Modificar un Tema Existente: puedes empezar con un tema y luego ajustar elementos específicos**
#*#Explicacion de cada una de las partes del codigo
#'element_text()': Para texto
#'element_line()': Para lineas (ej., cuadrículas, ejes).
#'element_rect()': Para rectángulos (ej., fondos de panel, leyenda)
#'legend.position': Controla la ubicación de la leyenda

ggplot(data = iris, aes(x=Sepal.Length, y= Petal.Length, color = Species))+
  geom_point(size= 3, alpha = 0.7)+
  theme_minimal()+ #Empezamos con el tema minimalista
  labs(title = "Gráfico Personalizado con Tema Minimal Modificado")+
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 18, color = "dodgerblue4"),
        axis.title = element_text(face = "italic", size = 12, color = "indianred3"),
        axis.text = element_text(color = "black"),
        panel.grid.major = element_line(color = "gray95", linetype = "dotted"),#Líneas de cuadrícula punteadas
        panel.background = element_rect(fill = "antiquewhite", color= NA),#Fondo del panel
        legend.position = "bottom",#Mover la leyenda a la parte inferior
        legend.background = element_rect(fill = "white", color = "gray80",
                                         linetype = "solid") #Fondo de la leyenda
        )

#############################Parte tres#########################################
#**Selección y Aplicación de Paletas de Colores (scale_color(), scale_fill_()**

#**1. Paletas Cualitativas (para categorías):**
#*#Explicacion de cada una de las partes del codigo
#'scale_color_manual()': Permite especificar un color para cada nivel de la variable categórica
#'values': un vector con los colores, nombrado con los niveles de la categoría. 

ggplot(data = iris, aes(x=Sepal.Length, y= Petal.Length, color = Species))+
  geom_point(size= 3, alpha = 0.7)+
  scale_color_manual(values = c("setosa" = "palevioletred3", "versicolor" = "orchid3", "virginica" = "mediumpurple3"))+
  labs(title = "Colores Manuales para Especies")+
  theme_minimal()

#**2. Paletas Continuas (para variables numéricas):**
#*#Explicacion de cada una de las partes del codigo
#Usando USArrests: Asalto vs. Asesinato, coloreando por población urbana
#'scale_color_gradient()':Crea un gradiente de color para una variables numérica.
#'low' , 'high': colores para los valores bajos y altos de la variable

ggplot(data = USArrests, aes(x=Assault, y= Murder, color = UrbanPop))+
  geom_point(size= 4, alpha = 0.7)+
  scale_color_gradient(low= "skyblue", high = "blue4")+ #Gradiente de azul
  labs(title = "Arrestos por Asalto vs. Asesinato por Población Urbana",
       x = "Tasa de Asalto",
       y = "tasa de Asesinato",
       color = "Población Urbana (%)")+
  theme_bw()

#*#Explicacion de cada una de las partes del codigo
#'scale_color_viridis_c()': Proporciona paletas de color científicamente diseñadas
#'option': Permite elegir entre diferentes variantes de viridis ("A", "B", "C", "D", "E") 
 
ggplot(data = USArrests, aes(x=Assault, y= Murder, color = UrbanPop))+
  geom_point(size= 4, alpha = 0.7)+
  scale_color_viridis_c(option = "D")+ #"D" es la paleta viridis por defecto
  labs(title = "Arrestos por Asalto vs. Asesinato por Población Urbana (viridis)",
       x = "Tasa de Asalto",
       y = "tasa de Asesinato",
       color = "Población Urbana (%)")+
  theme_minimal()

#############################Parte Cuatro#######################################
#**Ajuste de Escalas de Ejes y Transformaciones (scale_continuous(), scale_log10()**

#**1. Límites de Ejes y Rupturas (Breaks)**
#*#Explicacion de cada una de las partes del codigo
#'scale_x_continuous','scale_y_continuous': Permiten un control fino sobre los ejes continuos
#'limits': Define el rango mínnimo y máximo del eje
#'breaks': Especifica las ubicaciones de las marcas principables en el eje
#''scale_x_log10': Aplica una transformación logarítmica al eje X. 
#Util cuando los datos tienen un rango muy amplio y quieres ver patrones en los valores mas pequeños

ggplot(data = iris, aes(x=Sepal.Length, y= Petal.Length, color = Species))+
  geom_point(size= 3, alpha = 0.7)+
  scale_x_continuous(limits = c(4, 8), breaks = seq(4, 8, by = 0.5))+ #Límites y rupturas en X
  scale_y_continuous(limits = c(0, 7), breaks = c(0,2, 4, 6))+ #Límite y rupturas Y
  labs(title = "Límites y Rupturas Personalizadas en Ejes")+
  theme_minimal()

#**2. Transformaciones de Ejes (Logarítmicas): Útil para datos con un rango muy** 
#**amplio o distribuciones sesgadas**

#**Transformar el eje de Asalto a escala logarítmica**

ggplot(data = USArrests, aes(x=Assault, y= Murder, color = UrbanPop))+
  geom_point(size= 4, alpha = 0.7)+
  scale_x_log10()+#Transforma el eje X a escala logarítmica (base 10)
  labs(title = "Arrestos por Asalto (Log) vs. Asesinato",
       x = "Tasa de Asalto (Escala Logarítmica)",
       y = "Tasa de Asesinato")+
  theme_bw()

# Ejercicios de Práctica Individual
# Autor: [Tu nombre]
# Fecha: 2025-10-09

# Cargar librerías necesarias
library(ggplot2)
library(dplyr)
library(RColorBrewer)

# ==============================================================================
#  Boxplot de USArrests con Personalización
# ==============================================================================

# Cargar el dataset USArrests
data("USArrests")

# Crear categorías de población urbana usando cut()
USArrests_cat <- USArrests %>%
  mutate(UrbanPop_cat = cut(UrbanPop, 
                            breaks = c(0, 50, 70, 100),
                            labels = c("Bajo", "Medio", "Alto"),
                            include.lowest = TRUE))

# Crear el boxplot de Murder por categorías de UrbanPop
boxplot_murder <- ggplot(USArrests_cat, aes(x = UrbanPop_cat, y = Murder, fill = UrbanPop_cat)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_brewer(palette = "Set2") +  # Paleta ColorBrewer
  labs(
    title = "Distribución de Asesinatos por Categoría de Población Urbana",
    subtitle = "Dataset USArrests - Estados Unidos",
    x = "Categoría de Población Urbana",
    y = "Tasa de Asesinatos (por 100,000 habitantes)",
    fill = "Categoría"
  ) +
  theme_light() +  # Tema claro
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray40"),
    axis.title = element_text(face = "bold"),
    legend.position = "bottom"
  )

# Mostrar el gráfico
print(boxplot_murder)

# Guardar el gráfico
ggsave("boxplot_murder_urbanpop.png", plot = boxplot_murder, 
       width = 10, height = 6, dpi = 300)


# ==============================================================================
# Histograma de Sepal.Width (iris) con Tema y Colores
# ==============================================================================

# Cargar el dataset iris
data("iris")

# Crear el histograma de Sepal.Width coloreado por Species
histograma_sepal <- ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(position = "dodge", bins = 20, alpha = 0.8, color = "white") +
  scale_fill_manual(values = c("setosa" = "#E41A1C", 
                               "versicolor" = "#377EB8", 
                               "virginica" = "#4DAF4A")) +
  labs(
    title = "Distribución del Ancho del Sépalo por Especie",
    subtitle = "Dataset Iris - Análisis comparativo",
    x = "Ancho del Sépalo (cm)",
    y = "Frecuencia",
    fill = "Especie"
  ) +
  theme_classic() +  # Tema personalizado
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray40"),
    axis.title = element_text(face = "bold", size = 11),
    axis.text = element_text(size = 10),
    legend.position = "right",
    legend.title = element_text(face = "bold"),
    panel.background = element_rect(fill = "gray95"),
    plot.background = element_rect(fill = "white")
  )

# Mostrar el gráfico
print(histograma_sepal)

# Guardar el gráfico
ggsave("histograma_sepal_width.png", plot = histograma_sepal, 
       width = 10, height = 6, dpi = 300)


# ==============================================================================
# ANÁLISIS ADICIONAL: Estadísticas descriptivas
# ==============================================================================

cat("\n=== ESTADÍSTICAS DEL EJERCICIO 1 ===\n")
USArrests_cat %>%
  group_by(UrbanPop_cat) %>%
  summarise(
    n_estados = n(),
    media_murder = mean(Murder),
    mediana_murder = median(Murder),
    desv_est = sd(Murder)
  ) %>%
  print()

cat("\n=== ESTADÍSTICAS DEL EJERCICIO 2 ===\n")
iris %>%
  group_by(Species) %>%
  summarise(
    n_observaciones = n(),
    media_sepal_width = mean(Sepal.Width),
    mediana_sepal_width = median(Sepal.Width),
    desv_est = sd(Sepal.Width)
  ) %>%
  print()

cat("\n✓ Ejercicios completados exitosamente\n")









