#' Catppuccin Theme for ggplot2
#'
#' A minimal ggplot2 theme that applies Catppuccin colors to text, backgrounds,
#' and grid lines. The default flavor is "mocha", but all official flavors are
#' available.
#'
#' @param flavor The Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param base_size Base font size passed to [ggplot2::theme_minimal()].
#' @param base_family Base font family passed to [ggplot2::theme_minimal()].
#'
#' @return A `ggplot2` theme object.
#' @import ggplot2
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_color_catppuccin() +
#'   theme_catppuccin("latte")
#' @export
theme_catppuccin <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"), base_size = 12, base_family = "sans") {
  # Validate the choice
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))

  # Select the colors based on choice
  colors <- catppuccin_flavors[[flavor]]

  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      # Backgrounds
      plot.background = element_rect(fill = colors$base, color = NA),
      panel.background = element_rect(fill = colors$base, color = NA),
      legend.background = element_rect(fill = colors$base, color = NA),

      # Text
      text = element_text(color = colors$text),
      axis.text = element_text(color = colors$subtext1),
      axis.title = element_text(color = colors$text, face = "bold"),
      plot.title = element_text(color = colors$text, face = "bold", size = rel(1.2), margin = margin(b = 10)),
      plot.subtitle = element_text(color = colors$subtext0, margin = margin(b = 10)),
      plot.caption = element_text(color = colors$overlay2, size = rel(0.8)),
      legend.text = element_text(color = colors$subtext1),
      legend.title = element_text(color = colors$text, face = "bold"),

      # Grid lines & Axes
      panel.grid.major = element_line(color = colors$surface0),
      panel.grid.minor = element_line(color = colors$surface0, linetype = "dotted"),
      axis.line = element_line(color = colors$overlay2),

      # Facets
      strip.background = element_rect(fill = colors$surface0, color = NA),
      strip.text = element_text(color = colors$text, face = "bold")
    )
}

#' Minimal Catppuccin Theme for ggplot2
#'
#' An even more minimal theme than `theme_catppuccin()`, with no grid lines by default.
#' Useful for presentations or when you want maximum focus on the data.
#'
#' @param flavor The Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param base_size Base font size passed to [ggplot2::theme_minimal()].
#' @param base_family Base font family passed to [ggplot2::theme_minimal()].
#' @param grid Which grid lines to show: "none" (default), "major", "minor", or "both".
#'
#' @return A `ggplot2` theme object.
#' @import ggplot2
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_color_catppuccin() +
#'   theme_catppuccin_minimal("mocha")
#' @export
theme_catppuccin_minimal <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                     base_size = 12, base_family = "sans",
                                     grid = c("none", "major", "minor", "both")) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  grid <- match.arg(grid)
  colors <- catppuccin_flavors[[flavor]]

  base_theme <- theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      # Backgrounds
      plot.background = element_rect(fill = colors$base, color = NA),
      panel.background = element_rect(fill = colors$base, color = NA),
      legend.background = element_rect(fill = colors$base, color = NA),

      # Text
      text = element_text(color = colors$text),
      axis.text = element_text(color = colors$subtext1),
      axis.title = element_text(color = colors$text, face = "bold"),
      plot.title = element_text(color = colors$text, face = "bold", size = rel(1.2), margin = margin(b = 10)),
      plot.subtitle = element_text(color = colors$subtext0, margin = margin(b = 10)),
      plot.caption = element_text(color = colors$overlay2, size = rel(0.8)),
      legend.text = element_text(color = colors$subtext1),
      legend.title = element_text(color = colors$text, face = "bold"),

      # No grid lines by default
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line = element_line(color = colors$overlay2),

      # Facets
      strip.background = element_rect(fill = colors$surface0, color = NA),
      strip.text = element_text(color = colors$text, face = "bold")
    )

  # Add grid lines based on parameter
  if (grid %in% c("major", "both")) {
    base_theme <- base_theme %+replace%
      theme(panel.grid.major = element_line(color = colors$surface0))
  }
  if (grid %in% c("minor", "both")) {
    base_theme <- base_theme %+replace%
      theme(panel.grid.minor = element_line(color = colors$surface0, linetype = "dotted"))
  }

  base_theme
}

#' Void Catppuccin Theme for ggplot2
#'
#' A completely minimal theme with no axes, grid, or text elements except the title.
#' Ideal for maps, images, or highly stylized visualizations.
#'
#' @param flavor The Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param base_size Base font size for the title.
#' @param base_family Base font family for the title.
#'
#' @return A `ggplot2` theme object.
#' @import ggplot2
#' @examples
#' library(ggplot2)
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_catppuccin_c() +
#'   theme_catppuccin_void() +
#'   labs(title = "Old Faithful Eruption Density")
#' @export
theme_catppuccin_void <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                  base_size = 12, base_family = "sans") {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  colors <- catppuccin_flavors[[flavor]]

  theme_void(base_size = base_size, base_family = base_family) %+replace%
    theme(
      # Backgrounds
      plot.background = element_rect(fill = colors$base, color = NA),
      panel.background = element_rect(fill = colors$base, color = NA),
      legend.background = element_rect(fill = colors$base, color = NA),

      # Minimal text - only title and legend
      text = element_text(color = colors$text),
      plot.title = element_text(color = colors$text, face = "bold", size = rel(1.2), margin = margin(b = 10)),
      plot.subtitle = element_text(color = colors$subtext0, margin = margin(b = 10)),
      legend.text = element_text(color = colors$subtext1),
      legend.title = element_text(color = colors$text, face = "bold")
    )
}
