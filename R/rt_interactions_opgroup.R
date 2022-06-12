#' Retrieve the interactions of all Taxa in an Operational Group
#'
#' @inheritParams rt_status_opgroup
#'
#' @examples
#' \dontrun{rt_interactions_opgroup(opgroup_id = 706)}
#'
#' @seealso the list of operational groups [rt_operational_groups()]
#'
#' @export
rt_interactions_opgroup = function(opgroup_id = NULL, page = 1, size = 2000) {

  check_required_arg(opgroup_id, paste0("retrieve interactions using ",
                                        "operational group ID"))

  stopifnot(
    "'opgroup_id' must be a numeric" = is.numeric(opgroup_id)
  )

  stopifnot(
    "'page' must be a numeric" = is.numeric(page)
  )

  stopifnot(
    "'size' must be a numeric" = is.numeric(size)
  )

  api_query = rt_GET("interactions/findByOperationalGroup/", opgroup_id,
                     query = list(page = page,
                                  size = size))

  parse_taxa(api_query, FALSE)
}
