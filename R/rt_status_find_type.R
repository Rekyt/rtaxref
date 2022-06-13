#' Retrieve the status of all Taxa according to a Status Type
#'
#' @param status_id {`character(1)` \[**required**\]}\cr{}
#'                  The identifier of status (see [`rt_status_type()`] for the
#'                  list of status types)
#' @inheritParams rt_status_opgroup
#'
#' @examples
#' \dontrun{
#' # Find all taxa concerned by Habitat Directive referenced in TAXREF
#' rt_status_find_type("DH")
#' }
#'
#' @seealso the list of status types [`rt_status_type()`]
#'
#' @export
rt_status_find_type = function(status_id = NULL, page = 1, size = 2000) {

  check_required_arg(status_id, "retrieve all taxa with given status")

  stopifnot("'status_id' must be a character" = is.character(status_id))
  stopifnot("'page' must be a numeric"        = is.numeric(page))
  stopifnot("'size' must be a numeric"        = is.numeric(size))

  api_query = rt_GET("status/findByType/", status_id,
                     query = list(page = page,
                                  size = size))

  parse_taxa(api_query)
}
