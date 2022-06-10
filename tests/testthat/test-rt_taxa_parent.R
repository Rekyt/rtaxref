context("test-rt_taxa_parent")

vcr::use_cassette("rt_taxa_parent", {
  test_that("Can retrieve parent of taxon using its id", {
    expect_silent(res <- rt_taxa_parent(185694))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(5, 60))
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
                        "reference.href", "classification.href",
                        "synonyms.href", "children.href",
                        "vernacularNames.href", "media.href", "status.href",
                        "interactions.href", "taxrefHistory.href",
                        "externalIds.href", "taxonomicRank.href",
                        "taxrefUri.href", "inpnWebpage.href", "parent.href"))
    expect_equal(res$id[1], 349525)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_parent(123),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_taxa_parent("A"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
})
