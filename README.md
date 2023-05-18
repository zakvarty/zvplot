
<!-- README.md is generated from README.Rmd. Please edit that file -->

# zvplot

<!-- badges: start -->
<!-- badges: end -->

## Overview

`{zvplot}` is a set of tools for creating and exporting graphics in R
that match the theme of [zakvarty.com](https://www.zakvarty.com).

The package provides extensions to `ggplot2`, as well as colour
definitions and helper functions more general plotting tasks in R.

## Installation

`{zvplot}` is not available on CRAN. You can install `zvplot` directly
from [GitHub](https://github.com/) with the following code:

``` r
# install.packages("devtools")
devtools::install_github("zakvarty/zvplot")
```

Some elements of `zvplot` extend `ggplot2` functionality. If you intend
to use these, ensure that you call `library(ggplot2)` or
`library(tidyverse)` before `library(zvplot)`.

``` r
library(ggplot2)
library(zvplot)
```

### Fonts

The default fonts for plot body and title are Oscar and Oxygen. These
are included within the package and do not need to be installed
separately.

### Palettes

`zvplot` defines several colour palettes:

``` r
zvplot::print_all_palettes()
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

``` r
zv_palettes("set_qual", n = 4)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r
zv_palettes("set_qual", n = 8)
```

<img src="man/figures/README-unnamed-chunk-5-2.png" width="100%" />

### Usage

### Discrete Colour Palette Examples

#### Example 1

``` r
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_line(colour = zv_orange, linewidth = 0.7) +
  ggtitle(
    label = "A plot of sepal dimensions",
    subtitle = "This should not really be a time series...") +
  geom_hline(yintercept = 0) +
  theme_zv()
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

#### Example 2

``` r
library(dplyr)
iris %>%
group_by(Species) %>%
ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  labs(
    title = "A better plot of sepal dimensions",
    subtitle = "Grouped by species",
    caption = "some caption text") +
  xlab("Sepal Length") + 
  ylab("Sepal Width") +
  #ggtitle("A better plot of sepal dimensions", "Grouped by species") +
  geom_point(aes(colour = Species)) +
  scale_colour_zv_d() +
  theme_zv()
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

#### Example 3

``` r
iris %>%
  group_by(Species) %>%
  ggplot(aes(colour = Species, fill = Species)) +
  geom_bar(aes(x = Species)) +
  theme_zv() +
  scale_colour_zv_d() +
  scale_fill_zv_d()
```

<img src="man/figures/README-unnamed-chunk-8-1.png" width="100%" />

### Continuous Colour Palette Examples

#### Example 4

``` r
target_data <- tibble::tibble(
  x = rep(x = seq(from = -10, to = 10, length.out = 101), each = 101),
  y = rep(x = seq(from = -10, to = 10, length.out = 101), times = 101),
  z = dnorm(x, mean = 3, sd = 1) * dnorm(y, mean = -2, sd = 1)
)

target_data %>%
  ggplot(aes(x = x, y = y, fill = log(z), z = log(z))) +
  geom_raster() +
  geom_contour(colour = zv_mid_gray) +
  coord_fixed() +
  scale_fill_zv_c(palette_name = "seq_orange") +
  theme_zv() +
  theme(legend.position = "right") +
  ggtitle("log-density of a bivariate Gaussian distribution")
```

<img src="man/figures/README-unnamed-chunk-9-1.png" width="100%" />

#### Example 5

``` r
iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
  geom_point() +
  theme_zv() +
  scale_colour_zv_c("seq_fuchia")
```

<img src="man/figures/README-unnamed-chunk-10-1.png" width="100%" />

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN.

-->
