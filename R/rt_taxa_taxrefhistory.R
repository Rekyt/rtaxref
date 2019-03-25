#' Retrieve history of a taxon through TaxRef versions
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_taxrefhistory(id = 443800)
#'
#' @export
rt_taxa_taxrefhistory = function(id) {

  api_query = rt_GET("taxa/", id, "/taxrefHistory")

  parse_taxa(api_query)
}
