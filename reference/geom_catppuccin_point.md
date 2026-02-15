# Catppuccin Geom Helpers

Convenience wrappers around standard ggplot2 geoms that default to
Catppuccin colors so you can get a styled plot without manually setting
aesthetics each time.

## Usage

``` r
geom_catppuccin_point(
  mapping = NULL,
  data = NULL,
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  color = NULL,
  ...,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_catppuccin_col(
  mapping = NULL,
  data = NULL,
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  fill = NULL,
  color = NA,
  ...,
  position = "stack",
  width = NULL,
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_catppuccin_line(
  mapping = NULL,
  data = NULL,
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  color = NULL,
  linewidth = NULL,
  linetype = 1,
  ...,
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_catppuccin_bar(
  mapping = NULL,
  data = NULL,
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  fill = NULL,
  color = NA,
  ...,
  position = "stack",
  width = NULL,
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_catppuccin_boxplot(
  mapping = NULL,
  data = NULL,
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  fill = NULL,
  color = NULL,
  ...,
  outlier.colour = NULL,
  outlier.fill = NULL,
  outlier.shape = 19,
  outlier.size = 1.5,
  outlier.stroke = 0.5,
  outlier.alpha = NULL,
  notch = FALSE,
  notchwidth = 0.5,
  staplewidth = 0,
  varwidth = FALSE,
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_catppuccin_violin(
  mapping = NULL,
  data = NULL,
  flavor = getOption("ggcatppuccin.flavor", "mocha"),
  fill = NULL,
  color = NULL,
  ...,
  trim = TRUE,
  scale = "area",
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE
)
```

## Arguments

- mapping, data, position, na.rm, show.legend, inherit.aes, ...:

  Standard ggplot2 geom parameters. See the corresponding ggplot2 geom
  documentation for details.

- flavor:

  Which Catppuccin flavor to use ("mocha", "latte", "frappe",
  "macchiato", "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb").
  Defaults to the value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

- color, colour:

  Default point/line/border color; falls back to a Catppuccin accent if
  `NULL`.

- fill:

  Default fill color; falls back to a Catppuccin accent if `NULL`.

- width:

  Bar/column width.

- orientation:

  Orientation of the geom ("x" or "y").

- linewidth, linetype:

  Line width and type for line geoms.

- outlier.colour, outlier.fill, outlier.shape, outlier.size,
  outlier.stroke, outlier.alpha:

  Aesthetics for outliers in boxplots.

- notch, notchwidth, staplewidth, varwidth:

  Boxplot parameters.

- trim, scale:

  Violin plot parameters.

## Value

A ggplot2 layer object.

## Examples

``` r
library(ggplot2)

ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_catppuccin_point() +
  scale_color_catppuccin()


ggplot(mtcars, aes(factor(cyl), mpg)) +
  geom_catppuccin_col()
#> Warning: Ignoring empty aesthetic: `width`.
```
