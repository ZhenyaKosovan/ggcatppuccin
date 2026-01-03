test_that("color scale uses expected palette ordering", {
  expected <- c(
    catppuccin_flavors$latte$blue, catppuccin_flavors$latte$mauve, catppuccin_flavors$latte$red,
    catppuccin_flavors$latte$green, catppuccin_flavors$latte$peach,
    catppuccin_flavors$latte$yellow, catppuccin_flavors$latte$lavender
  )

  scale <- scale_color_catppuccin("latte")
  expect_s3_class(scale, "ScaleDiscrete")
  expect_identical(scale$palette(length(expected)), expected)
})

test_that("fill scale matches color scale palette and validates flavor", {
  expected <- c(
    catppuccin_flavors$mocha$blue, catppuccin_flavors$mocha$mauve, catppuccin_flavors$mocha$red,
    catppuccin_flavors$mocha$green, catppuccin_flavors$mocha$peach,
    catppuccin_flavors$mocha$yellow, catppuccin_flavors$mocha$lavender
  )

  scale <- scale_fill_catppuccin()
  expect_s3_class(scale, "ScaleDiscrete")
  expect_identical(scale$palette(length(expected)), expected)

  expect_error(scale_fill_catppuccin("unknown"), "'arg' should be one of")
})
