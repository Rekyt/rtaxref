#' Retrieve a taxon information using its id
#'
#' @param id {`integer(1)`}\cr{}
#'           an integer giving the id of the taxon in TaxRef (also called
#'           `cdNom`)
#'
#'
#' @export
#'
#' @importFrom httr GET
rt_taxa_id = function(id) {

  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id))

  parse_taxa(api_query)
}
