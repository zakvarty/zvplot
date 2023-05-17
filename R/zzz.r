.onLoad <- function(libname, pkgname) {
  sysfonts::font_add(
    family = "Oswald",
    regular = system.file("fonts", "Oswald", "static", "Oswald-Regular.ttf", package = "zvplot"),
    #light = system.file("fonts", "Oswald", "static", "Oswald-Light.ttf", package = "zvplot"),
    bold = system.file("fonts", "Oswald", "static", "Oswald-Bold.ttf", package = "zvplot"),
  )
  sysfonts::font_add(
    family = "Oxygen",
    regular = system.file("fonts", "Oxygen", "Oxygen-Regular.ttf", package = "zvplot"),
    #light = system.file("fonts", "Oxygen", "Oxygen-Light.ttf", package = "zvplot"),
    bold = system.file("fonts", "Oxygen", "Oxygen-Bold.ttf", package = "zvplot")
  )
  showtext::showtext_auto()
}
