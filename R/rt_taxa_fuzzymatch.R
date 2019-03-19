#' Find taxa by fuzzy matching their scientific Name
#'
#' @param sciname {`character(1)`}\cr{}
#'                a string giving the scientific name of the taxon with or
#'                without the author name
#'
#' @export
#'
#' @importFrom httr GET
rt_taxa_fuzzymatch = function(sciname) {

  api_query = GET(rt_base_url(), path = "api/taxa/fuzzymatch",
                  query = list(term = sciname))

  parse_taxa(api_query)
}
