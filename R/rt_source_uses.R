#' Retrieve the list of source uses in TaxRef
#'
#' TaxRef references many publications across its documentation. The different
#' sources are used for different reasons this function returns the list of
#' usages for a source.
#'
#' @export
rt_source_uses = function() {

  api_query = rt_GET("sourceUses")

  parse_taxa(api_query)
}

#' Retrieve a source use in TaxRef
#'
#' @param usage_id {`numeric(1)`}\cr{}
#'                 the id of a source use in TaxRef see
#'                 [`rt_source_uses()`]
#'
#' @examples
#' rt_source_uses_id(usage_id = 11)
#'
#' @export
rt_source_uses_id = function(usage_id) {

  api_query = rt_GET("sourceUses/", usage_id)

  parse_taxa(api_query)
}
