# Catppuccin Sequential Color Scales

Sequential color and fill scales that create a gradient from the base
color to a chosen accent color, suitable for showing ordered numeric
data.

## Usage

``` r
scale_color_catppuccin_sequential(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  accent = "blue",
  ...
)

scale_fill_catppuccin_sequential(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  accent = "blue",
  ...
)
```

## Arguments

- flavor:

  The flavor of Catppuccin to use ("mocha", "latte", "frappe",
  "macchiato", "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb").
  Defaults to the value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- accent:

  Which accent color to use for the high end ("blue", "mauve", "red",
  "green", "peach", "yellow", "lavender"). Defaults to "blue".

- ...:

  Additional arguments passed to
  [`ggplot2::scale_color_gradient()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Value

A `ggplot2` continuous scale object.

## Examples

``` r
library(ggplot2)

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_catppuccin_sequential("mocha", accent = "mauve") +
  theme_catppuccin("mocha")
```
