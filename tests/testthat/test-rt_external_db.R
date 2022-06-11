context("test-rt_external_db")

vcr::use_cassette("rt_external_db", {
  test_that("Can retrieve external database list", {
    expect_silent(res <- rt_external_db())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(39, 6))
    expect_named(res, c("id", "name", "title", "websiteUrl", "authors",
                        "self.href"))
  })

  test_that("Can retrieve specific external database", {
    expect_silent(res <- rt_external_db("antcat"))
    # Also in capital
    expect_silent(res2 <- rt_external_db("ANTCAT"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 5))
    expect_named(res, c("id", "name", "title", "websiteUrl", "authors"))
    expect_equal(res$id, "antcat")
    expect_identical(res, res2)

  })

  test_that("Wrong query returns error", {
    expect_error(rt_external_db("ASDF"),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_external_db(1),
                 "'db_id' must be NULL or a character",
                 fixed = TRUE)
  })
})
