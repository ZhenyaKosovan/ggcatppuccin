test_that("catppuccin_palette returns default palette", {
  palette <- catppuccin_palette("mocha")

  expect_length(palette, 7)
  expect_true(catppuccin_flavors$mocha$blue %in% palette)
  expect_true(catppuccin_flavors$mocha$mauve %in% palette)
})

test_that("catppuccin_palette works with all flavors", {
  flavors <- c("latte", "frappe", "macchiato", "mocha")

  for (flavor in flavors) {
    palette <- catppuccin_palette(flavor)
    expect_length(palette, 7)
    expect_type(palette, "character")
  }
})

test_that("catppuccin_palette extracts specific colors", {
  colors <- catppuccin_palette("mocha", c("blue", "red"))

  expect_length(colors, 2)
  expect_equal(colors[1], catppuccin_flavors$mocha$blue)
  expect_equal(colors[2], catppuccin_flavors$mocha$red)
})

test_that("catppuccin_palette extracts neutral colors", {
  colors <- catppuccin_palette("latte", c("base", "text", "surface0"))

  expect_length(colors, 3)
  expect_equal(colors[1], catppuccin_flavors$latte$base)
  expect_equal(colors[2], catppuccin_flavors$latte$text)
  expect_equal(colors[3], catppuccin_flavors$latte$surface0)
})

test_that("catppuccin_palette errors on invalid color names", {
  expect_error(
    catppuccin_palette("mocha", c("blue", "invalid_color")),
    "Invalid color names"
  )
})

test_that("show_catppuccin_palette creates a plot", {
  p <- show_catppuccin_palette("mocha")
  expect_s3_class(p, "gg")
  expect_s3_class(p, "ggplot")
})

test_that("show_catppuccin_palette works with all types", {
  types <- c("all", "accents", "neutrals")

  for (type in types) {
    p <- show_catppuccin_palette("mocha", type = type)
    expect_s3_class(p, "ggplot")
  }
})

test_that("compare_flavors creates a plot", {
  p <- compare_flavors()
  expect_s3_class(p, "gg")
  expect_s3_class(p, "ggplot")
})

test_that("compare_flavors works with different types", {
  p_accents <- compare_flavors(type = "accents")
  p_all <- compare_flavors(type = "all")

  expect_s3_class(p_accents, "ggplot")
  expect_s3_class(p_all, "ggplot")
})
