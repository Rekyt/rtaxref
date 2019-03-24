#' Retrieve Synonyms associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_synonyms(id = 107003)
#'
#' @export
rt_taxa_synonyms = function(id) {
  api_query = rt_GET(paste0("taxa/", id, "/synonyms"))

  parse_taxa(api_query)
}
