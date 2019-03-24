#' Retrieve VernacularNames associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_vernacular = function(id) {
  api_query = rt_GET(paste0("taxa/", id, "/vernacularNames"))

  parse_taxa(api_query)
}
