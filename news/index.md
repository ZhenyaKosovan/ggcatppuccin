# Changelog

## ggcatppuccin 1.0.0

### Major Features

- Added continuous color scales with
  [`scale_color_catppuccin_c()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin_c.md)
  and
  [`scale_fill_catppuccin_c()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin_c.md)
- Added diverging scales with
  [`scale_color_catppuccin_diverging()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin_diverging.md)
  and
  [`scale_fill_catppuccin_diverging()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin_diverging.md)
- Added sequential scales with
  [`scale_color_catppuccin_sequential()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin_sequential.md)
  and
  [`scale_fill_catppuccin_sequential()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin_sequential.md)
- Added explicit discrete scale aliases
  [`scale_color_catppuccin_d()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin.md)
  and
  [`scale_fill_catppuccin_d()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/scale_color_catppuccin.md)
- Added additional geom wrappers:
  [`geom_catppuccin_line()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/geom_catppuccin_point.md),
  [`geom_catppuccin_bar()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/geom_catppuccin_point.md),
  [`geom_catppuccin_boxplot()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/geom_catppuccin_point.md),
  [`geom_catppuccin_violin()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/geom_catppuccin_point.md)
- Added theme variants:
  [`theme_catppuccin_minimal()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/theme_catppuccin_minimal.md)
  and
  [`theme_catppuccin_void()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/theme_catppuccin_void.md)
- Added palette utility functions:
  [`show_catppuccin_palette()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/show_catppuccin_palette.md),
  [`catppuccin_palette()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/catppuccin_palette.md),
  and
  [`compare_flavors()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/compare_flavors.md)

### Bug Fixes

- Fixed
  [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md)
  to actually work - all functions now respect the global flavor option
- Functions now check `getOption("ggcatppuccin.flavor")` and fall back
  to “mocha” if not set
- Explicit `flavor` parameter still overrides the global option

### Documentation

- Added vignettes for getting started, customization, R Markdown
  integration, and gallery
- Improved function documentation with more examples and
  cross-references
- Enhanced README with comparison images and troubleshooting section
- Added `CLAUDE.md` for AI-assisted development

### Internal

- Expanded test coverage for all new features
- Added tests for global flavor option behavior
- Improved code quality based on lintr recommendations
