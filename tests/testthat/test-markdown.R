test_that("catppuccin_css embeds flavor colors", {
  css <- catppuccin_css("latte")

  expect_type(css, "character")
  expect_true(grepl(catppuccin_flavors$latte$base, css, fixed = TRUE))
  expect_true(grepl(catppuccin_flavors$latte$mauve, css, fixed = TRUE))
  expect_true(grepl("--catppuccin-base", css, fixed = TRUE))
})
