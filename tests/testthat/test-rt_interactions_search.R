context("test-rt_interactions_search")

vcr::use_cassette("rt_interactions_search", {

  test_that("Can search specific interactions from search", {
    expect_silent(suppressMessages({
      res <- rt_interactions_search(239523, size = 1)
    }))
    expect_silent(suppressMessages({
      res2 <- rt_interactions_search(239523, size = 1,
                                     interaction_id = "PARASITE")
    }))
    expect_silent(suppressMessages({
      res3 <- rt_interactions_search(239523, size = 1,
                                     interaction_id = "PREDATEUR")
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
    expect_equal(res$taxon.id, 239523)

    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(1, 25))
    expect_named(res2, c("taxon.id", "taxon.scientificName",
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
    expect_equal(res2$taxon.id, 833018)
    expect_equal(res2$relationId, "PARASITE")

    expect_is(res3, "data.frame")
    expect_equal(dim(res3), c(1, 25))
    expect_named(res3, c("taxon.id", "taxon.scientificName",
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
    expect_equal(res3$taxon.id, 433589)
    expect_equal(res3$relationId, "PREDATEUR")
  })

  test_that("Can retrieve interactions by operational group", {
    expect_silent(suppressMessages({
      res <- rt_interactions_search(opgroup_id = 706, size = 1)
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
    expect_equal(res$taxon.id, 159424)
    expect_equal(res$relationId, "ASSOCIE")
  })

  test_that("Wrong query returns error", {
    expect_error(rt_interactions_search(id = 1, size = 1),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_interactions_search("ASDF", size = 1),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
})
