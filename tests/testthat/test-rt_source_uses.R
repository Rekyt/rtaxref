context("test-rt_sources_use")

vcr::use_cassette("rt_sources_use", {
  test_that("Can retrieve sources use list", {
    expect_silent(res <- rt_source_uses())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(44, 3))
    expect_named(res, c("id", "name", "self.href"))
  })

  test_that("Can retrieve sources use", {
    expect_silent(res <- rt_source_uses(usage_id = 276))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 2))
    expect_named(res, c("id", "name"))
    expect_equal(res$id, 276)
    expect_equal(res$name, factor("Abaissement de rang"))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_source_uses(9),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_source_uses("ASDF"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
}, record = "new_episodes")
