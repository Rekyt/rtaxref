context("test-rt_habitats")

vcr::use_cassette("rt_habitats", {
  test_that("Can retrieve habitats list", {
    expect_silent(res <- rt_habitats())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(8, 4))
    expect_named(res, c("id", "name", "definition", "self.href"))
  })

  test_that("Can retrieve specific habitats", {
    expect_silent(res <- rt_habitats_id(habitat_id = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 3))
    expect_named(res, c("id", "name", "definition"))
    expect_equal(res$id, 1)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_habitats_id(9),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_habitats_id("A"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
}, record = "new_episodes")
