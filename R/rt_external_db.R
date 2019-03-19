#' Retrieve the list of external DBs referenced in TaxRef
#'
#' @export
#'
#' @importFrom httr GET
rt_external_db = function() {

  api_query = GET(rt_base_url(), path = "api/externalDb")

  parse_taxa(api_query)
}

#' Retrieve an external database referenced in TaxRef
#'
#' @param db_id {`character(1)`}\cr{}
#'              The id of an external db referenced in TaxRef
#'              [`rt_biogeo_status()`]
#'
#' @export
#'
#' @importFrom httr GET
rt_external_db_id = function(db_id) {

  api_query = GET(rt_base_url(), path = paste0("api/externalDb/",
                                               tolower(db_id)))

  parse_taxa(api_query)
}
