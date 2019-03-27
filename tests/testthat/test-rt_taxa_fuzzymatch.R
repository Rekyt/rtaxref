context("test-rt_taxa_fuzzymatch")

vcr::use_cassette("rt_taxa_fuzzymatch", {
  test_that("Can retrieve a taxon fuzzy matching its name", {
    #
  })

  test_that("Wrong query returns error", {
    #
  })
}, record = "new_episodes")
