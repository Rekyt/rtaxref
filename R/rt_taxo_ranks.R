#' Retrieve taxonomic ranks in TAXREF
#'
#' If the function is used without arguments returns the entire list of
#' taxonomic ranks used in TAXREF.
#'
#' @param taxo_id {`character(1)`, default = `NULL`}\cr{}
#'                the id of a taxonomic rank in TAXREF.
#'
#' @examples
#' rt_taxo_ranks(taxo_id = "VAR")
#'
#' @export
rt_taxo_ranks = function(taxo_id = NULL) {

  taxo_id = gsub("^DUMM$", "Dumm", toupper(taxo_id))

  api_query = rt_GET("taxonomicRanks/", taxo_id)

  parse_taxa(api_query)
}
