# perceptronPredecir

Este paquete predice clases binarias (0 y 1) a partir de un modelo de perceptron simple. Estandariza los datos nuevos con las medias y desviaciones usadas en el entrenamiento.

Es el segundo de tres paquetes independientes: `perceptronEntrenar`, `perceptronPredecir` y `perceptronGraficar`.

## Instalacion

Puedes instalar la version de desarrollo desde GitHub con:

``` r
# install.packages("devtools")
devtools::install_github("estefanymarce-prog/perceptronPredecir", upgrade = "never")
```

## Ejemplo

``` r
library(perceptronPredecir)

modelo <- list(
  pesos = c(0.07, 0.02),
  sesgo = 0.1,
  medias = c(5.5, 70),
  desviaciones = c(2.6, 17)
)

X_nuevo <- data.frame(horas = c(2, 8), asistencia = c(50, 90))
predecir_perceptron(modelo, X_nuevo)
```

## Modelo esperado

`predecir_perceptron()` recibe una lista con cuatro elementos:

- `pesos`: peso de cada variable.
- `sesgo`: termino de sesgo.
- `medias`: media de cada variable usada al entrenar.
- `desviaciones`: desviacion estandar de cada variable usada al entrenar.

Es la misma estructura que devuelve `entrenar_perceptron()` del paquete `perceptronEntrenar`.
