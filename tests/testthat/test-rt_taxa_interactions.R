context("test-rt_taxa_interactions")

vcr::use_cassette("rt_taxa_interactions", {
  test_that("Can retrieve a taxon's interactions using its id", {
    expect_silent(suppressMessages({
      res <- rt_taxa_interactions(110335)
    }))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 25))
    expect_named(res, c("taxon.id", "taxon.scientificName",
                        "taxon.fullNameHtml", "taxon.referenceId",
                        "taxon.parentId", "taxon.referenceNameHtml",
                        "relationId", "relationName", "specificity",
                        "inherited", "target.id", "target.scientificName",
                        "target.fullNameHtml", "target.referenceId",
                        "target.parentId", "target.referenceNameHtml",
                        "source.id", "source.fullCitation", "source.url",
                        "source.doi", "source.doiUri", "source.zooBankId",
                        "source.zooBankUri", "source.abstract",
                        "._links.self.href"))
    expect_equal(res$taxon.id, 241554)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_interactions("blabla"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)

    expect_error(rt_taxa_interactions(1234567),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
})
