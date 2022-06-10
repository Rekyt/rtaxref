context("test-rt_interactions_type")

vcr::use_cassette("rt_interactions_type", {
  test_that("Can retrieve interaction types list", {
    expect_silent(res <- rt_interactions_type())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(14, 8))
    expect_named(res, c("id", "name", "description", "example",
                        "reverseRelationName", "oboRoUri", "dbPediaUri",
                        "self.href"))
  })

  test_that("Can retrieve specific interaction types", {
    expect_silent(res <- rt_interactions_type(interaction_id = "PREDATEUR"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 7))
    expect_named(res, c("id", "name", "description", "example",
                        "reverseRelationName", "oboRoUri", "dbPediaUri"))
    expect_equal(res$id, "PREDATEUR")
  })

  test_that("Wrong query returns error", {
    expect_error(rt_interactions_type("ASDF"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_interactions_type(9),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
})

