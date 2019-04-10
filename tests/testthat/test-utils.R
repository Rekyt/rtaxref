context("Test utility functions")

test_that("Returned base URL is correct", {
  expect_equal(rt_base_url(), "https://taxref.mnhn.fr/")
})

test_that("User Agent is well returned", {
  expect_equal(rt_ua(),
               "http://github.com/Rekyt/rtaxref R package rtaxref/0.1.0")
})

vcr::use_cassette("rt_GET", {

  test_that("rt_GET works", {
    # without query
    expect_silent(res <- rt_GET("blabla"))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blabla")
    expect_equal(res$request$headers[["user-agent"]], rt_ua())
    expect_true(http_error(res))

    # multiple endpoint
    expect_silent(res <- rt_GET("blabla", "azerty", "/uiop"))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blablaazerty/uiop")
    expect_equal(res$request$headers[["user-agent"]], rt_ua())
    expect_true(http_error(res))

    # with query
    expect_silent(res <- rt_GET("blabla", query = list(id = 1)))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blabla?id=1")
    expect_equal(res$request$headers[["user-agent"]], rt_ua())
    expect_true(http_error(res))
  })

}, record = "new_episodes")


