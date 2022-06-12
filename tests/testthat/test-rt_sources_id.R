context("test-rt_sources_id")

vcr::use_cassette("rt_sources_id", {
  test_that("Can retrieve source using an id", {
    expect_silent(res <- rt_sources_id(source_id = 160688))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(1, 8))
    expect_named(res, c("id", "fullCitation", "url", "doi", "doiUri",
                        "zooBankId", "zooBankUri", "abstract"))
    expect_equal(res$id, c(160688))
  })

  test_that("Can retrieve source as bibtex", {
    expect_silent(res <- rt_sources_id(source_id = 160688, bibtex = TRUE))

    expect_is(res, "character")
    expect_equal(
      res,
      paste0("@article{Linnaeus_1766,\n\tdoi = {},\n\t",
             "url = {http://biodiversitylibrary.org/page/42946197},\n\t",
             "year = 1766,\n\tpublisher = {},\n\tvolume = {},\n\tnumber = {},",
             "\n\tpages = {},\n\tauthor = {},\n\ttitle = {},\n\tjournal = {},",
             "\n\teditor = {},\n\tbooktitle = {},\n\tabstract = {}\n}"))
  })

  test_that("Wrong query returns error", {
    expect_error(rt_sources_id(123456),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)

    expect_error(rt_sources_id("azerty"),
                 "'source_id' must be a numeric",
                 fixed = TRUE)

    expect_error(rt_sources_id(1, bibtex = 3), "'bibtex' must be a logical",
                 fixed = TRUE)

    expect_error(rt_sources_id(1, bibtex = "a"), "'bibtex' must be a logical",
                 fixed = TRUE)
  })
})

