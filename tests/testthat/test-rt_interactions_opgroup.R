context("test-rt_interactions_opgroup")

vcr::use_cassette("rt_interactions_opgroup", {

  test_that("Can retrieve interactions from operational group", {
    expect_silent(res <- rt_interactions_opgroup(706, size = 1))

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
                        "_links.self.href"))
    expect_equal(res$taxon.id, 159424)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_interactions_opgroup(666, size = 1),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_interactions_opgroup("ASDF"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
})
