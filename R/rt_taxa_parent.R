#' Retrieve classification above the taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_parent = function(id) {

  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/classification"))

  parse_taxa(api_query)
}
