#' Search a source from a citation by fuzzy matching
#'
#' @param citation {`character(1)`}\cr{}
#'                 A (partial) citation
#'
#' @examples
#' \dontrun{
#' rt_sources_match(
#'     paste0("Chapman, T. A. 1909. Callophrys avis a new butterfly on ",
#'            "southern France. The Entomologist's record and journal of ",
#'            "variation, 21: 130-131.")
#' )
#' }
#' @export
rt_sources_match = function(citation = NULL) {

  check_required_arg(citation, "retrieve a source from its citation")

  stopifnot("'citation' must be a character" = is.character(citation))

  api_query = rt_GET("sources/matchByCitation",
                     query = list(citation = citation))

  parse_taxa(api_query)
}
