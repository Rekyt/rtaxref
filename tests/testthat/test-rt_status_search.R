context("test-rt_status_search")

vcr::use_cassette("rt_status_search", {
  test_that("Can retrieve status using the id of a species", {

    # Single id
    expect_silent(res <- rt_status_search(id = 443800, detail = FALSE))
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
    expect_equal(res$id, 443800)

    expect_silent(res <- rt_status_search(id = 443800, detail = TRUE))
    expect_is(res, "data.frame")
    expect_equal(dim(res), c(4, 23))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href",
                        "statusTypeName", "statusTypeGroup", "statusCode",
                        "statusName", "statusRemarks", "locationId",
                        "locationName", "locationAdminLevel", "sourceId",
                        "source", "requestedLocationId", "listedName",
                        "statusType.href", "location.href",
                        "bibliographicResource.href", "statusValue.href"))
    expect_equal(res$id[1], 443800)

    # Multiple ids
    expect_silent(res <- rt_status_search(c(443800, 59)))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(2, 33))
  })

  test_that("Can retrieve status using the id of a location", {
    expect_silent(res <- rt_status_search(location_id = "INSEEC34172",
                                          detail = FALSE, size = 1))
    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 34))
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
                        "prioriteActionPubliqueNationale", "location.href"))
    expect_equal(res$id, 59)

    expect_silent(res <- rt_status_search(location_id = "INSEEC34172",
                                          detail = TRUE, size = 1))
    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 22))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href",
                        "statusTypeName", "statusTypeGroup", "statusCode",
                        "statusName", "statusRemarks", "locationId",
                        "locationName", "locationAdminLevel", "sourceId",
                        "source", "requestedLocationId", "listedName",
                        "statusType.href", "statusValue.href", "location.href"))
    expect_equal(res$id[1], 162468)
  })

  test_that("Can retrieve status using the id of an operational group", {
    expect_silent(res <- rt_status_search(opgroup_id = 706, detail = FALSE,
                                          size = 1))
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
    expect_equal(res$id, 4703)

    expect_silent(res <- rt_status_search(opgroup_id = 706, detail = TRUE,
                                          size = 1))
    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 22))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href",
                        "statusTypeName", "statusTypeGroup", "statusCode",
                        "statusName", "statusRemarks", "locationId",
                        "locationName", "locationAdminLevel", "sourceId",
                        "source", "requestedLocationId", "listedName",
                        "statusType.href", "statusValue.href", "location.href"))
    expect_equal(res$id, 660455)
  })

  test_that("Can retrieve status using coordinates", {
    expect_silent(res <- rt_status_search(latitude = -45.5496, detail = FALSE,
                                          longitude = -0.7814, size = 1))
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
    expect_equal(res$id, 56)

    expect_silent(res <- rt_status_search(latitude = -45.5496, detail = TRUE,
                                          longitude = -0.7814, size = 1))
    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 22))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href",
                        "statusTypeName", "statusTypeGroup", "statusCode",
                        "statusName", "statusRemarks", "locationId",
                        "locationName", "locationAdminLevel", "sourceId",
                        "source", "requestedLocationId", "listedName",
                        "statusType.href", "statusValue.href", "location.href"))
    expect_equal(res$id, 162468)
  })

  test_that("Wrong query returns error", {
    # Search by taxon id
    expect_error(rt_status_search(id = 1234567, size = 1),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
    expect_error(rt_status_search(id = "azerty"),
                 "'id' must be a numeric or NULL",
                 fixed = TRUE)

    # Search by location
    expect_error(rt_status_search(location_id = 123, size = 1),
                 "'location_id' must be a character or NULL",
                 fixed = TRUE)
    expect_error(rt_status_search(location_id = "INSEE", size = 1),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    # Search by operational group
    expect_error(rt_status_search(opgroup_id = 123, size = 1),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
    expect_error(rt_status_search(opgroup_id = "INSEE", size = 1),
                 "'opgroup_id' must be a numeric or NULL",
                 fixed = TRUE)

    # Search by coordinates
    expect_error(rt_status_search(longitude = "azerty"),
                 "'longitude' must be a numeric or NULL",
                 fixed = TRUE)
    expect_error(rt_status_search(latitude = "azerty"),
                 "'latitude' must be a numeric or NULL",
                 fixed = TRUE)
    expect_error(rt_status_search(longitude = "azerty", latitude = "azerty"),
                 "'longitude' must be a numeric or NULL",
                 fixed = TRUE)

    # Wrong page and size
    expect_error(rt_status_search(opgroup_id = 123, page = "a"),
                 "'page' must be a numeric", fixed = TRUE)
    expect_error(rt_status_search(opgroup_id = 123, size = "a"),
                 "'size' must be a numeric", fixed = TRUE)
  })
})

