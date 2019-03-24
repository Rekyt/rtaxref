#' Retrieve IDs of the taxon in external databases
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' rt_taxa_externalids(id = 443800)
#'
#' @export
rt_taxa_externalids = function(id) {
  api_query = rt_GET(paste0("taxa/", id, "/externalIds"))

  parse_taxa(api_query)
}
