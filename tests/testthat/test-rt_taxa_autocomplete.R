context("test-rt_taxa_autocomplete")

vcr::use_cassette("rt_taxa_autocomplete", {
  test_that("Can retrieve a taxa using a term", {
    expect_silent(res <- rt_taxa_autocomplete(term = "Bra", size = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 7))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "self.href"))
  })

  test_that("Wrong query returns error", {
    # expect_error(rt_taxa_autocomplete("ASDF"),
    #              "The query returned no results. Please try another query",
    #              fixed = TRUE)

    expect_error(rt_taxa_autocomplete(1), "'term' must be a character",
                 fixed = TRUE)

    expect_error(rt_taxa_autocomplete("a", territories = 1),
                 "'territories' must be a character or NULL",
                 fixed = TRUE)

    expect_error(rt_taxa_autocomplete("a", rank = 1),
                 "'rank' must be a character or NULL",
                 fixed = TRUE)

    expect_error(rt_taxa_autocomplete("a", domain = 1),
                 "'domain' must be a character or NULL",
                 fixed = TRUE)

    expect_error(rt_taxa_autocomplete("a", page = "a"),
                 "'page' must be a numeric",
                 fixed = TRUE)

    expect_error(rt_taxa_autocomplete("a", size = "a"),
                 "'size' must be a numeric",
                 fixed = TRUE)
  })
})
