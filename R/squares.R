#' Generate artwork structured as a grid of randomly coloured squares.
#'
#' @param n_rows number of rows of squares in plot.
#' @param n_cols number of columns of squares in plot.
#' @param gap_size relative spacing between squares.
#' @param neutrals (optional) vector of neutral colours.
#' @param accents  (optional) vector of accent colours.
#'
#' @return ggplot object
#' @export
#'
#' @importFrom stats runif
#' @importFrom vctrs vec_interleave
#' @importFrom ggplot2 ggplot aes geom_polygon coord_equal theme_void
#'
squares <- function(n_rows = 5, n_cols = 10, gap_size = 0.1, neutrals = NULL, accents = NULL){

  # set palette if not defined by the user
  if (is.null(neutrals)) {
    neutrals <- c(zv_black, zv_white, zv_light_grey, zv_mid_grey)
  }
  if (is.null(accents)) {
    accents <- c(zv_navy, zv_orange, zv_fuchia, zv_blue)
  }

  # define squares
  n_squares <- n_rows * n_cols
  square_id <- seq_len(n_squares)
  row_num <- rep(1:n_rows, each = n_cols)
  col_num <- rep(1:n_cols, times = n_rows)
  squares <- data.frame(id = square_id, row_num, col_num)

  # add columns for coordinates
  squares$x_min <- (1 + gap_size) * (squares$col_num - 1) + gap_size
  squares$y_min <- (1 + gap_size) * (squares$row_num - 1) + gap_size
  squares$x_max <- squares$x_min + 1
  squares$y_max <- squares$y_min + 1

  # create dataframe of polygons
  id <- vec_interleave(squares$id, squares$id, squares$id, squares$id)
  x <- vec_interleave(squares$x_min, squares$x_max, squares$x_max, squares$x_min)
  y <- vec_interleave(squares$y_min, squares$y_min, squares$y_max, squares$y_max)
  value <- sample(x = c(neutrals, accents), size = n_squares, replace = TRUE)
  value <- rep(value, each = 4)
  plotting <- data.frame(id, x, y, value)

  # return plot
  ggplot(plotting, aes(x = x, y = y)) +
    geom_polygon(aes(group = id), fill = value) +
    coord_equal() +
    theme_void()
}
