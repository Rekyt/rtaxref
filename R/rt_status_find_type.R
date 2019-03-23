#' Retrieve the status of all Taxa according to a Status Type
#'
#' @param status_id {`character(1)`}\cr{}
#'                  The identifier of status (see [`rt_status_type()`] for the
#'                  list of status types)
#' @inheritParams rt_taxa_search
#'
#'
#' @seealso the list of status types [`rt_status_type()`]
#' @export
#'
#' @importFrom httr GET
rt_status_find_type = function(status_id = NULL, page = 1, size = 2000) {

  api_query = GET(rt_base_url(), path = paste0("api/status/findByType/",
                                               status_id),
                  query = list(page = page,
                               size = size))

  parse_taxa(api_query)
}
