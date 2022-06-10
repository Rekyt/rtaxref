context("test-rt_taxa_children")

vcr::use_cassette("rt_taxa_children", {
  test_that("Can retrieve children a of taxon using its id", {
    expect_silent(res <- rt_taxa_children(443498))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(2, 61))
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
                        "reference.href", "parent.href", "classification.href",
                        "synonyms.href", "children.href",
                        "vernacularNames.href", "media.href", "status.href",
                        "interactions.href", "taxrefHistory.href",
                        "externalIds.href", "taxonomicRank.href",
                        "taxrefUri.href", "inpnWebpage.href", "habitat.href"))
    expect_equal(res$id, c(443585, 443800))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_children(123),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_taxa_children("A"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
})
