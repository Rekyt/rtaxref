#' Retrieve the list of taxonomic ranks in TaxRef
#'
#' @export
#'
#' @importFrom httr GET
rt_taxo_ranks = function() {

  api_query = GET(rt_base_url(), path = "api/taxonomicRanks")

  parse_taxa(api_query)
}

#' Retrieve a taxonomic rank used in TaxRef
#'
#' @param taxo_id {`character(1)`}\cr{}
#'                the id of a taxonomic rank in TaxRef see
#'                [`rt_taxo_ranks()`]
#'
#' @export
#'
#' @importFrom httr GET
rt_taxo_ranks_id = function(taxo_id) {

  api_query = GET(rt_base_url(), path = paste0("api/taxonomicRanks/", taxo_id))

  parse_taxa(api_query)
}
