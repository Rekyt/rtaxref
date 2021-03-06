#' Retrieve a taxon children
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_children(id = 442585)
#'
#' @export
rt_taxa_children = function(id) {

  check_required_arg(id, "retrieve the children of a taxon based on its id")

  api_query = rt_GET("taxa/", id, "/children")

  parse_taxa(api_query)
}
