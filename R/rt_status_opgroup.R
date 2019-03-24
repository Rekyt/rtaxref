#' Retrieve the status of all Taxa in an Operational Group
#'
#' @param opgroup_id {`integer(1)`}\cr{}
#'                   identifier of the operational group (see the list of
#'                   operational groups [`rt_operational_groups()`])
#' @inheritParams rt_taxa_search
#'
#' @examples
#' \dontrun{
#'     rt_status_opgroup(opgroup_id = 706)
#' }
#'
#' @seealso the list of operational groups [`rt_operational_groups()`]
#'
#' @export
rt_status_opgroup = function(opgroup_id, page = 1, size = 2000) {

  api_query = rt_GET(paste0("status/findByOperationalGroup/", opgroup_id),
                     query = list(page = page,
                                  size = size))

  parse_taxa(api_query)
}
