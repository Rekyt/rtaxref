#' Retrieve Interactions of taxon with other taxa
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_interactions = function(id) {
  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/interactions"))

  parse_taxa(api_query)
}
