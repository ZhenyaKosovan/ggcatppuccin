# Show Catppuccin Palette Colors

Display all colors in a Catppuccin flavor as a visual swatch. Useful for
exploring available colors and choosing custom color combinations.

## Usage

``` r
show_catppuccin_palette(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  type = c("all", "accents", "neutrals")
)
```

## Arguments

- flavor:

  The Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato",
  "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb"). Defaults to the
  value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- type:

  Type of colors to show: "all" for all colors, "accents" for just
  accent colors, "neutrals" for base/text/surface colors.

## Value

A ggplot2 object showing the color palette.

## Examples

``` r
# Show all colors
show_catppuccin_palette("mocha")


# Show just accent colors
show_catppuccin_palette("latte", type = "accents")


# Show just neutrals
show_catppuccin_palette("frappe", type = "neutrals")
```
