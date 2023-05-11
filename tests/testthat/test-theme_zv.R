test_that("examples work", {
  expect_equal(theme_zv(), "This is a placeholder function")
  expect_equal(theme_zv("Hello, World!"), "Hello, World!")
})
