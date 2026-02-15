#' Set Global Catppuccin Flavor
#'
#' Sets the preferred Catppuccin flavor for the R session, so subsequent calls
#' to scales or themes can omit the `flavor` argument if they read this option.
#'
#' @param flavor Flavor name to store (e.g. `"mocha"` or `"mocha_cb"`). No
#'   validation is applied.
#'
#' @return Invisibly returns the previous value of the option.
#' @export
set_catppuccin_flavor <- function(flavor) {
  invisible(options(ggcatppuccin.flavor = flavor))
}

# Internal storage for original geom defaults, used by reset_catppuccin()
.ggcatppuccin_env <- new.env(parent = emptyenv())

#' Activate Catppuccin Defaults for Common Geoms and Discrete Scales
#'
#' Sets Catppuccin colors as the default for common geoms (point, line, bar, col,
#' boxplot, violin) and as the default discrete color/fill scales. After calling
#' this, plain `geom_line()` and mapped discrete `color`/`fill` aesthetics will
#' automatically use Catppuccin colors, for those supported defaults.
#'
#' @param flavor Which Catppuccin flavor to use ("mocha", "latte", "frappe",
#'   "macchiato", "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb").
#'   Defaults to the value set by [set_catppuccin_flavor()], or "mocha" if not
#'   set.
#'
#' @return Invisibly returns `NULL`. Called for its side effects.
#' @seealso [reset_catppuccin()] to restore ggplot2 defaults.
#' @examples
#' library(ggplot2)
#'
#' use_catppuccin("mocha")
#'
#' # Now plain geoms use Catppuccin colors:
#' ggplot(mtcars, aes(mpg, wt)) + geom_point()
#'
#' # And mapped aesthetics auto-use the Catppuccin palette:
#' ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) + geom_point()
#'
#' # Restore original defaults when done:
#' reset_catppuccin()
#' @export
use_catppuccin <- function(flavor = getOption("ggcatppuccin.flavor", "mocha")) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  # Save original defaults (only on first call, so nested calls don't clobber)
  if (is.null(.ggcatppuccin_env$saved)) {
    .ggcatppuccin_env$saved <- list(
      point   = ggplot2::GeomPoint$default_aes,
      line    = ggplot2::GeomLine$default_aes,
      col     = ggplot2::GeomCol$default_aes,
      bar     = ggplot2::GeomBar$default_aes,
      boxplot = ggplot2::GeomBoxplot$default_aes,
      violin  = ggplot2::GeomViolin$default_aes,
      discrete_colour = getOption("ggplot2.discrete.colour"),
      discrete_fill   = getOption("ggplot2.discrete.fill")
    )
  }

  # Update geom defaults for unmapped aesthetics
  ggplot2::update_geom_defaults("point",   list(colour = cols$blue))
  ggplot2::update_geom_defaults("line",    list(colour = cols$blue))
  ggplot2::update_geom_defaults("col",     list(fill = cols$mauve))
  ggplot2::update_geom_defaults("bar",     list(fill = cols$mauve))
  ggplot2::update_geom_defaults("boxplot", list(fill = cols$blue, colour = cols$text))
  ggplot2::update_geom_defaults("violin",  list(fill = cols$mauve, colour = cols$text))

  # Set default discrete scales so mapped aes(color = ...) uses Catppuccin
  options(
    ggplot2.discrete.colour = function(...) scale_color_catppuccin(flavor = flavor, ...),
    ggplot2.discrete.fill   = function(...) scale_fill_catppuccin(flavor = flavor, ...)
  )

  # Also update the session flavor
  set_catppuccin_flavor(flavor)

  invisible(NULL)
}

#' Reset Geom and Scale Defaults to ggplot2 Originals
#'
#' Restores all geom defaults and discrete scale options that were changed by
#' [use_catppuccin()].
#'
#' @return Invisibly returns `NULL`. Called for its side effects.
#' @seealso [use_catppuccin()]
#' @examples
#' use_catppuccin("latte")
#' # ... make plots ...
#' reset_catppuccin()
#' @export
reset_catppuccin <- function() {
  saved <- .ggcatppuccin_env$saved
  if (is.null(saved)) {
    message("Nothing to reset: use_catppuccin() has not been called.")
    return(invisible(NULL))
  }

  # Restore geom defaults
  ggplot2::update_geom_defaults("point",   saved$point)
  ggplot2::update_geom_defaults("line",    saved$line)
  ggplot2::update_geom_defaults("col",     saved$col)
  ggplot2::update_geom_defaults("bar",     saved$bar)
  ggplot2::update_geom_defaults("boxplot", saved$boxplot)
  ggplot2::update_geom_defaults("violin",  saved$violin)

  # Restore discrete scale options
  options(
    ggplot2.discrete.colour = saved$discrete_colour,
    ggplot2.discrete.fill   = saved$discrete_fill
  )

  .ggcatppuccin_env$saved <- NULL

  invisible(NULL)
}
