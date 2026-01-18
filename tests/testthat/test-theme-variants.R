test_that("theme_catppuccin_minimal creates a theme", {
  theme <- theme_catppuccin_minimal()
  expect_s3_class(theme, "theme")
  expect_s3_class(theme, "gg")
})

test_that("theme_catppuccin_void creates a theme", {
  theme <- theme_catppuccin_void()
  expect_s3_class(theme, "theme")
  expect_s3_class(theme, "gg")
})

test_that("theme_catppuccin_minimal works with all flavors", {
  flavors <- c("latte", "frappe", "macchiato", "mocha")

  for (flavor in flavors) {
    theme <- theme_catppuccin_minimal(flavor = flavor)
    expect_equal(
      theme$plot.background$fill,
      catppuccin_flavors[[flavor]]$base
    )
  }
})

test_that("theme_catppuccin_minimal grid parameter works", {
  theme_none <- theme_catppuccin_minimal(grid = "none")
  expect_s3_class(theme_none$panel.grid.major, "element_blank")

  theme_major <- theme_catppuccin_minimal(grid = "major")
  expect_s3_class(theme_major$panel.grid.major, "element_line")

  theme_both <- theme_catppuccin_minimal(grid = "both")
  expect_s3_class(theme_both$panel.grid.major, "element_line")
  expect_s3_class(theme_both$panel.grid.minor, "element_line")
})

test_that("theme_catppuccin_void uses correct colors", {
  theme <- theme_catppuccin_void(flavor = "mocha")

  expect_equal(
    theme$plot.background$fill,
    catppuccin_flavors$mocha$base
  )

  expect_equal(
    theme$text$colour,
    catppuccin_flavors$mocha$text
  )
})

test_that("all themes accept base_size and base_family", {
  theme1 <- theme_catppuccin(base_size = 14, base_family = "serif")
  theme2 <- theme_catppuccin_minimal(base_size = 14, base_family = "serif")
  theme3 <- theme_catppuccin_void(base_size = 14, base_family = "serif")

  expect_s3_class(theme1, "theme")
  expect_s3_class(theme2, "theme")
  expect_s3_class(theme3, "theme")
})
