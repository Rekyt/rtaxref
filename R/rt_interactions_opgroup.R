#' Retrieve the interactions of all Taxa in an Operational Group
#'
#' @inheritParams rt_status_opgroup
#'
#' @seealso the list of operational groups [`rt_operational_groups()`]
#' @export
#'
#' @importFrom httr GET
rt_interactions_opgroup = function(opgroup_id, page = 1, size = 2000) {

  api_query = rt_GET(paste0("interactions/findByOperationalGroup/", opgroup_id),
                     query = list(page = page,
                                  size = size))

  parse_taxa(api_query)
}
