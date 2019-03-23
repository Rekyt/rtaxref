#' Retrieve VernacularNames associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_vernacular = function(id) {
  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/vernacularNames"))

  parse_taxa(api_query)
}
