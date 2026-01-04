#' Catppuccin Theme for ggplot2
#'
#' A minimal ggplot2 theme that applies Catppuccin colors to text, backgrounds,
#' and grid lines. The default flavor is "mocha", but all official flavors are
#' available.
#'
#' @param flavor The Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato").
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
theme_catppuccin <- function(flavor = "mocha", base_size = 12, base_family = "sans") {
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
