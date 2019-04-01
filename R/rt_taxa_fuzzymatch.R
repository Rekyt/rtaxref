#' Find taxa by fuzzy matching their scientific Name
#'
#' @param sciname {`character(1)`}\cr{}
#'                a string giving the scientific name of the taxon with or
#'                without the author name
#'
#' @export
rt_taxa_fuzzymatch = function(sciname) {

  check_required_arg(sciname, "fuzzymatch taxon search")

  api_query = rt_GET("taxa/fuzzyMatch",
                     query = list(term = sciname))

  parse_taxa(api_query)
}
