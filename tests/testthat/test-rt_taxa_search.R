context("test-rt_taxa_search")

vcr::use_cassette("rt_taxa_search", {
  test_that("Can retrieve a taxon matching its name", {
    # Single Name
    expect_silent(res  <- rt_taxa_search("Bradypus tridactylus"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 61))
    expect_equal(res$id, 443800)
    expect_equal(res$scientificName, "Bradypus tridactylus")

    # Multiple Name
    # FIXME
  })

  test_that("Matching common name", {
    # Single French Common Name
    expect_silent(res <- rt_taxa_search(fr_name = "Paresseux à trois doigts"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 61))
    expect_equal(res$id, 443800)
    expect_equal(res$scientificName, "Bradypus tridactylus")

    # Single English Common Name
    # FIXME

    # Multiple common names
    # FIXME
  })

  test_that("Matching rank", {
    # Single Ranks
    expect_silent(res <- rt_taxa_search("Bradypus", rank = "GN"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 60))
    expect_equal(res$id, 443585)
    expect_equal(res$scientificName, "Bradypus")

    expect_silent(res2 <- rt_taxa_search("Parus major", rank = "SSES"))

    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(2, 53))
    expect_equal(res2$id, c(3767, 3766))
    expect_equal(res2$rankId, c("SSES", "SSES"))

    # Multiple ranks
    # FIXME
  })

  test_that("Matching territories", {
    # Single Territory
    expect_silent(res <- rt_taxa_search("Bradypus", territories = c("fr")))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 61))
    expect_equal(res$id, 892228)
    expect_equal(res$scientificName, "Stygarctus bradypus")
    expect_equal(res$fr, "P")

    expect_silent(res2 <- rt_taxa_search("Bradypus", territories = c("gf")))

    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(3, 61))
    expect_equal(res2$id, c(443585, 443800, 822942))
    expect_equal(res2$gf, c("P", "S", "P"))

    # Multiple territories
    # FIXME
    # expect_silent(res3 <- rt_taxa_search("Bradypus",
    #               territories = c("reu", "pf")))
    #
    # expect_is(res2, "data.frame")
    # expect_equal(dim(res2), c(3, 61))
    # expect_equal(res2$id, c(443585, 443800, 822942))
    # expect_equal(res2$fr, c("P", "S", "P"))
  })

  test_that("Matching domain", {
    expect_silent(res <- rt_taxa_search(sciname = "albus", size = 5,
                                        domain = "marin"))
    expect_silent(res2 <- rt_taxa_search(sciname = "albus", size = 5,
                                        domain = "continental"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(5, 61))
    expect_equal(res$id[1], 576043)

    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(5, 61))
    expect_equal(res2$id[1], 418745)
  })

  test_that("Matching habitats", {
    # Single habitat
    expect_silent(res <- rt_taxa_search(sciname = "albus", size = 2,
                                        habitats = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(2, 61))
    expect_equal(res$id[1], 576043)
    expect_equal(res$habitat, c("1", "1"))

    expect_silent(res2 <- rt_taxa_search(sciname = "albus", size = 2,
                                         habitats = 2))
    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(2, 61))
    expect_equal(res2$id[1], 64104)
    expect_equal(res2$habitat, c("2", "2"))

    expect_silent(res3 <- rt_taxa_search(sciname = "albus", size = 2,
                                         habitats = 3))
    expect_is(res3, "data.frame")
    expect_equal(dim(res3), c(2, 61))
    expect_equal(res3$id[1], 418745)
    expect_equal(res3$habitat, c("3", "3"))

    # Multiple Habitats
    # FIXME
  })

  test_that("Matching vernacular", {
    # Single Vernacular Group
    expect_silent(res <- rt_taxa_search(vernacular = "Tardigrades", size = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 61))
    expect_equal(res$id, 368462)
    expect_equal(res$vernacularGroup1, "Tardigrades")

    # Multiple Vernacular Groups
    # FIXME
  })

  test_that("Wrong query returns error", {
    skip("Investigate query")
  })
}, record = "new_episodes")
