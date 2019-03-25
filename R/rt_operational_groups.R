#' Retrieve the list of operational groups used in TaxRef
#'
#' Operational Groups are names of groups either taxonomic or vernacular
#' used across TaxRef in French
#'
#' @export
rt_operational_groups = function() {

  api_query = rt_GET("operationalGroups")

  parse_taxa(api_query)
}

#' Retrieve an operational group used in TaxRef
#'
#' @param opgroup_id {`numeric(1)`}\cr{}
#'                    the id of an operational group referenced in TaxRef see
#'                    [`rt_operational_groups()`]
#'
#' @examples
#' rt_operational_groups_id(opgroup_id = 963)
#'
#' @export
rt_operational_groups_id = function(opgroup_id) {

  api_query = rt_GET("operationalGroups/", opgroup_id)

  parse_taxa(api_query)
}
