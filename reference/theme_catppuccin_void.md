# Void Catppuccin Theme for ggplot2

A completely minimal theme with no axes, grid, or text elements except
the title. Ideal for maps, images, or highly stylized visualizations.

## Usage

``` r
theme_catppuccin_void(
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

  Base font size for the title.

- base_family:

  Base font family for the title.

## Value

A `ggplot2` theme object.

## Examples

``` r
library(ggplot2)

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_catppuccin_c() +
  theme_catppuccin_void() +
  labs(title = "Old Faithful Eruption Density")
```
