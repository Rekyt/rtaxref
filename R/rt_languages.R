#' Retrieve the languages used in TAXREF
#'
#' If used without argument returns the list of languages used in TAXREF
#' otherwise the specific
#'
#' @param languages_id {`NULL` or `character(1)` \[default = `NULL`\]}\cr{}
#'                    three-letter lowercase code that is the id of a language
#'                    referenced in TAXREF
#'
#' @examples
#' \dontrun{
#' # Retrieve the TAXREF definition in the Wayana Language
#' rt_languages(languages_id = "way")
#' }
#'
#' @export
rt_languages = function(languages_id = NULL) {

  stopifnot(
    "'languages_id' must be a three-letters character or NULL" =
      (is.character(languages_id) & isTRUE(nchar(languages_id) == 3)) |
      is.null(languages_id)
  )

  api_query = rt_GET("langages/", tolower(languages_id))

  parse_taxa(api_query)
}
