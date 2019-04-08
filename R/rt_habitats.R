#' Retrieve habitats used in TaxRef
#'
#' If the function is used without arguments returns the list of habitats used
#' in TaxRef.
#'
#' @param habitat_id {`character(1)`, default = `NULL`}\cr{}
#'              The id of a habitat referenced in TaxRef
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
#' rt_habitats(habitat_id = 8)
#'
#' @export
rt_habitats = function(habitat_id = NULL) {

  if (is.null(habitat_id)) {
    api_query = rt_GET("habitats")
  } else {
    api_query = rt_GET("habitats/", habitat_id)
  }

  parse_taxa(api_query)
}
