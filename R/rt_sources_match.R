#' Search a source from a citation by fuzzy matchin
#'
#' @param citation {`character(1)`}\cr{}
#'                 A (partial) citation
#'
#' @examples
#' rt_sources_match(
#'     paste0("Chapman, T. A. 1909. Callophrys avis a new butterfly on ",
#'            "southern France. The Entomologist's record and journal of ",
#'            "variation, 21: 130-131.")
#' )
#'
#' @export
rt_sources_match = function(citation = NULL) {

  if (citation == "" | is.null(citation)) stop("citation needs to be not empty")

  api_query = rt_GET("sources/matchByCitation",
                     query = list(citation = citation))

  parse_taxa(api_query)
}
