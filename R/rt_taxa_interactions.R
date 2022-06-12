#' Retrieve Interactions of taxon with other taxa
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_interactions(id = 110335)}
#'
#' @export
rt_taxa_interactions = function(id = NULL) {

  check_required_arg(id, "retrieve interactions of a taxon using its id")

  stopifnot("'id' must be a numeric" = is.numeric(id))

  api_query = rt_GET("taxa/", id, "/interactions")

  parse_taxa(api_query, cut_names = FALSE)
}
