#' Retrieve Synonyms associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_synonyms(id = 107003)}
#'
#' @export
rt_taxa_synonyms = function(id = NULL) {

  check_required_arg(id, "retrieve synonyms of a taxon using its id")

  stopifnot("'id' must be a numeric" = is.numeric(id))

  api_query = rt_GET("taxa/", id, "/synonyms")

  parse_taxa(api_query)
}
