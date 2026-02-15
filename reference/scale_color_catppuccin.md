# Catppuccin Color Scales

ggplot2 discrete color and fill scales that use the Catppuccin palette.
The palette order is kept consistent across flavors.

## Usage

``` r
scale_color_catppuccin(flavor = getOption("ggcatppuccin.flavor", "mocha"), ...)

scale_fill_catppuccin(flavor = getOption("ggcatppuccin.flavor", "mocha"), ...)

scale_color_catppuccin_d(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  ...
)

scale_fill_catppuccin_d(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
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

- ...:

  Additional arguments passed to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Value

A `ggplot2` discrete scale object.

## Examples

``` r
library(ggplot2)

ggplot(mtcars, aes(factor(cyl), fill = factor(gear))) +
  geom_bar() +
  scale_fill_catppuccin("macchiato") +
  theme_minimal()
```
