#' Retrieve classification above the taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_parent = function(id) {

  api_query = rt_GET(paste0("taxa/", id, "/classification"))

  parse_taxa(api_query)
}
