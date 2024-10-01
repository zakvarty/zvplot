
print_all_palettes()

zv_palettes("set_qual", n = 17)
# Discrete colour examples

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
geom_line(colour = zv_orange, size = 0.7) +
  ggtitle(label = "A plot of sepal dimensions",
          subtitle = "This should not really be a time series") +
geom_hline(yintercept = 0) +
  theme_zv()

# Discrete colour as an aesthetic

library(dplyr)
iris %>%
group_by(Species) %>%
ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  labs(
    title = "A better plot of sepal dimensions",
    subtitle = "Grouped by species",
    xlab = "Sepal Length",
    ylab = "Sepal Width",
    caption = "some caption text") +
  #ggtitle("A better plot of sepal dimensions", "Grouped by species") +
  geom_point(aes(colour = Species + 1)) +
  scale_colour_zv_d() +
  theme_zv()

iris %>%
  group_by(Species) %>%
  ggplot(aes(colour = Species, fill = Species)) +
  geom_bar(aes(x = Species)) +
  theme_zv() +
  scale_colour_zv_d() +
  scale_fill_zv_d()

## Continuous colour as an aesthetic

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

iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
  geom_point() +
  theme_zv() +
  scale_colour_zv_c("seq_fuchia")
