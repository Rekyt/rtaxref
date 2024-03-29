#' Retrieve Media (photos & others) Associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_media(id = 443800)}
#'
#' @export
rt_taxa_media = function(id = NULL) {

  check_required_arg(id, "retrieve media of a taxon using its id")

  stopifnot("'id' must be a numeric" = is.numeric(id))

  api_query = rt_GET("taxa/", id, "/media")

  parse_taxa(api_query)
}
