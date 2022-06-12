#' Retrieve Sources Associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_sources(id = 443800)}
#'
#' @seealso [`rt_source_uses()`] for types of source use
#' @export
rt_taxa_sources = function(id = NULL) {

  check_required_arg(id, "retrieve sources of a taxon using its id")

  stopifnot("'id' must be a numeric" = is.numeric(id))

  api_query = rt_GET("taxa/", id, "/sources")

  parse_taxa(api_query)
}
