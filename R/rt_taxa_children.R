#' Retrieve a taxon children
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_children = function(id) {

  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/children"))

  parse_taxa(api_query)
}
