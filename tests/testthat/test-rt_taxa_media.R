context("test-rt_taxa_media")

vcr::use_cassette("rt_taxa_media", {
  test_that("Can retrieve media about a taxon using its id", {
    expect_silent(res <- rt_taxa_media(110335))

    expect_is(res, "data.frame")
    expect_equal(dim(res), c(4, 14))
    expect_named(res, c("id", "scientificName", "fullNameHtml", "referenceId",
                        "parentId", "referenceNameHtml", "href", "copyright",
                        "title", "licence", "mimeType", "self.href",
                        "file.href", "thumbnailFile.href"))

    expect_equal(res$id[1], 110335)
  })

  test_that("Wrong query returns error", {
    expect_error(rt_taxa_media("blabla"),
                 "The query is invalid. Please try another query.",
                 fixed = TRUE)

    expect_error(rt_taxa_media(1234567),
                 "The query returned no results. Please try another query",
                 fixed = TRUE)
  })
})
