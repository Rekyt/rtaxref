context("test-rt_status_type")

vcr::use_cassette("rt_status_type", {
  test_that("Can retrieve status list", {
    expect_silent(res <- rt_status_type())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(28, 4))
    expect_named(res, c("id", "name", "group", "self.href"))
  })

  test_that("Can retrieve specific status types", {
    expect_silent(res <- rt_status_type(status_id = "BARC"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 3))
    expect_named(res, c("id", "name", "group"))
    expect_equal(res$id, "BARC")
  })

  test_that("Wrong query returns error", {
    expect_error(rt_status_type(9),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_status_type("A"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
})
