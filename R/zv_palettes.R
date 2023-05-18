# Functions for defining colour palettes and scales.
# Adapted from N Rennie's LUtheme/R/lu_palettes.R

#--------------------------------------------------------------------

#' @title Generate a palette from zv_colours
#' @description Generates colour palette from zvplot colour definitions.
#' @param palette_name Name of generated palette. Character string.
#' @param n Number of desired colours. If number of requested colours is
#' beyond the scope of the palette, colours are automatically interpolated.
#' @param type The type of palette. One of c("discrete", "continuous").
#' @return A vector of colours.
#' @export
zv_palettes <- function(palette_name, n, type = c("discrete", "continuous")) {

  # input handling
  palette <- zv_colours[[palette_name]][[1]]
  if (missing(n)) { n <- length(palette) }
  type <- match.arg(type,choices = c("discrete", "continuous"))

  out <- switch(type,
    continuous = grDevices::colorRampPalette(palette)(n),
    discrete = palette[1:n]
  )

  structure(out, palette_name = palette_name, class = "palette")
}


# Method to print a palette
#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  opar <- graphics::par(mar = c(5.1, 4.1, 4.1, 2.1))
  on.exit(graphics::par(opar))

  graphics::image(1:n, 1, as.matrix(1:n),
    col = x,
    ylab = "",
    xlab = "",
    xaxt = "n",
    yaxt = "n",
    bty = "n"
  )
  graphics::rect(
    xleft = 0,
    ybottom =  0.92,
    xright =  n + 1,
    ytop =  1.08,
    col = grDevices::rgb(0, 0, 0, 0.6),
    border = NA
  )
  graphics::text(
    x = (n + 1) / 2,
    y = 1,
    labels = attr(x, "palette_name"),
    cex = 1.5,
    family = "sans",
    col = grDevices::rgb(1, 1, 1, 1)
  )
}

#' Print all palettes
#' @return A plot of all available palettes
#' @export
print_all_palettes <- function() {

  palette_names <- names(zv_colours)
  palette_lengths <- do.call(c, lapply(zv_colours, FUN = function(x){length(x[[1]])}))

  graphics::par(mfrow = c(ceiling(length(names(zv_colours)) / 2), 2))

  for (palette_name in palette_names) {
    palette_length <- palette_lengths[as.character(palette_name)]
    print(zv_palettes(palette_name, palette_length, type = "discrete"))
  }

  graphics::par(mfrow = c(1, 1))
}


#' Change colours in ggplot for discrete variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_colour_manual}
#' @export
scale_colour_zv_d <- function(palette_name = "set_qual", ...) {
  ggplot2::scale_colour_manual(values = zv_palettes(palette_name, type = "discrete"), ...)
}

#' Change colours in ggplot for discrete variables
#' @param palette_name Name of palette.
#' @param ... other arguments to be passed to \code{scale_colour_manual}
#' @export
scale_color_zv_d <- scale_colour_zv_d


#' Change fill in ggplot for discrete variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_fill_manual}
#' @export
scale_fill_zv_d <- function(palette_name = "set_qual", ...) {
  ggplot2::scale_fill_manual(values = zv_palettes(palette_name, type = "discrete"), ...)
}

#' Change colours in ggplot for continuous variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_colour_gradientn}
#' @export
scale_colour_zv_c <- function(palette_name = "seq_grey", ...) {
  ggplot2::scale_colour_gradientn(colours = zv_palettes(palette_name = palette_name, type = "continuous"), ...)
}

#' Change colours in ggplot for continuous variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_colour_gradientn}
#' @export
scale_color_zv_c <- scale_colour_zv_c

#' Change fill in ggplot for continuous variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_fill_gradientn}
#' @export
scale_fill_zv_c <- function(palette_name = "seq_grey", ...) {
  ggplot2::scale_fill_gradientn(colours = zv_palettes(palette_name = palette_name, type = "continuous"), ...)
}
