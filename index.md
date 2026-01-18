# ggcatppuccin

Catppuccin color palettes and themes for ggplot2. This package brings
the beautiful [Catppuccin](https://github.com/catppuccin/catppuccin)
color scheme to your R visualizations.

## Features

- 🎨 All four official Catppuccin flavors: **Latte**, **Frappé**,
  **Macchiato**, and **Mocha**
- 🎭 Complete ggplot2 theme with customized backgrounds, text, and grid
  lines
- 🌈 Discrete and continuous color scales for both `color` and `fill`
  aesthetics
- 🔧 Session-wide flavor defaults for consistent styling
- 📝 R Markdown and Quarto integration with CSS generation
- 🎯 Convenience geoms with built-in Catppuccin colors

## Installation

You can install the development version of ggcatppuccin from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("ZhenyaKosovan/ggcatppuccin")
```

## Quick Start

``` r
library(ggplot2)
library(ggcatppuccin)

# Basic plot with Mocha theme (default)
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point(size = 2.5, alpha = 0.8) +
  scale_color_catppuccin() +
  theme_catppuccin() +
  labs(
    title = "Fuel Efficiency by Engine Size",
    x = "Displacement (L)",
    y = "Highway MPG"
  )
```

## Choosing a Flavor

Switch between flavors easily:

``` r
# Use the light Latte theme
ggplot(mpg, aes(class, fill = class)) +
  geom_bar() +
  scale_fill_catppuccin(flavor = "latte") +
  theme_catppuccin(flavor = "latte") +
  guides(fill = "none") +
  labs(title = "Vehicle Classes - Latte Theme")
```

Set a session-wide default to avoid repeating the `flavor` argument:

``` r
set_catppuccin_flavor("macchiato")

# Now all functions use macchiato by default
ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_catppuccin() +
  theme_catppuccin() +
  labs(title = "Fuel Efficiency vs Weight")
```

## Available Scales

### Discrete Scales

``` r
scale_color_catppuccin(flavor = "mocha")
scale_fill_catppuccin(flavor = "mocha")
```

### Continuous Scales

``` r
scale_color_catppuccin_c(flavor = "mocha")
scale_fill_catppuccin_c(flavor = "mocha")
```

### Sequential and Diverging Scales

``` r
scale_color_catppuccin_sequential(flavor = "mocha", colors = c("blue", "mauve"))
scale_color_catppuccin_diverging(flavor = "mocha", mid_color = "base")
```

## Helper Geoms

Convenience geoms with built-in Catppuccin colors:

``` r
# Points default to blue
geom_catppuccin_point()

# Bars default to mauve
geom_catppuccin_bar()

# Lines default to lavender
geom_catppuccin_line()
```

## R Markdown Integration

Generate CSS for your R Markdown or Quarto documents:

``` r
# Generate CSS string
css <- catppuccin_css(flavor = "mocha")

# Or write to file
write_catppuccin_css("custom.css", flavor = "frappe")
```

## Documentation

- [Getting
  Started](https://zhenyakosovan.github.io/ggcatppuccin/articles/getting-started.html) -
  Basic usage and examples
- [Customization
  Guide](https://zhenyakosovan.github.io/ggcatppuccin/articles/customization.html) -
  Advanced customization options
- [Gallery](https://zhenyakosovan.github.io/ggcatppuccin/articles/gallery.html) -
  Example plots and visualizations
- [R Markdown
  Integration](https://zhenyakosovan.github.io/ggcatppuccin/articles/rmarkdown-integration.html) -
  Using Catppuccin in documents

## Credits

This package is inspired by the
[Catppuccin](https://github.com/catppuccin/catppuccin) color scheme
created by the Catppuccin community.

## License

MIT
