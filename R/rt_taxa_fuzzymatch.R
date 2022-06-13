#' Find taxa by fuzzy matching their scientific Name
#'
#' @param sciname {`character(1)` \[**required**\]}\cr{}
#'                a string giving the scientific name of the taxon with or
#'                without the author name
#'
#' @export
rt_taxa_fuzzymatch = function(sciname = NULL) {

  check_required_arg(sciname, "fuzzymatch taxon search")

  stopifnot("'sciname' must be a character" = is.character(sciname))

  api_query = rt_GET("taxa/fuzzyMatch", query = list(term = sciname))

  parse_taxa(api_query)
}
