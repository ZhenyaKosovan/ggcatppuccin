# ggcatppuccin 1.0.0

## Major Features

* Added continuous color scales with `scale_color_catppuccin_c()` and `scale_fill_catppuccin_c()`
* Added diverging scales with `scale_color_catppuccin_diverging()` and `scale_fill_catppuccin_diverging()`
* Added sequential scales with `scale_color_catppuccin_sequential()` and `scale_fill_catppuccin_sequential()`
* Added explicit discrete scale aliases `scale_color_catppuccin_d()` and `scale_fill_catppuccin_d()`
* Added additional geom wrappers: `geom_catppuccin_line()`, `geom_catppuccin_bar()`, `geom_catppuccin_boxplot()`, `geom_catppuccin_violin()`
* Added theme variants: `theme_catppuccin_minimal()` and `theme_catppuccin_void()`
* Added palette utility functions: `show_catppuccin_palette()`, `catppuccin_palette()`, and `compare_flavors()`

## Bug Fixes

* Fixed `set_catppuccin_flavor()` to actually work - all functions now respect the global flavor option
* Functions now check `getOption("ggcatppuccin.flavor")` and fall back to "mocha" if not set
* Explicit `flavor` parameter still overrides the global option

## Documentation

* Added vignettes for getting started, customization, R Markdown integration, and gallery
* Improved function documentation with more examples and cross-references
* Enhanced README with comparison images and troubleshooting section
* Added `CLAUDE.md` for AI-assisted development

## Internal

* Expanded test coverage for all new features
* Added tests for global flavor option behavior
* Improved code quality based on lintr recommendations
