context("test-rt_taxref_versions")

vcr::use_cassette("rt_taxref_versions", {
  test_that("Can retrieve TAXREF versions list", {
    expect_silent(res <- rt_taxref_versions())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(11, 6))
    expect_named(res, c("id", "name", "date", "responsable", "current",
                        "self.href"))
  })

  test_that("Can retrieve specific TAXREF version", {
    expect_silent(res <- rt_taxref_versions(version_id = 2))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 5))
    expect_named(res, c("id", "name", "date", "responsable", "current"))
    expect_equal(res$id, 2L)
    expect_equal(res$name, "2.0")
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxref_versions(123),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_taxref_versions("ASDF"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
})

