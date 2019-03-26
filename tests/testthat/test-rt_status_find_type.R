context("test-rt_status_find_type")

vcr::use_cassette("rt_status_find_type", {
  test_that("Can retrieve status using the id of a status type", {
    expect_silent(res <- rt_status_find_type("DH", size = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 22))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href",
                        "statusTypeName", "statusTypeGroup", "statusCode",
                        "statusName", "statusRemarks", "locationId",
                        "locationName", "locationAdminLevel", "sourceId",
                        "source", "requestedLocationId", "listedName",
                        "statusType.href", "location.href",
                        "bibliographicResource.href"))
    expect_equal(res$id, 717038)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_status_find_type("azerty"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
}, record = "new_episodes")

