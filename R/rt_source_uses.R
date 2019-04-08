#' Retrieve the list of source uses in TaxRef
#'
#' TaxRef references many publications across its documentation. The different
#' sources are used for different reasons this function returns the list of
#' usages for a source when no arguments are provided, otherwise returns the
#' specific type of use.
#'
#' @param usage_id {`numeric(1)`, default = `NULL`}\cr{}
#'                 the id of a source use in TaxRef
#'
#' @examples
#' rt_source_uses(276)
#'
#' @export
rt_source_uses = function(usage_id = NULL) {

  if (is.null(usage_id)) {
    api_query = rt_GET("sourceUses")
  } else {
    api_query = rt_GET("sourceUses/", usage_id)
  }

  parse_taxa(api_query)
}
