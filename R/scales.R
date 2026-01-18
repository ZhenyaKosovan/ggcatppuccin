#' Catppuccin Color Scales
#'
#' ggplot2 discrete color and fill scales that use the Catppuccin palette. The
#' palette order is kept consistent across flavors.
#'
#' @param flavor The flavor of Catppuccin to use ("mocha", "latte", "frappe", "macchiato").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()].
#'
#' @return A `ggplot2` discrete scale object.
#' @import ggplot2
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(factor(cyl), fill = factor(gear))) +
#'   geom_bar() +
#'   scale_fill_catppuccin("macchiato") +
#'   theme_minimal()
#' @export
scale_color_catppuccin <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"), ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  # Define the palette order
  pal_vec <- c(cols$blue, cols$mauve, cols$red, cols$green, cols$peach, cols$yellow, cols$lavender)

  scale_color_manual(values = pal_vec, ...)
}

#' @rdname scale_color_catppuccin
#' @export
scale_fill_catppuccin <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"), ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  pal_vec <- c(cols$blue, cols$mauve, cols$red, cols$green, cols$peach, cols$yellow, cols$lavender)

  scale_fill_manual(values = pal_vec, ...)
}

#' @rdname scale_color_catppuccin
#' @export
scale_color_catppuccin_d <- scale_color_catppuccin

#' @rdname scale_color_catppuccin
#' @export
scale_fill_catppuccin_d <- scale_fill_catppuccin

#' Catppuccin Continuous Color Scales
#'
#' Continuous color and fill scales that interpolate between Catppuccin colors.
#' Creates smooth gradients suitable for numeric data.
#'
#' @param flavor The flavor of Catppuccin to use ("mocha", "latte", "frappe", "macchiato").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param ... Additional arguments passed to [ggplot2::scale_color_gradient()] or
#'   [ggplot2::scale_fill_gradient()].
#'
#' @return A `ggplot2` continuous scale object.
#' @import ggplot2
#' @examples
#' library(ggplot2)
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_catppuccin_c("mocha") +
#'   theme_catppuccin("mocha")
#' @export
scale_color_catppuccin_c <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"), ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  scale_color_gradient(low = cols$blue, high = cols$mauve, ...)
}

#' @rdname scale_color_catppuccin_c
#' @export
scale_fill_catppuccin_c <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"), ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  scale_fill_gradient(low = cols$blue, high = cols$mauve, ...)
}

#' Catppuccin Sequential Color Scales
#'
#' Sequential color and fill scales that create a gradient from the base color
#' to a chosen accent color, suitable for showing ordered numeric data.
#'
#' @param flavor The flavor of Catppuccin to use ("mocha", "latte", "frappe", "macchiato").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param accent Which accent color to use for the high end ("blue", "mauve", "red",
#'   "green", "peach", "yellow", "lavender"). Defaults to "blue".
#' @param ... Additional arguments passed to [ggplot2::scale_color_gradient()].
#'
#' @return A `ggplot2` continuous scale object.
#' @import ggplot2
#' @examples
#' library(ggplot2)
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_catppuccin_sequential("mocha", accent = "mauve") +
#'   theme_catppuccin("mocha")
#' @export
scale_color_catppuccin_sequential <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                              accent = "blue", ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  accent <- match.arg(accent, choices = c("blue", "mauve", "red", "green", "peach", "yellow", "lavender"))
  cols <- catppuccin_flavors[[flavor]]

  scale_color_gradient(low = cols$base, high = cols[[accent]], ...)
}

#' @rdname scale_color_catppuccin_sequential
#' @export
scale_fill_catppuccin_sequential <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                             accent = "blue", ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  accent <- match.arg(accent, choices = c("blue", "mauve", "red", "green", "peach", "yellow", "lavender"))
  cols <- catppuccin_flavors[[flavor]]

  scale_fill_gradient(low = cols$base, high = cols[[accent]], ...)
}

#' Catppuccin Diverging Color Scales
#'
#' Diverging color and fill scales that use Catppuccin colors with a neutral
#' midpoint, suitable for data with a meaningful center point.
#'
#' @param flavor The flavor of Catppuccin to use ("mocha", "latte", "frappe", "macchiato").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param low_color Color for the low end ("blue", "mauve", "red", "green", "peach",
#'   "yellow", "lavender"). Defaults to "blue".
#' @param high_color Color for the high end. Defaults to "red".
#' @param midpoint The midpoint value for the diverging scale. Defaults to 0.
#' @param ... Additional arguments passed to [ggplot2::scale_color_gradient2()].
#'
#' @return A `ggplot2` continuous scale object.
#' @import ggplot2
#' @examples
#' library(ggplot2)
#'
#' df <- data.frame(
#'   x = rep(1:10, 10),
#'   y = rep(1:10, each = 10),
#'   z = rnorm(100)
#' )
#'
#' ggplot(df, aes(x, y, fill = z)) +
#'   geom_tile() +
#'   scale_fill_catppuccin_diverging("mocha") +
#'   theme_catppuccin("mocha")
#' @export
scale_color_catppuccin_diverging <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                             low_color = "blue", high_color = "red",
                                             midpoint = 0, ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  low_color <- match.arg(low_color, choices = c("blue", "mauve", "red", "green", "peach", "yellow", "lavender"))
  high_color <- match.arg(high_color, choices = c("blue", "mauve", "red", "green", "peach", "yellow", "lavender"))
  cols <- catppuccin_flavors[[flavor]]

  scale_color_gradient2(
    low = cols[[low_color]],
    mid = cols$base,
    high = cols[[high_color]],
    midpoint = midpoint,
    ...
  )
}

#' @rdname scale_color_catppuccin_diverging
#' @export
scale_fill_catppuccin_diverging <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                            low_color = "blue", high_color = "red",
                                            midpoint = 0, ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  low_color <- match.arg(low_color, choices = c("blue", "mauve", "red", "green", "peach", "yellow", "lavender"))
  high_color <- match.arg(high_color, choices = c("blue", "mauve", "red", "green", "peach", "yellow", "lavender"))
  cols <- catppuccin_flavors[[flavor]]

  scale_fill_gradient2(
    low = cols[[low_color]],
    mid = cols$base,
    high = cols[[high_color]],
    midpoint = midpoint,
    ...
  )
}
