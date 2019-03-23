#' Retrieve Media (photos & others) Associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_media = function(id) {
  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/media"))

  parse_taxa(api_query)
}
