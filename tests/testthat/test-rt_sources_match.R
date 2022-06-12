context("test-rt_sources_match")

vcr::use_cassette("rt_sources_match", {
  test_that("Can retrieve source using a matching citation", {
    expect_silent(res <- rt_sources_match(
      paste0("Chapman, T. A. 1909. Callophrys avis a new butterfly on ",
             "southern France. The Entomologist's record and journal of ",
             "variation, 21: 130-131.")
    ))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 9))
    expect_named(res, c("id", "fullCitation", "url", "doi", "doiUri",
                        "zooBankId", "zooBankUri", "abstract", "self.href"))
    expect_equal(res$id, c(15441))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_sources_match("azerty"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_sources_match(3),
                 "'citation' must be a character",
                 fixed = TRUE)
  })
})

