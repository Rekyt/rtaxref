context("Test utility functions")

test_that("Returned base URL is correct", {
  expect_equal(rt_base_url(), "https://taxref.mnhn.fr/")
})

vcr::use_cassette("rt_GET", {

  test_that("rt_GET works", {
    # without query
    expect_silent(res <- rt_GET("blabla"))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blabla")
    expect_true(http_error(res))

    # multiple endpoint
    expect_silent(res <- rt_GET("blabla", "azerty", "/uiop"))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blablaazerty/uiop")
    expect_true(http_error(res))

    # with query
    expect_silent(res <- rt_GET("blabla", query = list(id = 1)))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blabla?id=1")
    expect_true(http_error(res))
  })

}, record = "new_episodes")


