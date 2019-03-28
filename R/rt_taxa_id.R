#' Retrieve a taxon information using its id
#'
#' @param id {`integer(1)`}\cr{}
#'           an integer giving the id of the taxon in TaxRef (also called
#'           `cdNom`)
#'
#' @examples
#' rt_taxa_id(id = 443800)
#' rt_taxa_id(id = 110335)
#' @export
rt_taxa_id = function(id) {

  check_required_arg(id, "retrieve a specific taxon id")

  api_query = rt_GET("taxa/", id)

  parse_taxa(api_query)
}
