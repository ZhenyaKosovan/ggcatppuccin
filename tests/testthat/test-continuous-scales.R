test_that("scale_color_catppuccin_c creates continuous scale", {
  scale <- scale_color_catppuccin_c("mocha")
  expect_s3_class(scale, "ScaleContinuous")
  expect_s3_class(scale, "Scale")
})

test_that("scale_fill_catppuccin_c creates continuous scale", {
  scale <- scale_fill_catppuccin_c("frappe")
  expect_s3_class(scale, "ScaleContinuous")
  expect_s3_class(scale, "Scale")
})

test_that("continuous scales work with all flavors", {
  flavors <- c("latte", "frappe", "macchiato", "mocha")

  for (flavor in flavors) {
    scale_c <- scale_color_catppuccin_c(flavor)
    scale_f <- scale_fill_catppuccin_c(flavor)

    expect_s3_class(scale_c, "ScaleContinuous")
    expect_s3_class(scale_f, "ScaleContinuous")
  }
})

test_that("scale_color_catppuccin_sequential works", {
  scale <- scale_color_catppuccin_sequential("mocha", accent = "blue")
  expect_s3_class(scale, "ScaleContinuous")
})

test_that("scale_fill_catppuccin_sequential works", {
  scale <- scale_fill_catppuccin_sequential("latte", accent = "mauve")
  expect_s3_class(scale, "ScaleContinuous")
})

test_that("sequential scales work with different accents", {
  accents <- c("blue", "mauve", "red", "green", "peach", "yellow", "lavender")

  for (accent in accents) {
    scale <- scale_color_catppuccin_sequential("mocha", accent = accent)
    expect_s3_class(scale, "ScaleContinuous")
  }
})

test_that("scale_color_catppuccin_diverging works", {
  scale <- scale_color_catppuccin_diverging("frappe")
  expect_s3_class(scale, "ScaleContinuous")
})

test_that("scale_fill_catppuccin_diverging works", {
  scale <- scale_fill_catppuccin_diverging("macchiato", low_color = "green", high_color = "red")
  expect_s3_class(scale, "ScaleContinuous")
})

test_that("diverging scales accept custom midpoint", {
  scale <- scale_color_catppuccin_diverging("mocha", midpoint = 50)
  expect_s3_class(scale, "ScaleContinuous")
})

test_that("discrete scale aliases work", {
  scale_d_color <- scale_color_catppuccin_d()
  scale_d_fill <- scale_fill_catppuccin_d()

  expect_s3_class(scale_d_color, "ScaleDiscrete")
  expect_s3_class(scale_d_fill, "ScaleDiscrete")
})
