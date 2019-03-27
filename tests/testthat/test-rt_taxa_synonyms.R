context("test-rt_taxa_synonyms")

vcr::use_cassette("rt_taxa_synonyms", {
  test_that("Can retrieve synonyms related to a taxon using its id", {
    expect_silent(res <- rt_taxa_synonyms(107003))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(8, 53))
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
                        "nc", "wf", "pf", "cli", "taxrefVersion", "self.href",
                        "reference.href", "taxrefHistory.href",
                        "externalIds.href", "taxonomicRank.href",
                        "habitat.href", "taxrefUri.href", "inpnWebpage.href"))
    expect_equal(res$id[1], 92412)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_synonyms(1234567),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_taxa_synonyms("A"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
}, record = "new_episodes")
