#' Predecir con un perceptron simple
#'
#' Predice la clase (0 o 1) de observaciones nuevas a partir de un modelo
#' de perceptron simple. Los datos nuevos se estandarizan con las medias y
#' desviaciones que se usaron durante el entrenamiento.
#'
#' @param modelo Lista con cuatro elementos: `pesos`, `sesgo`, `medias` y
#'   `desviaciones`, con la estructura que devuelve un entrenamiento de
#'   perceptron simple.
#' @param X Matriz o data frame con las variables predictoras, en el mismo
#'   orden y con el mismo numero de columnas usadas al entrenar.
#'
#' @return Un vector de enteros (0 o 1) con la clase predicha para cada fila
#'   de `X`.
#' @export
#'
#' @examples
#' modelo <- list(
#'   pesos = c(0.07, 0.02),
#'   sesgo = 0.1,
#'   medias = c(5.5, 70),
#'   desviaciones = c(2.6, 17)
#' )
#' X_nuevo <- data.frame(horas = c(2, 8), asistencia = c(50, 90))
#' predecir_perceptron(modelo, X_nuevo)
predecir_perceptron <- function(modelo, X) {
  X <- as.matrix(X)

  Xs <- scale(
    X,
    center = modelo$medias,
    scale = modelo$desviaciones
  )

  z <- as.vector(Xs %*% modelo$pesos + modelo$sesgo)

  as.integer(z >= 0)
}
