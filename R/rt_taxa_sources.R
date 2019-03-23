#' Retrieve Sources Associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @seealso [`rt_source_uses()`] for types of source use
#' @export
rt_taxa_sources = function(id) {
  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/sources"))

  parse_taxa(api_query)
}
