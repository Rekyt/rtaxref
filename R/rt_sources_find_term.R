#' Search a source from a term
#'
#' @param term {`character(1)`}\cr{}
#'             A term contained in the source
#'
#' @export
#'
#' @importFrom httr GET
rt_sources_find_term = function(term = NULL) {

  if (term == "" | is.null(term)) stop("term needs to be not empty")

  api_query = GET(rt_base_url(), path = paste0("api/sources/findByTerm/",
                                               term))

  parse_taxa(api_query)
}
