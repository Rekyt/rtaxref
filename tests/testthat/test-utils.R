context("Test utility functions")

test_that("Returned base URL is correct", {
  expect_equal(rt_base_url(), "https://taxref.mnhn.fr/")
})

test_that("User Agent is well returned", {
  expect_equal(rt_ua(),
               "http://github.com/Rekyt/rtaxref R package rtaxref/0.1.0")
})

test_that("Query flattening works as expected", {

  simple_query <- list(a = 1, b = 2, c = 3)

  expect_equal(rt_flatten_query(simple_query), simple_query)

  complex_query <- list(a = c(1, 2), b = 2, c = 3)

  expect_equal(rt_flatten_query(complex_query),
               list(a = 1, a = 2, b = 2, c = 3))

  more_complex_query <- list(a = c(1, 2),
                             b = c("a", "b", "c"),
                             c = c("x", "y"))

  expect_equal(rt_flatten_query(more_complex_query),
               list(a = 1, a = 2,
                    b = "a", b = "b", b = "c",
                    c = "x", c = "y"))
})

vcr::use_cassette("rt_GET", {

  test_that("rt_GET works", {
    # without query
    expect_silent(res <- rt_GET("blabla"))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blabla")
    expect_equal(res$request$headers[["user-agent"]], rt_ua())
    expect_true(http_error(res))

    # multiple endpoint
    expect_silent(res <- rt_GET("blabla", "azerty", "/uiop"))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blablaazerty/uiop")
    expect_equal(res$request$headers[["user-agent"]], rt_ua())
    expect_true(http_error(res))

    # with query
    expect_silent(res <- rt_GET("blabla", query = list(id = 1)))
    expect_equal(res$url, "https://taxref.mnhn.fr/api/blabla?id=1")
    expect_equal(res$request$headers[["user-agent"]], rt_ua())
    expect_true(http_error(res))
  })

})

vcr::use_cassette("parse_taxa", {
  expect_silent(parse_taxa(rt_GET("biogeographicStatus/")))

  expect_error(
    parse_taxa(rt_GET("blabla")),
    "TAXREF is down. Please try again later.", fixed = TRUE
  )
})


test_that("check_required_arg() works", {
  a <- NULL
  b <- ""

  expect_silent(check_required_arg("bla", "bla"))

  expect_error(check_required_arg(a, "test"),
               regexp = "'a' argument is needed to test", fixed = TRUE)

  expect_error(check_required_arg(b, "test"),
               regexp = "'b' argument is needed to test", fixed = TRUE)
})

test_that("check_arg_in_list() works", {

  # Valid inputs
  expect_silent(check_arg_in_list("a",  c("a", "b", "c"), with_null = FALSE))
  expect_silent(check_arg_in_list("a",  c("a", "b", "c"), with_null = TRUE))
  expect_silent(check_arg_in_list(NULL, c("a", "b", "c"), with_null = TRUE))
  expect_silent(check_arg_in_list(1,    1:3, with_null = FALSE))
  expect_silent(check_arg_in_list(1,    1:3, with_null = TRUE))
  expect_silent(check_arg_in_list(NULL, 1:3, with_null = TRUE))

  # Invalid inputs
  expect_error(
    check_arg_in_list("d",  c("a", "b", "c"), with_null = FALSE),
    "'d' argument should be in 'a, b, c'",
    fixed = TRUE
  )
  expect_error(
    check_arg_in_list("",   c("a", "b", "c"), with_null = FALSE),
    "'' argument should be in 'a, b, c'",
    fixed = TRUE
  )
  expect_error(
    check_arg_in_list(NULL, c("a", "b", "c"), with_null = FALSE),
    "'' argument should be in 'a, b, c'",
    fixed = TRUE
  )
  expect_error(
    check_arg_in_list("d",  c("a", "b", "c"), with_null = TRUE),
    "'d' argument should be in 'a, b, c' or NULL",
    fixed = TRUE
  )
  expect_error(
    check_arg_in_list("",   c("a", "b", "c"), with_null = TRUE),
    "'' argument should be in 'a, b, c' or NULL",
    fixed = TRUE
  )
  expect_error(
    check_arg_in_list(4,    1:3, with_null = FALSE),
    "'4' argument should be in '1, 2, 3'",
    fixed = TRUE
  )
  expect_error(
    check_arg_in_list(NULL, 1:3, with_null = FALSE),
    "'' argument should be in '1, 2, 3'",
    fixed = TRUE
  )
  expect_error(
    check_arg_in_list(4,    1:3, with_null = TRUE),
    "'4' argument should be in '1, 2, 3' or NULL",
    fixed = TRUE
  )
})
