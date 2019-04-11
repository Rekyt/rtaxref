#' Retrieve operational groups used in TaxRef
#'
#' Operational Groups are names of groups either taxonomic or vernacular
#' used across TaxRef in French. If used without argument returns the list of
#' all operational groups used in TaxRef.
#'
#' @param opgroup_id {`numeric(1)`, default = `NULL`}\cr{}
#'                    the id of an operational group referenced in TaxRef
#'
#' @export
#'
#' @examples
#' rt_operational_groups(opgroup_id = 143)
rt_operational_groups = function(opgroup_id = NULL) {

  api_query = rt_GET("operationalGroups/", opgroup_id)

  parse_taxa(api_query)
}
