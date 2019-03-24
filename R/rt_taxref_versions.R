#' Retrieve the list of existing TaxRef versions
#'
#' @export
#'
#' @importFrom httr GET
rt_taxref_versions = function() {

  api_query = rt_GET("taxrefVersions")

  parse_taxa(api_query)
}

#' Retrieve information about a TaxRef version
#'
#' @param version_id {`integer(1)`}\cr{}
#'                   the id of a TaxRef version
#'                   [`rt_taxref_versions()`]
#'
#' @export
#'
#' @importFrom httr GET
rt_taxref_versions_id = function(version_id) {

  api_query = rt_GET(paste0("taxrefVersions/", version_id))

  parse_taxa(api_query)
}
