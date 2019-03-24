#' Retrieve the interactions of all Taxa in an Operational Group
#'
#' @inheritParams rt_status_opgroup
#'
#' @examples
#' rt_interactions_opgroup(opgroup_id = 706)
#' @seealso the list of operational groups [`rt_operational_groups()`]
#'
#' @export
rt_interactions_opgroup = function(opgroup_id, page = 1, size = 2000) {

  api_query = rt_GET(paste0("interactions/findByOperationalGroup/", opgroup_id),
                     query = list(page = page,
                                  size = size))

  parse_taxa(api_query, FALSE)
}
