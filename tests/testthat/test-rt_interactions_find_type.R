context("test-rt_interactions_find_type")

vcr::use_cassette("rt_interactions_find_type", {
  test_that("Can retrieve interaction by type", {
    expect_silent(res <- rt_interactions_find_type("PREDATEUR", size = 5))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(5, 25))
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
                        "_links.self.href"))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_interactions_find_type("ASDF", size = 5),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_interactions_find_type(0.123456, size = 5),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
})
