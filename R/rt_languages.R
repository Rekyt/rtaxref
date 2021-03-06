#' Retrieve the languages used in TaxRef
#'
#' If used without argument returns the list of languages used in TaxRef
#' otherwise the specific
#'
#' @param languages_id {`character(1)`, default = `NULL`}\cr{}
#'                    three-letter lowercase code that is the id of a language
#'                    referenced in TaxRef
#'
#' @examples
#' # Retrieve the TaxRef definition in the Wayana Language
#' rt_languages(languages_id = "way")
#'
#' @export
rt_languages = function(languages_id = NULL) {

  api_query = rt_GET("langages/", tolower(languages_id))

  parse_taxa(api_query)
}
