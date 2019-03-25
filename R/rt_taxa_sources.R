#' Retrieve Sources Associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_sources(id = 443800)
#'
#' @seealso [`rt_source_uses()`] for types of source use
#' @export
rt_taxa_sources = function(id) {
  api_query = rt_GET("taxa/", id, "/sources")

  parse_taxa(api_query)
}
