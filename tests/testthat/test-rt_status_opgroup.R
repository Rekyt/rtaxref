context("test-rt_status_opgroup")

vcr::use_cassette("rt_status_opgroup", {
  test_that("Can retrieve status using the id of an operational group", {
    expect_silent(res <- rt_status_opgroup(706, size = 1))

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

  test_that("Wrong query returns error", {
    expect_error(rt_status_opgroup(123456),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_status_opgroup("azerty"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
}, record = "new_episodes")

