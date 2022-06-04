#' Retrieve habitats used in TAXREF
#'
#' If the function is used without arguments returns the list of habitats used
#' in TAXREF.
#'
#' @param habitat_id {`integer(1)`, default = `NULL`}\cr{}
#'                   The id of a habitat referenced in TAXREF
#'
#' @section Habitats:
#'
#' * `1` = Marine
#' * `2` = Freshwater
#' * `3` = Terrestrial
#' * `4` = Marine and freshwater
#' * `5` = Marine and Terrestrial
#' * `6` = Brackish water
#' * `7` = Continental (terrestrial and/or freshwater)
#' * `8` = Continental (terrestrial and freshwater)
#'
#' @examples
#' \dontrun{rt_habitats(habitat_id = 8)}
#'
#' @export
rt_habitats = function(habitat_id = NULL) {

  api_query = rt_GET("habitats/", habitat_id)

  parse_taxa(api_query)
}
