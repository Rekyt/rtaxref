#' Retrieve history of a taxon through TAXREF versions
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_taxrefhistory(id = 443800)}
#'
#' @export
rt_taxa_taxrefhistory = function(id = NULL) {

  check_required_arg(id, "retrieve TAXREF history of a taxon using its id")

  stopifnot("'id' must be a numeric" = is.numeric(id))

  api_query = rt_GET("taxa/", id, "/taxrefHistory")

  parse_taxa(api_query)
}
