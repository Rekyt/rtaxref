#' Retrieve the list of existing TAXREF versions
#'
#' @param version_id {`integer(1)`, default = `NULL`}\cr{}
#'                   the id of a TAXREF version
#'
#' @examples
#' rt_taxref_versions(version_id = 12)
#'
#' @export
rt_taxref_versions = function(version_id = NULL) {

  api_query = rt_GET("taxrefVersions/", version_id)

  parse_taxa(api_query)
}
