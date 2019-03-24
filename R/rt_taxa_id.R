#' Retrieve a taxon information using its id
#'
#' @param id {`integer(1)`}\cr{}
#'           an integer giving the id of the taxon in TaxRef (also called
#'           `cdNom`)
#'
#' @export
rt_taxa_id = function(id) {

  api_query = rt_GET(paste0("taxa/", id))

  parse_taxa(api_query)
}
