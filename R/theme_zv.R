#' @title Personal theme for {ggplot2} plots
#' @description A complete theme based on theme_minimal
#' @param base_family Name of font family to use for most of the text in the
#' plot. Default "Oxygen".
#' @param title_family Name of font family to use for title of the plot.
#' Default "Oswald".
#' @param bg_colour Background colour of plot. Default "zv_white".
#' @param text_colour Text colour in plot. Default "zv_black".
#' @param base_size Base size of text. Default 11.
#' @param base_line_size Base size for line elements. Default is base_size / 22.
#' @param base_rect_size Base size for rectangle elements. Default is base_size / 22.
#'
#' @export
theme_zv <- function(base_family = "Oxygen",
                     title_family = "Oswald",
                     bg_colour = zv_white,
                     text_colour = zv_black,
                     base_size = 12,
                     base_line_size = base_size/22,
                     base_rect_size = base_size/22) {

  half_line <- base_size / 2

  ##null_theme <- ggplot2:::ggplot_global$theme_all_null

  theme_edits <- ggplot2::theme(

    # Default element styling  --------------------------------------
    line = ggplot2::element_line(
      colour = zv_black,
      linewidth = base_line_size,
      linetype = 1,
      lineend = "butt"),

    rect = ggplot2::element_rect(
      fill = zv_white,
      colour = zv_black,
      linewidth = base_rect_size,
      linetype = 1),

    text = ggplot2::element_text(
      family = base_family,
      face = "plain",
      colour = zv_black,
      size = base_size,
      lineheight = 0.9,
      hjust = 0.5,
      vjust = 0.5,
      angle = 0,
      margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 0),
      debug = FALSE
    ),

    # Axis things -------------------------------------------------

    ## Axis lines
    axis.line = ggplot2::element_blank(),
    axis.line.x = NULL,
    axis.line.y = NULL,

    ## Axis text
    axis.text = ggplot2::element_text(
      size = ggplot2::rel(0.8),
      colour = zv_black),
    axis.text.x = ggplot2::element_text(
      margin = ggplot2::margin(t = 0.8 * half_line / 2), vjust = 1),
    axis.text.x.top = ggplot2::element_text(
      margin = ggplot2::margin(b = 0.8 * half_line / 2), vjust = 0),
    axis.text.y = ggplot2::element_text(
      margin = ggplot2::margin(r = 0.8 * half_line / 2), hjust = 1),
    axis.text.y.right = ggplot2::element_text(
      margin = ggplot2::margin(l = 0.8 * half_line / 2), hjust = 0),

    ## Axis ticks
    axis.ticks = ggplot2::element_blank(),
    axis.ticks.length = ggplot2::unit(half_line / 2, "pt"),
    axis.ticks.length.x = NULL,
    axis.ticks.length.x.top = NULL,
    axis.ticks.length.x.bottom = NULL,
    axis.ticks.length.y = NULL,
    axis.ticks.length.y.left = NULL,
    axis.ticks.length.y.right = NULL,

    ## Axis Titles
    axis.title.x = ggplot2::element_text(
      margin = ggplot2::margin(t = half_line / 2),
      vjust = 1),
    axis.title.x.top = ggplot2::element_text(
      margin = ggplot2::margin(b = half_line / 2),
      vjust = 0),
    axis.title.y = ggplot2::element_text(
      angle = 90,
      margin = ggplot2::margin(r = half_line/2),
      vjust = 1),
    axis.title.y.right = ggplot2::element_text(
      angle = -90,
      margin = ggplot2::margin(l = half_line/2), vjust = 0),

    # Legend things -----------------------------------------------
    legend.background = ggplot2::element_blank(),
    legend.spacing = ggplot2::unit(2 * half_line, "pt"),
    legend.spacing.x = NULL,
    legend.spacing.y = NULL,
    legend.margin = ggplot2::margin(
      t = half_line,
      r = half_line,
      b = half_line,
      l = half_line),
    legend.key = ggplot2::element_blank(),
    legend.key.size = ggplot2::unit(1.2, "lines"),
    legend.key.height = NULL,
    legend.key.width = NULL,
    legend.text = ggplot2::element_text(size = ggplot2::rel(0.8)),
    legend.text.align = NULL,
    legend.title = ggplot2::element_text(
      hjust = 0,
      size = ggplot2::rel(0.8)),
    legend.title.align = NULL,
    legend.position = "top",
    legend.direction = NULL,
    legend.justification = "center",
    legend.box = NULL,
    legend.box.margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 0, "pt"),
    legend.box.background = ggplot2::element_blank(),
    legend.box.spacing = ggplot2::unit(2 * half_line, "pt"),

    # Panel things -----------------------------------------------
    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    panel.grid = ggplot2::element_line(colour = zv_light_grey),
    panel.grid.minor = ggplot2::element_line(linewidth = ggplot2::rel(0.5)),
    panel.spacing = ggplot2::unit(half_line, "pt"),
    panel.spacing.x = NULL,
    panel.spacing.y = NULL,
    panel.ontop = FALSE,

    strip.background = ggplot2::element_blank(),
    strip.clip = "inherit",
    strip.text = ggplot2::element_text(
      colour = zv_black,
      size = ggplot2::rel(0.8),
      margin = ggplot2::margin(
        t = 0.8 * half_line,
        r = 0.8 * half_line,
        l = 0.8 * half_line,
        b = 0.8 * half_line)
    ),
    strip.text.x = NULL,
    strip.text.y = ggplot2::element_text(angle = -90),
    strip.text.y.left = ggplot2::element_text(angle = 90),
    strip.placement = "inside",
    strip.placement.x = NULL,
    strip.placement.y = NULL,
    strip.switch.pad.grid = ggplot2::unit(half_line/2, "pt"),
    strip.switch.pad.wrap = ggplot2::unit(half_line/2, "pt"),

    plot.background = ggplot2::element_rect(fill = bg_colour, colour = bg_colour),
    plot.title = ggplot2::element_text(
      family = title_family,
      size = ggplot2::rel(1.4),
      hjust = 0,
      vjust = 1,
      margin = ggplot2::margin(b = half_line)),
    plot.title.position = "plot",
    plot.subtitle = ggplot2::element_text(
      hjust = 0,
      vjust = 1,
      margin = ggplot2::margin(b = half_line)),
    #plot.subtitle.position = "plot",
    plot.caption = ggplot2::element_text(
      size = ggplot2::rel(0.8),
      hjust = 1,
      vjust = 1,
      margin = ggplot2::margin(t = half_line)),
    plot.caption.position = "plot",
    plot.tag = ggplot2::element_text(
      size = ggplot2::rel(1.2),
      hjust = 0.5,
      vjust = 0.5),
    plot.tag.position = "topleft",
    plot.margin = ggplot2::margin(
      t = half_line,
      r = half_line,
      l = half_line,
      b = half_line),

    complete = TRUE
  )

}
