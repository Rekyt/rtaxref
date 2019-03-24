#' Retrieve the list of languages used in TaxRef
#'
#' @export
rt_languages = function() {

  api_query = rt_GET("langages")

  parse_taxa(api_query)
}

#' Retrieve a language used in TaxRef
#'
#' @param languages_id {`character(1)`}\cr{}
#'                    three-letter lowercase code that is the id of a language
#'                    referenced in TaxRef see [`rt_languages()`]
#'
#' @examples
#' # Retrieve the TaxRef definition in the Wayana Language
#' rt_languages_id(languages_id = "way")
#'
#' @export
rt_languages_id = function(languages_id) {

  api_query = rt_GET(paste0("langages/", tolower(languages_id)))

  parse_taxa(api_query)
}
