#' Retrieve Synonyms associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @export
rt_taxa_synomyms = function(id) {
  api_query = rt_GET(paste0("taxa/", id, "/synonyms"))

  parse_taxa(api_query)
}
