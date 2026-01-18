# Compare Catppuccin Flavors

Create a visual comparison of all four Catppuccin flavors side by side.
Useful for choosing which flavor to use for your plots.

## Usage

``` r
compare_flavors(type = c("accents", "all"))
```

## Arguments

- type:

  Type of colors to compare: "accents" (default) or "all".

## Value

A ggplot2 object showing all four flavors.

## Examples

``` r
# Compare accent colors across flavors
compare_flavors()


# Compare all colors
compare_flavors(type = "all")
```
