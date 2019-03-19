#' Retrieve the list of vernacular groups in TaxRef
#'
#' @export
#'
#' @importFrom httr GET
rt_vernacular_groups = function() {

  api_query = GET(rt_base_url(), path = "api/vernacularGroups")

  parse_taxa(api_query)
}
