#' Retrieve biogeographic statuses used in TAXREF
#'
#' If the function is used without arguments returns the list of biogeographic
#' statuses used in TAXREF
#'
#' @param biogeo_id {`character(1)`, default = `NULL`}\cr{}
#'                  A biogeographic status id used in TAXREF
#'
#' @examples
#' rt_biogeo_status(biogeo_id = "P")
#'
#' @export
rt_biogeo_status = function(biogeo_id = NULL) {

  api_query = rt_GET("biogeographicStatus/", toupper(biogeo_id))

  parse_taxa(api_query)
}
