# Catppuccin Diverging Color Scales

Diverging color and fill scales that use Catppuccin colors with a
neutral midpoint, suitable for data with a meaningful center point.

## Usage

``` r
scale_color_catppuccin_diverging(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  low_color = "blue",
  high_color = "red",
  midpoint = 0,
  ...
)

scale_fill_catppuccin_diverging(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  low_color = "blue",
  high_color = "red",
  midpoint = 0,
  ...
)
```

## Arguments

- flavor:

  The flavor of Catppuccin to use ("mocha", "latte", "frappe",
  "macchiato"). Defaults to the value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- low_color:

  Color for the low end ("blue", "mauve", "red", "green", "peach",
  "yellow", "lavender"). Defaults to "blue".

- high_color:

  Color for the high end. Defaults to "red".

- midpoint:

  The midpoint value for the diverging scale. Defaults to 0.

- ...:

  Additional arguments passed to
  [`ggplot2::scale_color_gradient2()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Value

A `ggplot2` continuous scale object.

## Examples

``` r
library(ggplot2)

df <- data.frame(
  x = rep(1:10, 10),
  y = rep(1:10, each = 10),
  z = rnorm(100)
)

ggplot(df, aes(x, y, fill = z)) +
  geom_tile() +
  scale_fill_catppuccin_diverging("mocha") +
  theme_catppuccin("mocha")
```
