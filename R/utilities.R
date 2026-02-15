# Avoid CMD check notes about global variables in ggplot2 aes()
utils::globalVariables(c("x", "y", "name", "color", "flavor"))

#' Extract Catppuccin Palette Colors
#'
#' Extract a vector of color hex codes from a Catppuccin flavor. Useful for
#' manual color selection or creating custom scales.
#'
#' @param flavor The Catppuccin flavor to use ("mocha", "latte", "frappe",
#'   "macchiato", "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param colors Character vector of color names to extract. If NULL (default),
#'   returns all accent colors in the standard palette order.
#'
#' @return A named character vector of hex color codes.
#' @examples
#' # Get all accent colors
#' catppuccin_palette("mocha")
#'
#' # Get specific colors
#' catppuccin_palette("latte", c("blue", "red", "green"))
#'
#' # Use in custom plot
#' my_colors <- catppuccin_palette("frappe", c("mauve", "peach"))
#' @export
catppuccin_palette <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                               colors = NULL) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  if (is.null(colors)) {
    # Return standard palette order
    colors <- c("blue", "mauve", "red", "green", "peach", "yellow", "lavender")
  } else {
    # Validate requested colors
    valid_colors <- c("base", "mantle", "text", "subtext1", "subtext0",
                     "overlay2", "surface0", "red", "peach", "yellow",
                     "green", "blue", "lavender", "mauve")
    invalid <- setdiff(colors, valid_colors)
    if (length(invalid) > 0) {
      stop("Invalid color names: ", paste(invalid, collapse = ", "))
    }
  }

  # Extract colors
  result <- sapply(colors, function(color_name) cols[[color_name]], USE.NAMES = TRUE)
  unname(result)
}

#' Show Catppuccin Palette Colors
#'
#' Display all colors in a Catppuccin flavor as a visual swatch. Useful for
#' exploring available colors and choosing custom color combinations.
#'
#' @param flavor The Catppuccin flavor to use ("mocha", "latte", "frappe",
#'   "macchiato", "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb").
#'   Defaults to the value set by `set_catppuccin_flavor()`, or "mocha" if not set.
#' @param type Type of colors to show: "all" for all colors, "accents" for just
#'   accent colors, "neutrals" for base/text/surface colors.
#'
#' @return A ggplot2 object showing the color palette.
#' @import ggplot2
#' @importFrom rlang .data
#' @importFrom stats setNames
#' @examples
#' # Show all colors
#' show_catppuccin_palette("mocha")
#'
#' # Show just accent colors
#' show_catppuccin_palette("latte", type = "accents")
#'
#' # Show just neutrals
#' show_catppuccin_palette("frappe", type = "neutrals")
#' @export
show_catppuccin_palette <- function(flavor = getOption("ggcatppuccin.flavor", "mocha"),
                                    type = c("all", "accents", "neutrals")) {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  type <- match.arg(type)
  cols <- catppuccin_flavors[[flavor]]

  # Define color groups
  if (type == "accents") {
    color_names <- c("red", "peach", "yellow", "green", "blue", "lavender", "mauve")
  } else if (type == "neutrals") {
    color_names <- c("base", "mantle", "surface0", "overlay2", "subtext0", "subtext1", "text")
  } else {
    color_names <- c("base", "mantle", "surface0", "overlay2", "subtext0", "subtext1", "text",
                    "red", "peach", "yellow", "green", "blue", "lavender", "mauve")
  }

  # Extract colors
  palette_colors <- sapply(color_names, function(x) cols[[x]], USE.NAMES = FALSE)

  # Create data frame for plotting
  df <- data.frame(
    name = factor(color_names, levels = color_names),
    color = palette_colors,
    y = 1,
    x = seq_along(color_names)
  )

  # Determine text color based on flavor (light flavors need dark text)
  text_color <- if (flavor == "latte") cols$base else cols$text

  ggplot(df, aes(x = .data$x, y = .data$y, fill = .data$name)) +
    geom_tile(color = cols$overlay2, linewidth = 1) +
    geom_text(aes(label = .data$name), color = text_color, fontface = "bold", size = 3) +
    scale_fill_manual(values = stats::setNames(palette_colors, color_names)) +
    coord_fixed(ratio = 1) +
    theme_void() +
    theme(
      legend.position = "none",
      plot.title = element_text(hjust = 0.5, face = "bold", color = text_color),
      plot.background = element_rect(fill = cols$base, color = NA)
    ) +
    labs(title = paste("Catppuccin", tools::toTitleCase(flavor), "-", tools::toTitleCase(type)))
}

#' Compare Catppuccin Flavors
#'
#' Create a visual comparison of all four Catppuccin flavors side by side.
#' Useful for choosing which flavor to use for your plots.
#'
#' @param type Type of colors to compare: "accents" (default) or "all".
#'
#' @return A ggplot2 object showing all four flavors.
#' @import ggplot2
#' @examples
#' # Compare accent colors across flavors
#' compare_flavors()
#'
#' # Compare all colors
#' compare_flavors(type = "all")
#' @export
compare_flavors <- function(type = c("accents", "all")) {
  type <- match.arg(type)

  # Define color groups
  if (type == "accents") {
    color_names <- c("red", "peach", "yellow", "green", "blue", "lavender", "mauve")
  } else {
    color_names <- c("base", "mantle", "surface0", "overlay2", "subtext0", "subtext1", "text",
                    "red", "peach", "yellow", "green", "blue", "lavender", "mauve")
  }

  # Create data for all flavors
  flavor_names <- c("latte", "frappe", "macchiato", "mocha")
  df_list <- lapply(flavor_names, function(f) {
    cols <- catppuccin_flavors[[f]]
    palette_colors <- sapply(color_names, function(x) cols[[x]], USE.NAMES = FALSE)
    data.frame(
      flavor = f,
      name = color_names,
      color = palette_colors,
      x = seq_along(color_names),
      y = match(f, flavor_names)
    )
  })
  df <- do.call(rbind, df_list)
  df$flavor <- factor(df$flavor, levels = rev(flavor_names))

  # Use mocha for text since it works on most backgrounds
  text_color <- catppuccin_flavors$mocha$text

  ggplot(df, aes(x = .data$x, y = .data$flavor, fill = .data$color)) +
    geom_tile(color = "grey30", linewidth = 0.5) +
    geom_text(aes(label = .data$name), color = text_color, fontface = "bold", size = 2.5, angle = 90) +
    scale_fill_identity() +
    scale_y_discrete(labels = tools::toTitleCase(levels(df$flavor))) +
    theme_minimal() +
    theme(
      legend.position = "none",
      axis.title = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_text(face = "bold", size = 11),
      panel.grid = element_blank(),
      plot.title = element_text(hjust = 0.5, face = "bold"),
      plot.background = element_rect(fill = "white", color = NA)
    ) +
    labs(title = paste("Catppuccin Flavors -", tools::toTitleCase(type)))
}
