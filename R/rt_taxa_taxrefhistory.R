#' Retrieve history of a taxon through TaxRef versions
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_taxrefhistory = function(id) {

  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/taxrefHistory"))

  parse_taxa(api_query)
}
