context("Test utility functions")

test_that("Returned base URL is correct", {
  expect_equal(rt_base_url(), "https://taxref.mnhn.fr/")
})
