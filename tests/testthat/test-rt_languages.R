context("test-rt_languages")

vcr::use_cassette("rt_languages", {
  test_that("Can retrieve languages list", {
    expect_silent(res <- rt_languages())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(71, 8))
    expect_named(res, c("id", "name", "iso6393", "wikidataUri", "locationName",
                        "self.href", "location.href","location.templated"))
  })

  test_that("Can retrieve specific languages", {
    expect_silent(res <- rt_languages(languages_id = "arw"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 5))
    expect_named(res, c("id", "name", "iso6393", "wikidataUri", "locationName"))
    expect_equal(res$id, "arw")
    expect_equal(res$locationName, "Guyane")
  })

  test_that("Wrong query returns error", {
    expect_error(rt_languages("ASD"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_languages("ASDF"),
                 "'languages_id' must be a three-letters character or NULL",
                 fixed = TRUE)

    expect_error(rt_languages(9),
                 "'languages_id' must be a three-letters character or NULL",
                 fixed = TRUE)
  })
})

