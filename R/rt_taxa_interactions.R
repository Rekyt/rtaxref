#' Retrieve Interactions of taxon with other taxa
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_interactions = function(id) {
  api_query = rt_GET(paste0("taxa/", id, "/interactions"))

  parse_taxa(api_query, cut_names = FALSE)
}
