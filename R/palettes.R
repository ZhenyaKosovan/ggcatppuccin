#' Catppuccin Color Palettes
#'
#' A named list containing hex color codes for all four Catppuccin flavors:
#' Latte, Frappe, Macchiato, and Mocha. Each flavor contains the same set of
#' palette elements, matching the official Catppuccin design system.
#'
#' @return A named list of flavors, each itself a named list of hex strings.
#' @seealso [scale_color_catppuccin()], [scale_fill_catppuccin()]
#' @examples
#' catppuccin_flavors$mocha$blue
#' names(catppuccin_flavors$latte)
#' @export
catppuccin_flavors <- list(
  latte = list(
    base = "#eff1f5", mantle = "#e6e9ef", text = "#4c4f69",
    subtext1 = "#5c5f77", subtext0 = "#6c6f85", overlay2 = "#7c7f93",
    surface0 = "#ccd0da", red = "#d20f39", peach = "#fe640b",
    yellow = "#df8e1d", green = "#40a02b", blue = "#1e66f5",
    lavender = "#7287fd", mauve = "#8839ef"
  ),
  frappe = list(
    base = "#303446", mantle = "#292c3c", text = "#c6d0f5",
    subtext1 = "#b5bfe2", subtext0 = "#a5adce", overlay2 = "#949cbb",
    surface0 = "#414559", red = "#e78284", peach = "#ef9f76",
    yellow = "#e5c890", green = "#a6d189", blue = "#8caaee",
    lavender = "#babbf1", mauve = "#ca9ee6"
  ),
  macchiato = list(
    base = "#24273a", mantle = "#1e2030", text = "#cad3f5",
    subtext1 = "#b8c0e0", subtext0 = "#a5adcb", overlay2 = "#939ab7",
    surface0 = "#363a4f", red = "#ed8796", peach = "#f5a97f",
    yellow = "#eed49f", green = "#a6da95", blue = "#8aadf4",
    lavender = "#b7bdf8", mauve = "#c6a0f6"
  ),
  mocha = list(
    base = "#1e1e2e", mantle = "#181825", text = "#cdd6f4",
    subtext1 = "#bac2de", subtext0 = "#a6adc8", overlay2 = "#9399b2",
    surface0 = "#313244", red = "#f38ba8", peach = "#fab387",
    yellow = "#f9e2af", green = "#a6e3a1", blue = "#89b4fa",
    lavender = "#b4befe", mauve = "#cba6f7"
  )
)
