#' Retrieve the list of biogeographic statuses used in TaxRef
#'
#' @export
rt_biogeo_status = function() {

  api_query = rt_GET("biogeographicStatus")

  parse_taxa(api_query)
}

#' Retrieve a biogeographic status used in TaxRef
#'
#' @param biogeo_id {`character(1)`}\cr{}
#'                  A biogeographic status used in TaxRef see
#'                  [`rt_biogeo_status()`]
#'
#' @examples
#' rt_biogeo_status_id("X")
#'
#' @export
rt_biogeo_status_id = function(biogeo_id) {

  api_query = rt_GET("biogeographicStatus/", biogeo_id)

  parse_taxa(api_query)
}
