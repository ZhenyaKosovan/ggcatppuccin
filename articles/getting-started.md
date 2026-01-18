# Getting Started with ggcatppuccin

## Introduction

ggcatppuccin provides Catppuccin color palettes and themes for ggplot2,
allowing you to create beautiful, cohesive visualizations with minimal
effort. The package supports all four official Catppuccin flavors:
Latte, Frappé, Macchiato, and Mocha.

## Installation

``` r
# Install from GitHub
remotes::install_github("ZhenyaKosovan/ggcatppuccin")
```

## Basic Usage

``` r
library(ggplot2)
library(ggcatppuccin)
```

### Your First Plot

The simplest way to use ggcatppuccin is to add
[`theme_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/theme_catppuccin.md)
and a color scale to your plot:

``` r
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point(size = 2.5, alpha = 0.8) +
  scale_color_catppuccin() +
  theme_catppuccin() +
  labs(
    title = "Fuel Efficiency by Engine Size",
    subtitle = "Using Catppuccin Mocha theme",
    x = "Displacement (L)",
    y = "Highway MPG"
  )
```

![](getting-started_files/figure-html/basic-plot-1.png)

### Choosing a Flavor

You can specify which Catppuccin flavor to use:

``` r
ggplot(mpg, aes(class, fill = class)) +
  geom_bar() +
  scale_fill_catppuccin(flavor = "latte") +
  theme_catppuccin(flavor = "latte") +
  guides(fill = "none") +
  labs(
    title = "Vehicle Classes",
    subtitle = "Using Catppuccin Latte theme",
    x = NULL,
    y = "Count"
  )
```

![](getting-started_files/figure-html/latte-plot-1.png)

### Setting a Session Default

To avoid repeating the `flavor` argument, set a session-wide default:

``` r
set_catppuccin_flavor("macchiato")

# Now all functions use macchiato by default
ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_catppuccin() +  # Uses macchiato
  theme_catppuccin() +         # Uses macchiato
  labs(
    title = "Fuel Efficiency vs Weight",
    color = "Cylinders"
  )
```

![](getting-started_files/figure-html/session-default-1.png)

You can still override the default by specifying `flavor` explicitly:

``` r
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_catppuccin(flavor = "frappe") +  # Override to frappe
  theme_catppuccin(flavor = "frappe") +
  labs(title = "Iris Dataset - Frappé Flavor")
```

![](getting-started_files/figure-html/override-default-1.png)

## Fill vs Color Scales

Use
[`scale_color_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin.md)
for the `color` aesthetic and
[`scale_fill_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin.md)
for the `fill` aesthetic:

``` r
set_catppuccin_flavor("mocha")

ggplot(diamonds[sample(nrow(diamonds), 1000), ], aes(cut, fill = cut)) +
  geom_bar() +
  scale_fill_catppuccin() +
  theme_catppuccin() +
  guides(fill = "none") +
  labs(
    title = "Diamond Cut Distribution",
    x = "Cut Quality",
    y = "Count"
  )
```

![](getting-started_files/figure-html/fill-example-1.png)

## Continuous Scales

For continuous data, use the `_c` variants:

``` r
ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_catppuccin_c() +
  theme_catppuccin() +
  labs(
    title = "Old Faithful Eruption Density",
    x = "Waiting Time (min)",
    y = "Eruption Time (min)"
  )
```

![](getting-started_files/figure-html/continuous-scale-1.png)

## Helper Geoms

The package includes convenience geoms with built-in Catppuccin colors:

``` r
set_catppuccin_flavor("macchiato")

# Points default to blue
ggplot(mtcars, aes(wt, mpg)) +
  geom_catppuccin_point(size = 3) +
  theme_catppuccin() +
  labs(title = "Using geom_catppuccin_point()")
```

![](getting-started_files/figure-html/helper-geoms-1.png)

``` r

# Bars default to mauve
ggplot(mpg, aes(class)) +
  geom_catppuccin_bar() +
  theme_catppuccin() +
  labs(title = "Using geom_catppuccin_bar()")
#> Warning in ggplot2::geom_bar(mapping = mapping, data = data, fill = fill, :
#> Ignoring empty aesthetic: `width`.
```

![](getting-started_files/figure-html/helper-geoms-2.png)

## Next Steps

- Learn about [customization
  options](https://zhenyakosovan.github.io/ggcatppuccin/articles/customization.md)
- See the
  [gallery](https://zhenyakosovan.github.io/ggcatppuccin/articles/gallery.md)
  for more examples
- Learn about [R Markdown
  integration](https://zhenyakosovan.github.io/ggcatppuccin/articles/rmarkdown-integration.md)
