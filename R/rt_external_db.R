#' Retrieve external DBs referenced in TaxRef
#'
#' If the function is used without arguments returns the list of external
#' databases used in TaxRef.
#'
#' @param db_id {`character(1)`, default = `NULL`}\cr{}
#'              The id of an external db referenced in TaxRef
#'
#' @examples
#' rt_external_db(db_id = "worms")
#'
#' @export
rt_external_db = function(db_id = NULL) {

  api_query = rt_GET("externalDb/", tolower(db_id))

  parse_taxa(api_query)
}
