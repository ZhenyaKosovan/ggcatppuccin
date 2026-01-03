test_that("theme_catppuccin applies mocha colors by default", {
  thm <- theme_catppuccin()
  mocha <- catppuccin_flavors$mocha

  expect_s3_class(thm, "theme")
  expect_identical(thm$plot.background$fill, mocha$base)
  expect_identical(thm$panel.background$fill, mocha$base)
  expect_identical(thm$text$colour, mocha$text)
  expect_identical(thm$axis.text$colour, mocha$subtext1)
  expect_identical(thm$panel.grid.major$colour, mocha$surface0)
})

test_that("theme_catppuccin validates flavor choice", {
  expect_error(theme_catppuccin(flavor = "banana"), "'arg' should be one of")
})
