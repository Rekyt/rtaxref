context("test-rt_interactions_opgroup")

vcr::use_cassette("rt_interactions_opgroup", {

  test_that("Can retrieve interactions from operational group", {
    expect_silent(suppressMessages({
      res <- rt_interactions_opgroup(706, size = 1)
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
  })

  test_that("Wrong query returns error", {

    expect_error(rt_interactions_opgroup(666, size = 1),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(
      rt_interactions_opgroup(),
      paste0("'opgroup_id' argument is needed to retrieve interactions",
             " using operational group ID"),
      fixed = TRUE
    )

    expect_error(rt_interactions_opgroup("ASDF"),
                 "'opgroup_id' must be a numeric",
                 fixed = TRUE)

    expect_error(rt_interactions_opgroup(1, page = "a"),
                 "'page' must be a numeric",
                 fixed = TRUE)

    expect_error(rt_interactions_opgroup(1, size = "a"),
                 "'size' must be a numeric",
                 fixed = TRUE)

  })
})
