#' Retrieve the list of langages used in TaxRef
#'
#'
#' @export
#'
#' @importFrom httr GET
rt_langages = function() {

  api_query = GET(rt_base_url(), path = "api/langages")

  parse_taxa(api_query)
}

#' Retrieve a habitat used in TaxRef
#'
#' @param langages_id {`character(1)`}\cr{}
#'                    three-letter lowercase code that is the id of a langage
#'                    referenced in TaxRef see [`rt_langages()`]
#'
#' @export
#'
#' @importFrom httr GET
rt_langages_id = function(langages_id) {

  api_query = GET(rt_base_url(), path = paste0("api/langages/",
                                               tolower(langages_id)))

  parse_taxa(api_query)
}
