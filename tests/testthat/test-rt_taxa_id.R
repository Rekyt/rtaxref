context("test-rt_taxa_id")

vcr::use_cassette("rt_taxa_id", {
  test_that("Can retrieve a taxon using its id", {
    expect_silent(res <- rt_taxa_id(443498))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 45))
    expect_named(res, c("id", "referenceId", "parentId", "scientificName",
                        "authority", "fullName", "fullNameHtml", "rankId",
                        "rankName", "referenceName", "referenceNameHtml",
                        "frenchVernacularName", "englishVernacularName",
                        "genusName", "familyName", "orderName", "className",
                        "phylumName", "kingdomName", "vernacularGenusName",
                        "vernacularFamilyName", "vernacularOrderName",
                        "vernacularClassName", "vernacularPhylumName",
                        "vernacularKingdomName", "vernacularGroup1",
                        "vernacularGroup2", "habitat", "fr", "gf", "mar", "gua",
                        "sm", "sb", "spm", "may", "epa", "reu", "sa", "ta",
                        "nc", "wf", "pf", "cli", "taxrefVersion"))

    expect_equal(res$id, 443498)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_id(1234567),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(
      rt_taxa_id("blabla"), "'id' must be a numeric", fixed = TRUE
    )

    expect_error(
      rt_taxa_id(),
      "'id' argument is needed to retrieve a specific taxon id", fixed = TRUE
    )
  })
})
