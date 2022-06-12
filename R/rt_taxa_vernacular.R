#' Retrieve VernacularNames associated with a Taxon
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_vernacular(id = 443800)}
#'
#' @seealso [`rt_languages()`] for a list of languages referenced in TAXREF
#' @export
rt_taxa_vernacular = function(id = NULL) {

  check_required_arg(id, "retrieve vernacular names of a taxon using its id")

  stopifnot("'id' must be a numeric" = is.numeric(id))

  api_query = rt_GET("taxa/", id, "/vernacularNames")

  parse_taxa(api_query)
}
