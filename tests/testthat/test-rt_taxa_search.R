context("test-rt_taxa_search")

vcr::use_cassette("rt_taxa_search", {

  test_that("Matching scientific ids", {
    # Single Name
    expect_silent(res <- rt_taxa_search(4540))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 62))
    expect_equal(res$id, 4540)
    expect_equal(res$scientificName, "Petronia petronia")

    # Multiple Names
    expect_silent(res <- rt_taxa_search(c(4540, 443800)))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(2, 62))
    expect_equal(res$id, c(4540, 443800))
    expect_equal(res$scientificName,
                 c("Petronia petronia", "Bradypus tridactylus"))
  })

  test_that("Can retrieve a taxon matching its scientific name", {
    # Single Name
    expect_silent(res  <- rt_taxa_search(sciname = "Bradypus tridactylus"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 62))
    expect_equal(res$id, 443800)
    expect_equal(res$scientificName, "Bradypus tridactylus")

    # Multiple Name
    expect_silent(res <- rt_taxa_search(sciname = c("Bradypus tridactylus",
                                                    "Bradypus didactylus")))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(2, 62))
    expect_equal(res$id, c(822942, 443800))
    expect_equal(res$scientificName[[2]], "Bradypus tridactylus")
  })

  test_that("Matching common name", {
    # Single French Common Name
    expect_silent(res <- rt_taxa_search(fr_name = "Paresseux à trois doigts"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 62))
    expect_equal(res$id, 443800)
    expect_equal(res$scientificName, "Bradypus tridactylus")

    # Single English Common Name
    expect_silent(res <- rt_taxa_search(en_name = "magpie", size = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 61))
    expect_equal(res$id[[1]], 791639)
    expect_equal(res$scientificName[[1]], "Anania hortulata")

    # Multiple common names
    expect_silent(res <- rt_taxa_search(fr_name = c("corneille", "moineau"),
                                        size = 7))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(7, 61))
    expect_equal(res$id[[1]], 4535)
    expect_equal(res$scientificName[[1]], "Passer montanus hispaniae")
  })

  test_that("Matching rank", {
    # Single Ranks
    expect_silent(res <- rt_taxa_search(sciname = "Bradypus", rank = "GN"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 61))
    expect_equal(res$id, 443585)
    expect_equal(res$scientificName, "Bradypus")

    expect_silent(
      res2 <- rt_taxa_search(sciname = "Parus major", rank = "SSES")
    )

    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(2, 53))
    expect_equal(res2$id, c(3767, 3766))
    expect_equal(res2$rankId, c("SSES", "SSES"))

    # Multiple ranks
    expect_silent(res <- rt_taxa_search(sciname = "subtilis", size = 4,
                                        rank = c("FO", "SSES")))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(4, 52))
    expect_equal(res$id[[1]], 443309)
    expect_equal(res$rankId[1:4], c(rep("SSES", 3), "FO"))
  })

  test_that("Matching territories", {
    # Single Territory
    expect_silent(
      res <- rt_taxa_search(sciname = "Bradypus", territories = c("fr"))
    )

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 62))
    expect_equal(res$id, 892228)
    expect_equal(res$scientificName, "Stygarctus bradypus")
    expect_equal(res$fr, "P")

    expect_silent(
      res2 <- rt_taxa_search(sciname = "Bradypus", territories = c("gf"))
    )

    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(3, 62))
    expect_equal(res2$id, c(822942, 443585, 443800))
    expect_equal(res2$gf, c("P", "P", "S"))

    # Multiple territories
    expect_silent(res3 <- rt_taxa_search(sciname = "Bradypus",
                                         territories = c("reu", "pf")))

    expect_is(res3, "data.frame")
    expect_equal(dim(res3), c(1, 62))
    expect_equal(res3$id, 595516)
    expect_equal(res3$reu, "P")
  })

  test_that("Matching domain", {
    expect_silent(res <- rt_taxa_search(sciname = "albus", size = 1,
                                        domain = "marin"))
    expect_silent(res2 <- rt_taxa_search(sciname = "albus", size = 1,
                                         domain = "continental"))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 52))
    expect_equal(res$id[1], 558240)

    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(1, 61))
    expect_equal(res2$id[1], 233098)
  })

  test_that("Matching habitats", {
    # Single habitat
    expect_silent(res <- rt_taxa_search(sciname = "albus", size = 1,
                                        habitats = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 52))
    expect_equal(res$id, 558240)
    expect_equal(res$habitat, "1")

    expect_silent(res2 <- rt_taxa_search(sciname = "albus", size = 1,
                                         habitats = 2))
    expect_is(res2, "data.frame")
    expect_equal(dim(res2), c(1, 52))
    expect_equal(res2$id, 560687)
    expect_equal(res2$habitat, "2")

    # Multiple Habitats
    expect_silent(
      res <- rt_taxa_search(sciname = "saxatilis", habitats = c(2, 4), size = 4)
    )

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(4, 61))
    expect_equal(res$id[1], 777695)
    expect_equal(res$habitat, c(rep("2", 3), "4"))
  })

  test_that("Matching vernacular", {
    # Single Vernacular Group
    expect_silent(res <- rt_taxa_search(vernacular = "Tardigrades", size = 1))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 61))
    expect_equal(res$id, 368462)
    expect_equal(res$vernacularGroup1, "Tardigrades")

    # Multiple Vernacular Groups
    expect_silent(
      res <- rt_taxa_search(sciname = "saxatilis",
                            vernacular = c("Arthropodes", "Entognathes"))
    )

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 62))
    expect_equal(res$id, 216205)
    expect_equal(res$vernacularGroup1, "Arthropodes")
    expect_equal(res$vernacularGroup2, "Entognathes")
  })

  test_that("Wrong query returns error", {
    expect_error(
      rt_taxa_search("a"), "'id' must be numeric or NULL", fixed = TRUE
    )

    expect_error(
      rt_taxa_search(sciname = 1), "'sciname' must be a character or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(fr_name = 1), "'fr_name' must be a character or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(en_name = 1), "'en_name' must be a character or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(rank = 1), "'rank' must be a character or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(territories = 1),
      "'territories' must be a character or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(domain = 1), "'domain' must be a character or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(habitats = "a"), "'habitats' must be a numeric or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(vernacular = 1), "'vernacular' must be a character or NULL",
      fixed = TRUE
    )

    expect_error(
      rt_taxa_search(version = 1), "'version' must be a character or NULL",
      fixed = TRUE
    )
  })
})
