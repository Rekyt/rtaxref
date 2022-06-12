context("test-rt_habitats")

vcr::use_cassette("rt_habitats", {
  test_that("Can retrieve habitats list", {
    expect_silent(res <- rt_habitats())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(8, 4))
    expect_named(res, c("id", "name", "definition", "self.href"))
  })

  test_that("Can retrieve specific habitats", {
    expect_silent(res <- rt_habitats(habitat_id = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 3))
    expect_named(res, c("id", "name", "definition"))
    expect_equal(res$id, 1)
  })

  test_that("Wrong query returns error", {
    expect_error(
      rt_habitats(9),
      "'habitat_id' argument should be in '1, 2, 3, 4, 5, 6, 7, 8' or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_habitats("A"),
      "'habitat_id' argument should be in '1, 2, 3, 4, 5, 6, 7, 8' or NULL",
      fixed = TRUE
    )
  })
})
