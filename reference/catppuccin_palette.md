# Extract Catppuccin Palette Colors

Extract a vector of color hex codes from a Catppuccin flavor. Useful for
manual color selection or creating custom scales.

## Usage

``` r
catppuccin_palette(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  colors = NULL
)
```

## Arguments

- flavor:

  The Catppuccin flavor to use ("mocha", "latte", "frappe",
  "macchiato"). Defaults to the value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- colors:

  Character vector of color names to extract. If NULL (default), returns
  all accent colors in the standard palette order.

## Value

A named character vector of hex color codes.

## Examples

``` r
# Get all accent colors
catppuccin_palette("mocha")
#> [1] "#89b4fa" "#cba6f7" "#f38ba8" "#a6e3a1" "#fab387" "#f9e2af" "#b4befe"

# Get specific colors
catppuccin_palette("latte", c("blue", "red", "green"))
#> [1] "#1e66f5" "#d20f39" "#40a02b"

# Use in custom plot
my_colors <- catppuccin_palette("frappe", c("mauve", "peach"))
```
