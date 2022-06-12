#' Search a source from a term
#'
#' @param term {`character(1)`, **required**}\cr{}
#'             A term contained in the source
#'
#' @examples
#' \dontrun{
#' rt_sources_find_term(term = "Ophrys")
#' }
#' @export
rt_sources_find_term = function(term = NULL) {

  check_required_arg(term, "retrieve sources containing a specific term")

  stopifnot("'term' should be a character" = is.character(term))

  api_query = rt_GET("sources/findByTerm/", term)

  parse_taxa(api_query)
}
