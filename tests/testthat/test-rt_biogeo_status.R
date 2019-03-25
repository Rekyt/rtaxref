context("test-rt_biogeo_status")

vcr::use_cassette("rt_biogeo_status", {
  test_that("Can retrieve biogeographic status", {
    expect_silent(res <- rt_biogeo_status())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(15, 6))
    expect_named(res, c("id", "name", "definition", "self.href",
                        "taxrefUri.href", "tdwgUri.href"))
  })

  test_that("Can retrieve specific biogeographic status", {
    expect_silent(res <- rt_biogeo_status_id("P"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 3))
    expect_named(res, c("id", "name", "definition"))
    expect_equal(res$id, factor("P"))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_biogeo_status_id("ASDF"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_biogeo_status_id(1),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
})
