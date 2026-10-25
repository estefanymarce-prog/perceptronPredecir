test_that("predecir_perceptron devuelve clases 0 y 1 del largo correcto", {
  modelo <- list(
    pesos = c(0.07, 0.02),
    sesgo = 0.1,
    medias = c(5.5, 70),
    desviaciones = c(2.6, 17)
  )
  X <- data.frame(horas = c(2, 8, 5), asistencia = c(50, 90, 70))

  pred <- predecir_perceptron(modelo, X)

  expect_type(pred, "integer")
  expect_length(pred, nrow(X))
  expect_true(all(pred %in% c(0L, 1L)))
})

test_that("predecir_perceptron clasifica casos claros correctamente", {
  modelo <- list(
    pesos = c(0.07, 0.02),
    sesgo = 0.1,
    medias = c(5.5, 70),
    desviaciones = c(2.6, 17)
  )
  X <- data.frame(horas = c(2, 8), asistencia = c(50, 90))

  expect_equal(predecir_perceptron(modelo, X), c(0L, 1L))
})
