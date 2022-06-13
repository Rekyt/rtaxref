#' Retrieve the list of existing TAXREF versions
#'
#' @param version_id {`NULL` or `integer(1)` \[default = `NULL`\]}\cr{}
#'                   the id of a TAXREF version
#'
#' @examples
#' \dontrun{rt_taxref_versions(version_id = 12)}
#'
#' @export
rt_taxref_versions = function(version_id = NULL) {

  stopifnot("'version_id' must be numeric or NULL" =
              is.numeric(version_id) | is.null(version_id))

  api_query = rt_GET("taxrefVersions/", version_id)

  parse_taxa(api_query)
}
