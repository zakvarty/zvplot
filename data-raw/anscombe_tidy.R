## code to prepare `anscombe_tidy` dataset goes here

anscombe_tidy <- data.frame(
  x = c(anscombe$x1, anscombe$x2, anscombe$x3, anscombe$x4),
  y = c(anscombe$y1, anscombe$y2, anscombe$y3, anscombe$y4),
  set = rep(1:4, each = 11)
)

usethis::use_data(anscombe_tidy, overwrite = TRUE)
