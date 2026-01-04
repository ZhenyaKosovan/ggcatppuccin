#' Catppuccin CSS for R Markdown and Quarto
#'
#' Generate a small CSS theme based on the Catppuccin palettes that can be used
#' in R Markdown and Quarto documents. The CSS sets body background, text,
#' heading, link, and code block colors using the chosen flavor.
#'
#' @param flavor Which Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato").
#' @return `catppuccin_css()` returns a single string containing CSS. `write_catppuccin_css()`
#'   writes that CSS to a file and invisibly returns the normalized file path.
#' @examples
#' css_text <- catppuccin_css("latte")
#' cat(substr(css_text, 1, 80))
#'
#' # Write a CSS file you can point to from Quarto/R Markdown
#' css_file <- tempfile(fileext = ".css")
#' write_catppuccin_css(css_file, flavor = "mocha")
#' file.exists(css_file)
#' @export
catppuccin_css <- function(flavor = "mocha") {
  flavor <- match.arg(flavor, choices = names(catppuccin_flavors))
  cols <- catppuccin_flavors[[flavor]]

  paste(
    ":root {",
    sprintf("  --catppuccin-base: %s;", cols$base),
    sprintf("  --catppuccin-surface: %s;", cols$surface0),
    sprintf("  --catppuccin-text: %s;", cols$text),
    sprintf("  --catppuccin-subtext: %s;", cols$subtext1),
    sprintf("  --catppuccin-accent: %s;", cols$mauve),
    "}",
    "",
    "body {",
    "  background-color: var(--catppuccin-base);",
    "  color: var(--catppuccin-text);",
    "}",
    "",
    "a {",
    "  color: var(--catppuccin-accent);",
    "}",
    "",
    "a:hover, a:focus {",
    "  color: var(--catppuccin-text);",
    "}",
    "",
    "pre, code {",
    "  background-color: var(--catppuccin-surface);",
    "  color: var(--catppuccin-text);",
    "}",
    "",
    "blockquote {",
    "  border-left: 4px solid var(--catppuccin-accent);",
    "  color: var(--catppuccin-subtext);",
    "  background-color: var(--catppuccin-surface);",
    "  padding: 0.5em 1em;",
    "}",
    sep = "\n"
  )
}

#' @rdname catppuccin_css
#' @param path File path where the CSS should be written.
#' @export
write_catppuccin_css <- function(path = "catppuccin.css", flavor = "mocha") {
  css <- catppuccin_css(flavor)
  path <- normalizePath(path, mustWork = FALSE)
  writeLines(css, path)
  invisible(path)
}
