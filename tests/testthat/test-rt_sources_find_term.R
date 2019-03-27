context("test-rt_sources_find_term")

vcr::use_cassette("rt_sources_find_term", {
  test_that("Can retrieve source using a term", {
    expect_silent(res <- rt_sources_find_term(term = "springtail"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(2, 9))
    expect_named(res, c("id", "fullCitation", "url", "doi", "doiUri",
                        "zooBankId", "zooBankUri", "abstract", "self.href"))
    expect_equal(res$id, c(27221, 235939))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_sources_find_term("azerty"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
}, record = "new_episodes")

