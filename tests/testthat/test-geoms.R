test_that("geom_catppuccin_point defaults to flavor color", {
  layer <- geom_catppuccin_point()

  expect_s3_class(layer, "LayerInstance")
  expect_equal(layer$aes_params$colour, catppuccin_flavors$mocha$blue)
})

test_that("geom_catppuccin_col defaults to flavor fill", {
  layer <- geom_catppuccin_col()

  expect_s3_class(layer, "LayerInstance")
  expect_equal(layer$aes_params$fill, catppuccin_flavors$mocha$mauve)
})
