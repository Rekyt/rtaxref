#' Retrieve the list of habitats used in TaxRef
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
#' @export
rt_habitats = function() {

  api_query = rt_GET("habitats")

  parse_taxa(api_query)
}

#' Retrieve a habitat used in TaxRef
#'
#' @param habitat_id {`character(1)`}\cr{}
#'              The id of a habitat referenced in TaxRef
#'              [`rt_habitats()`] see section below
#'
#'
#' @inheritSection rt_habitats Habitats
#'
#' @examples
#' rt_habitats_id(habitat_id = 8)
#'
#' @export
rt_habitats_id = function(habitat_id) {

  check_required_arg(habitat_id, paste0("retrieve a specific habitat ",
                                       "using its id"))

  api_query = rt_GET("habitats/", tolower(habitat_id))

  parse_taxa(api_query)
}
