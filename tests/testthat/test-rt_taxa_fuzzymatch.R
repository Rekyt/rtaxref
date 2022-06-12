context("test-rt_taxa_fuzzymatch")

vcr::use_cassette("rt_taxa_fuzzymatch", {
  test_that("Can retrieve a taxon fuzzy matching its name", {
    expect_silent(res  <- rt_taxa_fuzzymatch("Centaurea"))
    expect_silent(res2 <- rt_taxa_fuzzymatch("Centaurea L."))

    expect_is(res, "data.frame")
    expect_equal(res$id, 190443)
    expect_equal(res$scientificName, "Centaurea")
    expect_equal(res, res2)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_fuzzymatch("azerty"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(
      rt_taxa_fuzzymatch(),
      "'sciname' argument is needed to fuzzymatch taxon search", fixed = TRUE
    )

    expect_error(
      rt_taxa_fuzzymatch(1), "'sciname' must be a character", fixed = TRUE
    )
  })
})
