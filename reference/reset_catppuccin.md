# Reset Geom and Scale Defaults to ggplot2 Originals

Restores all geom defaults and discrete scale options that were changed
by
[`use_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/use_catppuccin.md).

## Usage

``` r
reset_catppuccin()
```

## Value

Invisibly returns `NULL`. Called for its side effects.

## See also

[`use_catppuccin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/use_catppuccin.md)

## Examples

``` r
use_catppuccin("latte")
# ... make plots ...
reset_catppuccin()
```
