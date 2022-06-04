#' Retrieve the list of source uses in TAXREF
#'
#' TAXREF references many publications across its documentation. The different
#' sources are used for different reasons. This function returns the list of
#' usages for a source when no arguments are provided, otherwise returns the
#' specific type of use.
#'
#' @param usage_id {`numeric(1)`, default = `NULL`}\cr{}
#'                 the id of a source use in TAXREF
#'
#' @examples
#' \dontrun{rt_source_uses(usage_id = 276)}
#'
#' @export
rt_source_uses = function(usage_id = NULL) {

  api_query = rt_GET("sourceUses/", usage_id)

  parse_taxa(api_query)
}
