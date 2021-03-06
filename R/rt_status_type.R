#' Retrieve Status Types Used in TaxRef
#'
#' If the function is provided without arguments returns the entire list of
#' status types used in TaxRef.
#' @param status_id {`character(1)`, default = `NULL`}\cr{}
#'                  A character identifying the type of status
#'
#' @export
rt_status_type = function(status_id = NULL) {

  status_id = gsub("^EXPNA$", "exPNA", toupper(status_id))

  api_query = rt_GET("status/types/", status_id)

  parse_taxa(api_query)
}
