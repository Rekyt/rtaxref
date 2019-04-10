#' Retrieve biogeographic statuses used in TaxRef
#'
#' If the function is used without arguments returns the list of biogeographic
#' statuses used in TaxRef.
#'
#' @param biogeo_id {`character(1)`, default = `NULL`}\cr{}
#'                  A biogeographic status id used in TaxRef
#'
#' @examples
#' rt_biogeo_status(biogeo_id = "P")
#'
#' @export
rt_biogeo_status = function(biogeo_id = NULL) {

  api_query = rt_GET("biogeographicStatus/", toupper(biogeo_id))

  parse_taxa(api_query)
}
