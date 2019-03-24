#' Retrieve classification above the taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_parent(id = 443800)
#'
#' @export
rt_taxa_parent = function(id) {

  api_query = rt_GET(paste0("taxa/", id, "/classification"))

  parse_taxa(api_query)
}
