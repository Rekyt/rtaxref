#' Retrieve all Status Types
#'
#' @seealso [`rt_status_find_type()`] to retrieve all information by status
#'
#' @export
#'
#' @importFrom httr GET
rt_status_type = function() {

  api_query = GET(rt_base_url(), path = "api/status/types/")

  parse_taxa(api_query)
}


#' Retrieve a Status Types based on its id
#'
#' @param status_id {`character(1)`}\cr{}
#'                  A character identifying the type of status (see
#'                  [`rt_status_type()`] for a list of status types)
#'
#' @seealso see [`rt_status_type()`] for a list of status types
#' @examples
#' rt_status_type_id("DH")
#' @export
#'
#' @importFrom httr GET
rt_status_type_id = function(status_id) {

  api_query = rt_GET(paste0("status/types/", status_id))

  parse_taxa(api_query)
}
