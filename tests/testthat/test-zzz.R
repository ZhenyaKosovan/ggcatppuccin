test_that("set_catppuccin_flavor sets session option", {
  original <- getOption("ggcatppuccin.flavor")
  on.exit(options(ggcatppuccin.flavor = original), add = TRUE)

  set_catppuccin_flavor("frappe")
  expect_identical(getOption("ggcatppuccin.flavor"), "frappe")
})
