test_that("catppuccin_css embeds flavor colors", {
  css <- catppuccin_css("latte")

  expect_type(css, "character")
  expect_true(grepl(catppuccin_flavors$latte$base, css, fixed = TRUE))
  expect_true(grepl(catppuccin_flavors$latte$mauve, css, fixed = TRUE))
  expect_true(grepl("--catppuccin-base", css, fixed = TRUE))
})

test_that("write_catppuccin_css writes file and returns path", {
  tmp <- tempfile(fileext = ".css")
  out_path <- write_catppuccin_css(tmp, flavor = "frappe")

  expect_true(file.exists(tmp))
  expect_equal(out_path, normalizePath(tmp, mustWork = FALSE))
  css <- paste(readLines(tmp), collapse = "\n")
  expect_true(grepl(catppuccin_flavors$frappe$surface0, css, fixed = TRUE))
})
