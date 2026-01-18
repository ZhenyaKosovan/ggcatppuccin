test_that("geom_catppuccin_line creates a layer", {
  geom <- geom_catppuccin_line()
  expect_s3_class(geom, "Layer")
})

test_that("geom_catppuccin_bar creates a layer", {
  geom <- geom_catppuccin_bar()
  expect_s3_class(geom, "Layer")
})

test_that("geom_catppuccin_boxplot creates a layer", {
  geom <- geom_catppuccin_boxplot()
  expect_s3_class(geom, "Layer")
})

test_that("geom_catppuccin_violin creates a layer", {
  geom <- geom_catppuccin_violin()
  expect_s3_class(geom, "Layer")
})

test_that("geom_catppuccin_line uses default color from flavor", {
  geom <- geom_catppuccin_line(flavor = "mocha")
  expect_equal(geom$aes_params$colour, catppuccin_flavors$mocha$blue)
})

test_that("geom_catppuccin_bar uses default fill from flavor", {
  geom <- geom_catppuccin_bar(flavor = "latte")
  expect_equal(geom$aes_params$fill, catppuccin_flavors$latte$mauve)
})

test_that("geom_catppuccin_boxplot uses default colors from flavor", {
  geom <- geom_catppuccin_boxplot(flavor = "frappe")
  expect_equal(geom$aes_params$fill, catppuccin_flavors$frappe$blue)
  expect_equal(geom$aes_params$colour, catppuccin_flavors$frappe$text)
})

test_that("geom_catppuccin_violin uses default colors from flavor", {
  geom <- geom_catppuccin_violin(flavor = "macchiato")
  expect_equal(geom$aes_params$fill, catppuccin_flavors$macchiato$mauve)
  expect_equal(geom$aes_params$colour, catppuccin_flavors$macchiato$text)
})

test_that("geoms accept custom colors", {
  custom_color <- "#FF0000"

  geom_line <- geom_catppuccin_line(color = custom_color)
  expect_equal(geom_line$aes_params$colour, custom_color)

  custom_fill <- "#00FF00"
  geom_bar <- geom_catppuccin_bar(fill = custom_fill)
  expect_equal(geom_bar$aes_params$fill, custom_fill)
})
