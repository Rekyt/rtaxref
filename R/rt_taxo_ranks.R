#' Retrieve the list of taxonomic ranks in TaxRef
#'
#' @export
rt_taxo_ranks = function() {

  api_query = rt_GET("taxonomicRanks")

  parse_taxa(api_query)
}

#' Retrieve a taxonomic rank used in TaxRef
#'
#' @param taxo_id {`character(1)`}\cr{}
#'                the id of a taxonomic rank in TaxRef see
#'                [`rt_taxo_ranks()`]
#'
#' @examples
#' rt_taxo_ranks_id(taxo_id = "VAR")
#'
#' @export
rt_taxo_ranks_id = function(taxo_id) {

  check_required_arg(taxo_id, "retrieve a specific taxonomic rank using its id")

  api_query = rt_GET("taxonomicRanks/", taxo_id)

  parse_taxa(api_query)
}
