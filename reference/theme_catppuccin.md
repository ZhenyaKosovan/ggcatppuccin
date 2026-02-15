# Catppuccin Theme for ggplot2

A minimal ggplot2 theme that applies Catppuccin colors to text,
backgrounds, and grid lines. The default flavor is "mocha", and all
built-in flavors are available, including the colorblind-friendly `_cb`
variants.

## Usage

``` r
theme_catppuccin(
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  base_size = 12,
  base_family = "sans"
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

## Value

A `ggplot2` theme object.

## Examples

``` r
library(ggplot2)

ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_catppuccin() +
  theme_catppuccin("latte")
```
