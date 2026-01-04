#' Catppuccin Geom Helpers
#'
#' Convenience wrappers around [`ggplot2::geom_point()`] and
#' [`ggplot2::geom_col()`] that default to Catppuccin colors so you can get a
#' styled plot without manually setting aesthetics each time.
#'
#' @inheritParams ggplot2::geom_point
#' @inheritParams ggplot2::geom_col
#' @param flavor Which Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato").
#' @param color Default point color; falls back to a Catppuccin accent if `NULL`.
#' @param fill Default column fill; falls back to a Catppuccin accent if `NULL`.
#' @param width Bar width passed to [ggplot2::geom_col()].
#'
#' @return A ggplot2 layer object.
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
#'   geom_catppuccin_point() +
#'   scale_color_catppuccin()
#'
#' ggplot(mtcars, aes(factor(cyl), mpg)) +
#'   geom_catppuccin_col()
#' @export
geom_catppuccin_point <- function(mapping = NULL, data = NULL, flavor = "mocha",
                                  color = NULL, ..., na.rm = FALSE,
                                  show.legend = NA, inherit.aes = TRUE) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))

  if (is.null(color)) {
    color <- catppuccin_flavors[[flavor]]$blue
  }

  ggplot2::geom_point(
    mapping = mapping,
    data = data,
    color = color,
    ...,
    na.rm = na.rm,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}

#' @rdname geom_catppuccin_point
#' @export
geom_catppuccin_col <- function(mapping = NULL, data = NULL, flavor = "mocha",
                                fill = NULL, color = NA, ...,
                                position = "stack", width = NULL,
                                na.rm = FALSE, orientation = NA,
                                show.legend = NA, inherit.aes = TRUE) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))

  if (is.null(fill)) {
    fill <- catppuccin_flavors[[flavor]]$mauve
  }

  ggplot2::geom_col(
    mapping = mapping,
    data = data,
    fill = fill,
    color = color,
    ...,
    position = position,
    width = width,
    na.rm = na.rm,
    orientation = orientation,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}
