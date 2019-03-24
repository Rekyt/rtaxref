#' Retrieve the list of vernacular groups in TaxRef
#'
#' @export
rt_vernacular_groups = function() {

  api_query = rt_GET("vernacularGroups")

  parse_taxa(api_query)
}
