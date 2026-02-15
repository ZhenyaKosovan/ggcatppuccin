# Minimal Catppuccin Theme for ggplot2

An even more minimal theme than
[`theme_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/theme_catppuccin.md),
with no grid lines by default. Useful for presentations or when you want
maximum focus on the data.

## Usage

``` r
theme_catppuccin_minimal(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  base_size = 12,
  base_family = "sans",
  grid = c("none", "major", "minor", "both")
)
```

## Arguments

- flavor:

  The Catppuccin flavor to use ("mocha", "latte", "frappe", "macchiato",
  "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb"). Defaults to the
  value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- base_size:

  Base font size passed to
  [`ggplot2::theme_minimal()`](https://ggplot2.tidyverse.org/reference/ggtheme.html).

- base_family:

  Base font family passed to
  [`ggplot2::theme_minimal()`](https://ggplot2.tidyverse.org/reference/ggtheme.html).

- grid:

  Which grid lines to show: "none" (default), "major", "minor", or
  "both".

## Value

A `ggplot2` theme object.

## Examples

``` r
library(ggplot2)

ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_catppuccin() +
  theme_catppuccin_minimal("mocha")
```
