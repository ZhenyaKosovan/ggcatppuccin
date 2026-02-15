test_that("set_catppuccin_flavor sets session option", {
  original <- getOption("ggcatppuccin.flavor")
  on.exit(options(ggcatppuccin.flavor = original), add = TRUE)

  set_catppuccin_flavor("frappe")
  expect_identical(getOption("ggcatppuccin.flavor"), "frappe")
})

test_that("use_catppuccin and reset_catppuccin update and restore defaults", {
  original <- list(
    point = ggplot2::GeomPoint$default_aes,
    line = ggplot2::GeomLine$default_aes,
    col = ggplot2::GeomCol$default_aes,
    bar = ggplot2::GeomBar$default_aes,
    boxplot = ggplot2::GeomBoxplot$default_aes,
    violin = ggplot2::GeomViolin$default_aes,
    discrete_colour = getOption("ggplot2.discrete.colour"),
    discrete_fill = getOption("ggplot2.discrete.fill"),
    flavor = getOption("ggcatppuccin.flavor")
  )

  on.exit({
    ggplot2::update_geom_defaults("point", original$point)
    ggplot2::update_geom_defaults("line", original$line)
    ggplot2::update_geom_defaults("col", original$col)
    ggplot2::update_geom_defaults("bar", original$bar)
    ggplot2::update_geom_defaults("boxplot", original$boxplot)
    ggplot2::update_geom_defaults("violin", original$violin)
    options(
      ggplot2.discrete.colour = original$discrete_colour,
      ggplot2.discrete.fill = original$discrete_fill,
      ggcatppuccin.flavor = original$flavor
    )
  }, add = TRUE)

  use_catppuccin("latte")

  expect_identical(ggplot2::GeomPoint$default_aes$colour, catppuccin_flavors$latte$blue)
  expect_identical(ggplot2::GeomLine$default_aes$colour, catppuccin_flavors$latte$blue)
  expect_identical(ggplot2::GeomCol$default_aes$fill, catppuccin_flavors$latte$mauve)
  expect_identical(getOption("ggcatppuccin.flavor"), "latte")
  expect_true(is.function(getOption("ggplot2.discrete.colour")))
  expect_true(is.function(getOption("ggplot2.discrete.fill")))

  reset_catppuccin()

  expect_identical(ggplot2::GeomPoint$default_aes, original$point)
  expect_identical(ggplot2::GeomLine$default_aes, original$line)
  expect_identical(ggplot2::GeomCol$default_aes, original$col)
  expect_identical(ggplot2::GeomBar$default_aes, original$bar)
  expect_identical(ggplot2::GeomBoxplot$default_aes, original$boxplot)
  expect_identical(ggplot2::GeomViolin$default_aes, original$violin)
  expect_identical(getOption("ggplot2.discrete.colour"), original$discrete_colour)
  expect_identical(getOption("ggplot2.discrete.fill"), original$discrete_fill)
})

test_that("use_catppuccin supports discrete mappings with more than seven levels", {
  original <- list(
    point = ggplot2::GeomPoint$default_aes,
    line = ggplot2::GeomLine$default_aes,
    col = ggplot2::GeomCol$default_aes,
    bar = ggplot2::GeomBar$default_aes,
    boxplot = ggplot2::GeomBoxplot$default_aes,
    violin = ggplot2::GeomViolin$default_aes,
    discrete_colour = getOption("ggplot2.discrete.colour"),
    discrete_fill = getOption("ggplot2.discrete.fill"),
    flavor = getOption("ggcatppuccin.flavor")
  )

  on.exit({
    ggplot2::update_geom_defaults("point", original$point)
    ggplot2::update_geom_defaults("line", original$line)
    ggplot2::update_geom_defaults("col", original$col)
    ggplot2::update_geom_defaults("bar", original$bar)
    ggplot2::update_geom_defaults("boxplot", original$boxplot)
    ggplot2::update_geom_defaults("violin", original$violin)
    options(
      ggplot2.discrete.colour = original$discrete_colour,
      ggplot2.discrete.fill = original$discrete_fill,
      ggcatppuccin.flavor = original$flavor
    )
  }, add = TRUE)

  use_catppuccin("mocha")

  df <- data.frame(x = seq_len(8), y = seq_len(8), g = factor(seq_len(8)))

  expect_no_error(
    ggplot2::ggplot_build(
      ggplot2::ggplot(df, ggplot2::aes(x, y, colour = g)) +
        ggplot2::geom_point()
    )
  )

  expect_no_error(
    ggplot2::ggplot_build(
      ggplot2::ggplot(df, ggplot2::aes(x, y, fill = g)) +
        ggplot2::geom_col()
    )
  )
})
