context("test-rt_taxa_externalids")

vcr::use_cassette("rt_taxa_externalids", {
  test_that("Can retrieve external ids a of taxon using its id", {
    expect_silent(res <- rt_taxa_externalids(443498))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 8))
    expect_named(res, c("taxrefId", "externalId", "externalDbName",
                        "externalDbTitle", "url", "self.href",
                        "externalDb.href", "taxon.href"))
    expect_equal(res$taxrefId, 443498)
    expect_equal(res$externalId, "9418")
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_externalids(123456789),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
    expect_error(
      rt_taxa_externalids(),
      paste0("'id' argument is needed to retrieve the external IDs of a taxon ",
             "using its id"),
      fixed = TRUE
    )

    expect_error(
      rt_taxa_externalids("A"), "'id' must be a numeric", fixed = TRUE
    )
  })
})
