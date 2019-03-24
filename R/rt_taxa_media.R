#' Retrieve Media (photos & others) Associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_media = function(id) {
  api_query = rt_GET(paste0("taxa/", id, "/media"))

  parse_taxa(api_query)
}
