#' Retrieve operational groups used in TAXREF
#'
#' Operational Groups are names of groups either taxonomic or vernacular
#' used across TAXREF in French. If used without argument returns the list of
#' all operational groups used in TAXREF.
#'
#' @param opgroup_id {`NULL` or `numeric(1)` \[default = `NULL`\]}\cr{}
#'                    the id of an operational group referenced in TAXREF
#'
#' @export
#'
#' @examples
#' \dontrun{rt_operational_groups(opgroup_id = 143)}
rt_operational_groups = function(opgroup_id = NULL) {

  stopifnot(
    "'opgroup_id' must be a numeric or NULL" =
      is.numeric(opgroup_id) | is.null(opgroup_id)
  )

  api_query = rt_GET("operationalGroups/", opgroup_id)

  parse_taxa(api_query)
}
