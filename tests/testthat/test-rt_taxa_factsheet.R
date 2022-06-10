context("test-rt_taxa_factsheet")

vcr::use_cassette("rt_taxa_factsheet", {
  test_that("Can retrieve specific taxa factsheet", {
    expect_silent(res <- rt_taxa_factsheet(4540))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 7))
    expect_named(
      res, c("text", "X4540L", "langageId", "langageName", "author",
             "institution", "year")
    )
  })

  test_that("Errors when given wrong number", {
    expect_error(
      rt_taxa_factsheet(0),
      "The query returned no results. Please try another query", fixed = TRUE
    )
  })
})
