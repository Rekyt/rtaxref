#' Retrieve IDs of the taxon in external databases
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_externalids = function(id) {
  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/externalIds"))

  parse_taxa(api_query)
}
