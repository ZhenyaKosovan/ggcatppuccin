#' Set Global Catppuccin Flavor
#'
#' Sets the preferred Catppuccin flavor for the R session, so subsequent calls
#' to scales or themes can omit the `flavor` argument if they read this option.
#'
#' @param flavor Flavor name to store (e.g. `"mocha"`). No validation is applied.
#'
#' @return Invisibly returns the previous value of the option.
#' @export
set_catppuccin_flavor <- function(flavor) {
  invisible(options(ggcatppuccin.flavor = flavor))
}
