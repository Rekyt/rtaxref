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
    expect_silent(res <- rt_biogeo_status("P"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 3))
    expect_named(res, c("id", "name", "definition"))
    expect_equal(res$id, "P")
  })

  test_that("Wrong query returns error", {
    expect_error(
      rt_biogeo_status("G"),
      "The query returned no results. Please try another query",
      fixed = TRUE
    )

    expect_error(
      rt_biogeo_status("ASDF"),
      "'biogeo_id' must be NULL or a single character",
      fixed = TRUE
    )

    expect_error(
      rt_biogeo_status(1),
      "'biogeo_id' must be NULL or a single character",
      fixed = TRUE
    )
  })
})
