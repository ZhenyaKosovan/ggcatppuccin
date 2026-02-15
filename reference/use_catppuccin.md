# Activate Catppuccin Defaults for Common Geoms and Discrete Scales

Sets Catppuccin colors as the default for common geoms (point, line,
bar, col, boxplot, violin) and as the default discrete color/fill
scales. After calling this, plain
[`geom_line()`](https://ggplot2.tidyverse.org/reference/geom_path.html)
and mapped discrete `color`/`fill` aesthetics will automatically use
Catppuccin colors, for those supported defaults.

## Usage

``` r
use_catppuccin(flavor = getOption("ggcatppuccin.flavor", "mocha"))
```

## Arguments

- flavor:

  Which Catppuccin flavor to use ("mocha", "latte", "frappe",
  "macchiato", "mocha_cb", "latte_cb", "frappe_cb", "macchiato_cb").
  Defaults to the value set by
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md),
  or "mocha" if not set.

## Value

Invisibly returns `NULL`. Called for its side effects.

## See also

[`reset_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/reset_catppuccin.md)
to restore ggplot2 defaults.

## Examples

``` r
library(ggplot2)

use_catppuccin("mocha")

# Now plain geoms use Catppuccin colors:
ggplot(mtcars, aes(mpg, wt)) + geom_point()


# And mapped aesthetics auto-use the Catppuccin palette:
ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) + geom_point()


# Restore original defaults when done:
reset_catppuccin()
```
