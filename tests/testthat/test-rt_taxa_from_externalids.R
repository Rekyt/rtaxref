context("test-rt_taxa_from_externalids")

vcr::use_cassette("rt_taxa_from_externalids", {
  test_that("Can retrieve a taxon using an external id", {
    expect_silent(res <- rt_taxa_from_externalids("GBIF", 9418))
    expect_silent(res2 <- rt_taxa_from_externalids("gbif", 9418))

    expect_equivalent(res2, res)

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
    # External DB does not exist
    expect_error(rt_taxa_from_externalids("blabla", 45),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    # External DB does exist but ID does not
    expect_error(rt_taxa_from_externalids("worms", 45),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    # Missing arguments
    expect_error(
      rt_taxa_from_externalids(),
      "'external_db' argument is needed to retrieve taxon using external IDs",
      fixed = TRUE
    )
    expect_error(
      rt_taxa_from_externalids("a"),
      "'external_id' argument is needed to retrieve taxon using external IDs",
      fixed = TRUE
    )

    # Wrong argument type
    expect_error(rt_taxa_from_externalids(1, "A"),
                 "'external_db' must be a character",
                 fixed = TRUE)
    expect_error(rt_taxa_from_externalids("worms", "A"),
                 "'external_id' must be a numeric",
                 fixed = TRUE)
  })
})
