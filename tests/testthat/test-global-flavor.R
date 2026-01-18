test_that("set_catppuccin_flavor sets global option", {
  old_flavor <- getOption("ggcatppuccin.flavor")

  set_catppuccin_flavor("latte")
  expect_equal(getOption("ggcatppuccin.flavor"), "latte")

  set_catppuccin_flavor("mocha")
  expect_equal(getOption("ggcatppuccin.flavor"), "mocha")

  # Restore
  if (is.null(old_flavor)) {
    options(ggcatppuccin.flavor = NULL)
  } else {
    options(ggcatppuccin.flavor = old_flavor)
  }
})

test_that("theme_catppuccin respects global flavor option", {
  old_flavor <- getOption("ggcatppuccin.flavor")

  set_catppuccin_flavor("frappe")
  theme <- theme_catppuccin()

  # Theme should use frappe colors
  expect_equal(
    theme$plot.background$fill,
    catppuccin_flavors$frappe$base
  )

  # Restore
  if (is.null(old_flavor)) {
    options(ggcatppuccin.flavor = NULL)
  } else {
    options(ggcatppuccin.flavor = old_flavor)
  }
})

test_that("scale functions respect global flavor option", {
  old_flavor <- getOption("ggcatppuccin.flavor")

  set_catppuccin_flavor("macchiato")
  scale <- scale_color_catppuccin()

  # Check that macchiato colors are used
  expect_true(catppuccin_flavors$macchiato$blue %in% scale$palette(7))

  # Restore
  if (is.null(old_flavor)) {
    options(ggcatppuccin.flavor = NULL)
  } else {
    options(ggcatppuccin.flavor = old_flavor)
  }
})

test_that("explicit flavor parameter overrides global option", {
  old_flavor <- getOption("ggcatppuccin.flavor")

  set_catppuccin_flavor("mocha")
  theme <- theme_catppuccin(flavor = "latte")

  # Theme should use latte despite global mocha setting
  expect_equal(
    theme$plot.background$fill,
    catppuccin_flavors$latte$base
  )

  # Restore
  if (is.null(old_flavor)) {
    options(ggcatppuccin.flavor = NULL)
  } else {
    options(ggcatppuccin.flavor = old_flavor)
  }
})
