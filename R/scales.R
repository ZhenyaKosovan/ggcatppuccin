#' Catppuccin Color Scales
#'
#' ggplot2 discrete color and fill scales that use the Catppuccin palette. The
#' palette order is kept consistent across flavors.
#'
#' @param flavor The flavor of Catppuccin to use ("mocha", "latte", "frappe", "macchiato").
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
scale_color_catppuccin <- function(flavor = "mocha", ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  # Define the palette order
  pal_vec <- c(cols$blue, cols$mauve, cols$red, cols$green, cols$peach, cols$yellow, cols$lavender)

  scale_color_manual(values = pal_vec, ...)
}

#' @rdname scale_color_catppuccin
#' @export
scale_fill_catppuccin <- function(flavor = "mocha", ...) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  pal_vec <- c(cols$blue, cols$mauve, cols$red, cols$green, cols$peach, cols$yellow, cols$lavender)

  scale_fill_manual(values = pal_vec, ...)
}
