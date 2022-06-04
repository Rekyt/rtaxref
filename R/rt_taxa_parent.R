#' Retrieve classification above the taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_parent(id = 443800)}
#'
#' @export
rt_taxa_parent = function(id) {

  check_required_arg(id, "retrieve parent of a taxon using its id")

  api_query = rt_GET("taxa/", id, "/classification")

  parse_taxa(api_query)
}
