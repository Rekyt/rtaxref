context("test-rt_taxa_status")

vcr::use_cassette("rt_taxa_status", {
  test_that("Can retrieve status related to a taxon using its id", {
    expect_silent(res <- rt_taxa_status(107003, detail = FALSE))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 33))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href",
                        "requestedLocationId", "worldRedList",
                        "europeanRedList", "nationalRedList", "localRedList",
                        "bonnConvention", "bernConvention",
                        "barcelonaConvention", "osparConvention",
                        "hffDirective", "birdDirective", "nationalProtection",
                        "regionalProtection", "departementalProtection",
                        "overseaProtection", "nationalActionPlan",
                        "completedNationalActionPlan", "determinanteZnieff",
                        "scapNationale", "scapRegionale", "sensibilite",
                        "biogeoStatus", "reglementation",
                        "noIntroductionReglementation",
                        "invasiveReglementation",
                        "prioriteActionPubliqueNationale"))
    expect_equal(res$id[1], 107003)

    expect_silent(res2 <- rt_taxa_status(443800, detail = TRUE))
    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(4, 23))
    expect_named(res2, c("id", "scientificName", "fullNameHtml", "referenceId",
                         "parentId", "referenceNameHtml", "href",
                         "statusTypeName", "statusTypeGroup", "statusCode",
                         "statusName", "statusRemarks", "locationId",
                         "locationName", "locationAdminLevel", "sourceId",
                         "source", "requestedLocationId", "listedName",
                         "statusType.href", "location.href",
                         "bibliographicResource.href", "statusValue.href"))
    expect_equal(res2$id[1], 443800)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_status(1234567),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_taxa_status("A"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
}, record = "new_episodes")
