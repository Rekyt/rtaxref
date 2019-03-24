#' Search a source from a citation by fuzzy matchin
#'
#' @param citation {`character(1)`}\cr{}
#'                 A (partial) citation
#'
#' @export
#'
#' @importFrom httr GET
rt_sources_match = function(citation = NULL) {

  if (citation == "" | is.null(citation)) stop("citation needs to be not empty")

  api_query = rt_GET("sources/matchByCitation",
                     query = list(citation = citation))

  parse_taxa(api_query)
}
