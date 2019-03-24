#' Retrieve a taxon children
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_children(id = 442585)
#'
#' @export
rt_taxa_children = function(id) {

  api_query = rt_GET(paste0("taxa/", id, "/children"))

  parse_taxa(api_query)
}
