#' Retrieve operational groups used in TaxRef
#'
#' Operational Groups are names of groups either taxonomic or vernacular
#' used across TaxRef in French
#'
#' @param opgroup_id {`numeric(1)`, default = `NULL`}\cr{}
#'                    the id of an operational group referenced in TaxRef
#'
#' @export
rt_operational_groups = function(opgroup_id = NULL) {

  if (is.null(opgroup_id)) {
    api_query = rt_GET("operationalGroups")
  } else {
    api_query = rt_GET("operationalGroups/", opgroup_id)
  }

  parse_taxa(api_query)
}
