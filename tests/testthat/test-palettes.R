test_that("catppuccin_flavors provides all flavors and colors", {
  expected_flavors <- c("latte", "frappe", "macchiato", "mocha",
                        "latte_cb", "frappe_cb", "macchiato_cb", "mocha_cb")
  expect_setequal(names(catppuccin_flavors), expected_flavors)

  expected_colors <- c(
    "base", "mantle", "text", "subtext1", "subtext0", "overlay2",
    "surface0", "red", "peach", "yellow", "green", "blue", "lavender", "mauve"
  )

  for (flavor in expected_flavors) {
    expect_setequal(names(catppuccin_flavors[[flavor]]), expected_colors)
    expect_true(all(vapply(catppuccin_flavors[[flavor]], function(x) grepl("^#", x), logical(1))))
  }
})
