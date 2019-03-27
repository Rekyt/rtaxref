context("test-rt_sources_id")

vcr::use_cassette("rt_sources_id", {
  test_that("Can retrieve source using an id", {
    expect_silent(res <- rt_sources_id(source_id = 160688))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 8))
    expect_named(res, c("id", "fullCitation", "url", "doi", "doiUri",
                        "zooBankId", "zooBankUri", "abstract"))
    expect_equal(res$id, c(160688))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_sources_id(123456),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_sources_id("azerty"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
}, record = "new_episodes")

