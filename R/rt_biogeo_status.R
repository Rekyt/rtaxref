#' Retrieve the list of biogeographic statuses used in TaxRef
#'
#' @export
#'
#' @importFrom httr GET
rt_biogeo_status = function() {

  api_query = GET(rt_base_url(), path = "api/biogeographicStatus")

  parse_taxa(api_query)
}

#' Retrieve a biogeographic status used in TaxRef
#'
#' @param biogeo_id {`character(1)`}\cr{}
#'                  A biogeographic status used in TaxRef see
#'                  [`rt_biogeo_status()`]
#'
#' @export
#'
#' @importFrom httr GET
rt_biogeo_status_id = function(biogeo_id) {

  api_query = GET(rt_base_url(), path = paste0("api/biogeographicStatus/",
                                               biogeo_id))

  parse_taxa(api_query)
}
