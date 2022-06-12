context("test-rt_taxa_vernacular")

vcr::use_cassette("rt_taxa_vernacular", {
  test_that("Can retrieve vernacular related to a taxon using its id", {
    expect_silent(res <- rt_taxa_vernacular(107003))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(3, 17))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href", "name",
                        "langageId", "langageName", "locationId",
                        "locationName", "sourceId", "source", "self.href",
                        "langage.href", "location.href"))
    expect_equal(res$id[1], 107003)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_vernacular(1234567),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(
      rt_taxa_vernacular("A"), "'id' must be a numeric", fixed = TRUE
    )

    expect_error(
      rt_taxa_vernacular(), fixed = TRUE,
      paste0("'id' argument is needed to retrieve vernacular names of a ",
             "taxon using its id")
    )
  })
})
