#' Generate artwork structured around a grid of pyramids viewed from above.
#'
#' @param n_rows number of rows of pyramids in plot.
#' @param n_cols number of columns of pyramids in plot.
#' @param gap_size relative spacing between pyramids.
#' @param buffer relative size of internal buffer; prevents peaks falling too close to pyramid edges.
#' @param neutrals (optional) vector of neutral colours.
#' @param accents (optional) vector of accent colours.
#'
#' @return ggplot object
#' @export
#'
#' @importFrom stats runif
#' @importFrom vctrs vec_interleave
#' @importFrom ggplot2 ggplot aes geom_polygon coord_equal theme_void
#'
pyramids <- function(n_rows = 5, n_cols = 10, gap_size = 0.1, buffer = 0.1, neutrals = NULL, accents = NULL){

  # set palette if not defined by the user
  if (is.null(neutrals)) {
    neutrals <- c(zv_black, zv_white, zv_light_grey, zv_mid_grey)
  }
  if (is.null(accents)) {
    accents <- c(zv_navy, zv_orange, zv_fuchia, zv_blue)
  }

  # define square bases of pyramids
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
  squares$peak_x <- stats::runif(n_squares, squares$x_min + buffer, squares$x_max - buffer)
  squares$peak_y <- stats::runif(n_squares, squares$y_min + buffer, squares$y_max - buffer)

  # create dataframe of polygons
  id <- rep(x = 1:(n_squares * 4), each = 3)
  x <- vctrs::vec_interleave(squares$x_min, squares$peak_x, squares$x_min,
                      squares$x_min, squares$peak_x, squares$x_max,
                      squares$x_max, squares$x_max, squares$peak_x,
                      squares$x_max, squares$x_min, squares$peak_x)
  y <- vctrs::vec_interleave(squares$y_min, squares$peak_y, squares$y_max,
                      squares$y_max, squares$peak_y, squares$y_max,
                      squares$y_max, squares$y_min, squares$peak_y,
                      squares$y_min, squares$y_min, squares$peak_y)
  value <- c()
  for (i in 1:n_squares) {
    colours <- c(sample(neutrals, 3), sample(accents, 1)) # pick colours
    colours <- sample(colours, 4)                         # shuffle
    value <- c(value, colours)                            #record
  }
  value <- rep(value, each = 3) # colour value for each vertex of every triangle

  plotting <- data.frame(id, x, y, value)

  # return plot
  ggplot2::ggplot(plotting, ggplot2::aes(x = x, y = y)) +
    ggplot2::geom_polygon(ggplot2::aes(group = id), fill = value) +
    ggplot2::coord_equal() +
    ggplot2::theme_void()
}
