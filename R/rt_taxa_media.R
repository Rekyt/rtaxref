#' Retrieve Media (photos & others) Associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_media(id = 443800)
#'
#' @export
rt_taxa_media = function(id) {
  api_query = rt_GET("taxa/", id, "/media")

  parse_taxa(api_query)
}
