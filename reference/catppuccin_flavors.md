# Catppuccin Color Palettes

A named list containing hex color codes for all four Catppuccin flavors:
Latte, Frappe, Macchiato, and Mocha, plus colorblind-friendly variants
(`latte_cb`, `frappe_cb`, `macchiato_cb`, `mocha_cb`). Each flavor
contains the same set of palette elements, matching the official
Catppuccin design system. The `_cb` variants adjust accent colors
(green, mauve, lavender, and sometimes peach) so that all pairs remain
distinguishable under deuteranopia, protanopia, and tritanopia (min
pairwise delta-E \> 10).

## Usage

``` r
catppuccin_flavors
```

## Format

An object of class `list` of length 8.

## Value

A named list of flavors, each itself a named list of hex strings.

## See also

[`scale_color_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin.md),
[`scale_fill_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin.md)

## Examples

``` r
catppuccin_flavors$mocha$blue
#> [1] "#89b4fa"
catppuccin_flavors$mocha_cb$blue
#> [1] "#89b4fa"
names(catppuccin_flavors$latte)
#>  [1] "base"     "mantle"   "text"     "subtext1" "subtext0" "overlay2"
#>  [7] "surface0" "red"      "peach"    "yellow"   "green"    "blue"    
#> [13] "lavender" "mauve"   
```
