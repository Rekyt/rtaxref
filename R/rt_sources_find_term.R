#' Search a source from a term
#'
#' @param term {`character(1)`}\cr{}
#'             A term contained in the source
#'
#' @examples
#' rt_sources_find_term(term = "Ophrys")
#'
#' @export
rt_sources_find_term = function(term = NULL) {

  if (term == "" | is.null(term)) stop("term needs to be not empty")

  api_query = rt_GET(paste0("sources/findByTerm/", term))

  parse_taxa(api_query)
}
