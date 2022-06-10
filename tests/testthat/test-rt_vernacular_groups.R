context("test-rt_vernacular_groups")

vcr::use_cassette("rt_vernacular_groups", {
  test_that("Can retrieve vernacular groups list", {
    expect_silent(res <- rt_vernacular_groups())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(54, 2))
    expect_named(res, c("name", "level"))
    expect_is(res$name, "character")
    expect_is(res$level, "character")
    expect_equal(res$name[1], "Arachnides")
    expect_equal(res$level[1], "2")
  })
})

