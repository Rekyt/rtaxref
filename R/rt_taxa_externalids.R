#' Retrieve IDs of the taxon in external databases
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_externalids(id = 443800)}
#'
#' @export
rt_taxa_externalids = function(id) {

  check_required_arg(id, "retrieve the external IDs of a taxon using its id")

  api_query = rt_GET("taxa/", id, "/externalIds")

  parse_taxa(api_query)
}
