context("test-rt_operational_groups")

vcr::use_cassette("rt_operational_groups", {
  test_that("Can retrieve operational group list", {
    expect_silent(res <- rt_operational_groups())

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(203, 15))
    expect_named(res, c("id", "name", "commonName", "shortDescription",
                        "mainGroup", "vernacularGroup1", "vernacularGroup2",
                        "vernacularGroup3", "description", "biology", "ecology",
                        "biogeography", "ethology", "economy", "self.href"))
  })

  test_that("Can retrieve specific operational group", {
    expect_silent(res <- rt_operational_groups_id(opgroup_id = 143))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 14))
    expect_named(res, c("id", "name", "commonName", "shortDescription",
                        "mainGroup", "vernacularGroup1", "vernacularGroup2",
                        "vernacularGroup3", "description", "biology", "ecology",
                        "biogeography", "ethology", "economy"))
    expect_equal(res$id, 143)
    expect_equal(res$name, factor("Amphibiens"))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_operational_groups_id(9),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_operational_groups_id("ASDF"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)
  })
}, record = "new_episodes")

