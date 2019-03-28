#' Retrieve the list of existing TaxRef versions
#'
#' @export
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
#' @examples
#' rt_taxref_versions_id(version_id = 12)
#'
#' @export
rt_taxref_versions_id = function(version_id) {

  check_required_arg(version_id, "retrieve a taxref version using its id")

  api_query = rt_GET(paste0("taxrefVersions/", version_id))

  parse_taxa(api_query)
}
