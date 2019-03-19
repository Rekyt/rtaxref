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
#'
#' @importFrom httr GET
rt_habitats = function() {

  api_query = GET(rt_base_url(), path = "api/habitats")

  parse_taxa(api_query)
}

#' Retrieve a habitat used in TaxRef
#'
#' @param habitat_id {`character(1)`}\cr{}
#'              The id of a habitat referenced in TaxRef
#'              [`rt_biogeo_status()`] see section below
#'
#'
#' @inheritSection rt_habitats Habitats
#'
#' @export
#'
#' @importFrom httr GET
rt_habitats_id = function(habitat_id) {

  api_query = GET(rt_base_url(), path = paste0("api/habitats/",
                                               tolower(habitat_id)))

  parse_taxa(api_query)
}
