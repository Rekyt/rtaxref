context("test-rt_taxa_sources")

vcr::use_cassette("rt_taxa_sources", {
  test_that("Can retrieve sources related to a taxon using its id", {
    expect_silent(res <- rt_taxa_sources(107003))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(6, 15))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href", "sourceId",
                        "source", "page", "pageUrl", "sourceUse", "self.href",
                        "bibliographicResource.href", "sourceUse.href"))
    expect_equal(res$id[1], 770669)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_sources(123456),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_taxa_sources("A"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
})
