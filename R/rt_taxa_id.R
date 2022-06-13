#' Retrieve a taxon information using its id
#'
#' @param id {`integer(1)` \[**required**\]}\cr{}
#'           an integer giving the id of the taxon in TAXREF (also called
#'           `cdNom`)
#'
#' @examples
#' \dontrun{
#' rt_taxa_id(id = 443800)
#' rt_taxa_id(id = 110335)
#' }
#' @export
rt_taxa_id = function(id = NULL) {

  check_required_arg(id, "retrieve a specific taxon id")

  stopifnot("'id' must be a numeric" = is.numeric(id))

  api_query = rt_GET("taxa/", id)

  parse_taxa(api_query)
}
