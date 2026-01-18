# Catppuccin Continuous Color Scales

Continuous color and fill scales that interpolate between Catppuccin
colors. Creates smooth gradients suitable for numeric data.

## Usage

``` r
scale_color_catppuccin_c(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  ...
)

scale_fill_catppuccin_c(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  ...
)
```

## Arguments

- flavor:

  The flavor of Catppuccin to use ("mocha", "latte", "frappe",
  "macchiato"). Defaults to the value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- ...:

  Additional arguments passed to
  [`ggplot2::scale_color_gradient()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)
  or
  [`ggplot2::scale_fill_gradient()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Value

A `ggplot2` continuous scale object.

## Examples

``` r
library(ggplot2)

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_catppuccin_c("mocha") +
  theme_catppuccin("mocha")
```
