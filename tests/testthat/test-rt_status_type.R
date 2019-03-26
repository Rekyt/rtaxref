context("test-rt_status_type")

vcr::use_cassette("rt_status_type", {
  test_that("Can retrieve status list", {
    expect_silent(res <- rt_status_type())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(28, 4))
    expect_named(res, c("id", "name", "group", "self.href"))
  })

  test_that("Can retrieve specific status types", {
    expect_silent(res <- rt_status_type_id(status_id = "BARC"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 3))
    expect_named(res, c("id", "name", "group"))
    expect_equal(res$id, factor("BARC"))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_status_type_id(9),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_status_type_id("A"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
}, record = "new_episodes")
