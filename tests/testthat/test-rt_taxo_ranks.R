context("test-rt_taxo_ranks")

vcr::use_cassette("rt_taxo_ranks", {
  test_that("Can retrieve taxonomic ranks list", {
    expect_silent(res <- rt_taxo_ranks())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(54, 9))
    expect_named(res, c("id", "name", "self.href", "taxrefUri.href",
                        "taxonConceptUri.href", "taxRankUri.href",
                        "tdwgUri.href", "geoSpeciesUri.href", "ncbiUri.href"))
  })

  test_that("Can retrieve specific taxonomic ranks", {
    expect_silent(res <- rt_taxo_ranks(taxo_id = "AB"))
    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 2))
    expect_named(res, c("id", "name"))
    expect_equal(res$id, "AB")
    expect_equivalent(res$name, "Abberatio")
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxo_ranks("ASDF"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_taxo_ranks(9),
                 "'taxo_id' must be character or NULL",
                 fixed = TRUE)
  })
})

