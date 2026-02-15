#' Catppuccin Geom Helpers
#'
#' Convenience wrappers around standard ggplot2 geoms that default to Catppuccin
#' colors so you can get a styled plot without manually setting aesthetics each time.
#'
#' @param mapping,data,position,na.rm,show.legend,inherit.aes,... Standard ggplot2
#'   geom parameters. See the corresponding ggplot2 geom documentation for details.
#' @param flavor Which Catppuccin flavor to use ("mocha", "latte", "frappe",
#'   "macchiato", "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param color,colour Default point/line/border color; falls back to a Catppuccin
#'   accent if `NULL`.
#' @param fill Default fill color; falls back to a Catppuccin accent if `NULL`.
#' @param width Bar/column width.
#' @param linewidth,linetype Line width and type for line geoms.
#' @param orientation Orientation of the geom ("x" or "y").
#' @param outlier.colour,outlier.fill,outlier.shape,outlier.size,outlier.stroke,outlier.alpha
#'   Aesthetics for outliers in boxplots.
#' @param notch,notchwidth,staplewidth,varwidth Boxplot parameters.
#' @param trim,scale Violin plot parameters.
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
geom_catppuccin_point <- function(mapping = NULL, data = NULL, flavor = getOption("ggcatppuccin.flavor", "mocha"),
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
geom_catppuccin_col <- function(mapping = NULL, data = NULL, flavor = getOption("ggcatppuccin.flavor", "mocha"),
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

#' @rdname geom_catppuccin_point
#' @export
geom_catppuccin_line <- function(mapping = NULL, data = NULL, flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                 color = NULL, linewidth = NULL, linetype = 1, ...,
                                 na.rm = FALSE, orientation = NA,
                                 show.legend = NA, inherit.aes = TRUE) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))

  if (is.null(color)) {
    color <- catppuccin_flavors[[flavor]]$blue
  }

  ggplot2::geom_line(
    mapping = mapping,
    data = data,
    color = color,
    linewidth = linewidth,
    linetype = linetype,
    ...,
    na.rm = na.rm,
    orientation = orientation,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}

#' @rdname geom_catppuccin_point
#' @export
geom_catppuccin_bar <- function(mapping = NULL, data = NULL, flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                fill = NULL, color = NA, ...,
                                position = "stack", width = NULL,
                                na.rm = FALSE, orientation = NA,
                                show.legend = NA, inherit.aes = TRUE) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))

  if (is.null(fill)) {
    fill <- catppuccin_flavors[[flavor]]$mauve
  }

  ggplot2::geom_bar(
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

#' @rdname geom_catppuccin_point
#' @export
geom_catppuccin_boxplot <- function(mapping = NULL, data = NULL, flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                    fill = NULL, color = NULL, ...,
                                    outlier.colour = NULL, outlier.fill = NULL,
                                    outlier.shape = 19, outlier.size = 1.5,
                                    outlier.stroke = 0.5, outlier.alpha = NULL,
                                    notch = FALSE, notchwidth = 0.5, staplewidth = 0,
                                    varwidth = FALSE, na.rm = FALSE, orientation = NA,
                                    show.legend = NA, inherit.aes = TRUE) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  if (is.null(fill)) {
    fill <- cols$blue
  }
  if (is.null(color)) {
    color <- cols$text
  }

  ggplot2::geom_boxplot(
    mapping = mapping,
    data = data,
    fill = fill,
    color = color,
    ...,
    outlier.colour = outlier.colour,
    outlier.fill = outlier.fill,
    outlier.shape = outlier.shape,
    outlier.size = outlier.size,
    outlier.stroke = outlier.stroke,
    outlier.alpha = outlier.alpha,
    notch = notch,
    notchwidth = notchwidth,
    staplewidth = staplewidth,
    varwidth = varwidth,
    na.rm = na.rm,
    orientation = orientation,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}

#' @rdname geom_catppuccin_point
#' @export
geom_catppuccin_violin <- function(mapping = NULL, data = NULL, flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                   fill = NULL, color = NULL, ...,
                                   trim = TRUE, scale = "area",
                                   na.rm = FALSE, orientation = NA,
                                   show.legend = NA, inherit.aes = TRUE) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  if (is.null(fill)) {
    fill <- cols$mauve
  }
  if (is.null(color)) {
    color <- cols$text
  }

  ggplot2::geom_violin(
    mapping = mapping,
    data = data,
    fill = fill,
    color = color,
    ...,
    trim = trim,
    scale = scale,
    na.rm = na.rm,
    orientation = orientation,
    show.legend = show.legend,
    inherit.aes = inherit.aes
  )
}
