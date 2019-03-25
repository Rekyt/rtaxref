#' Retrieve the list of external DBs referenced in TaxRef
#'
#' @export
rt_external_db = function() {

  api_query = rt_GET("externalDb")

  parse_taxa(api_query)
}

#' Retrieve an external database referenced in TaxRef
#'
#' @param db_id {`character(1)`}\cr{}
#'              The id of an external db referenced in TaxRef
#'              [`rt_biogeo_status()`]
#'
#' @examples
#' rt_external_db_id(db_id = "avibase")
#'
#' @export
rt_external_db_id = function(db_id) {

  api_query = rt_GET("externalDb/", tolower(db_id))

  parse_taxa(api_query)
}
