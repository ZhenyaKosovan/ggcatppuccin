# Set Global Catppuccin Flavor

Sets the preferred Catppuccin flavor for the R session, so subsequent
calls to scales or themes can omit the `flavor` argument if they read
this option.

## Usage

``` r
set_catppuccin_flavor(flavor)
```

## Arguments

- flavor:

  Flavor name to store (e.g. `"mocha"` or `"mocha_cb"`). No validation
  is applied.

## Value

Invisibly returns the previous value of the option.
