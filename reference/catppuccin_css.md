# Catppuccin CSS for R Markdown and Quarto

Generate a small CSS theme based on the Catppuccin palettes that can be
used in R Markdown and Quarto documents. The CSS sets body background,
text, heading, link, and code block colors using the chosen flavor.

## Usage

``` r
catppuccin_css(flavor = getOption("ggcatppuccin.flavor", "mocha"))

write_catppuccin_css(
  path = "catppuccin.css",
  flavor = getOption("ggcatppuccin.flavor", "mocha")
)
```

## Arguments

- flavor:

  Which Catppuccin flavor to use ("mocha", "latte", "frappe",
  "macchiato"). Defaults to the value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- path:

  File path where the CSS should be written.

## Value

`catppuccin_css()` returns a single string containing CSS.
`write_catppuccin_css()` writes that CSS to a file and invisibly returns
the normalized file path.

## Examples

``` r
css_text <- catppuccin_css("latte")
cat(substr(css_text, 1, 80))
#> :root {
#>   --catppuccin-base: #eff1f5;
#>   --catppuccin-surface: #ccd0da;
#>   --catpp

# Write a CSS file you can point to from Quarto/R Markdown
css_file <- tempfile(fileext = ".css")
write_catppuccin_css(css_file, flavor = "mocha")
file.exists(css_file)
#> [1] TRUE
```
