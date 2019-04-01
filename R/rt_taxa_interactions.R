#' Retrieve Interactions of taxon with other taxa
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_interactions(id = 110335)
#'
#' @export
rt_taxa_interactions = function(id) {

  check_required_arg(id, "retrieve interactions of a taxon using its id")

  api_query = rt_GET("taxa/", id, "/interactions")

  parse_taxa(api_query, cut_names = FALSE)
}
