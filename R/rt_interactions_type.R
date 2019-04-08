#' Retrieve Interactions Types used in TaxRef
#'
#' If used without argument returns the list of all interactions used in TaxRef.
#'
#' @param interaction_id {`character(1)`, default = `NULL`}\cr{}
#'                  A character identifying the type of interactions
#'
#' @examples
#' rt_interactions_type("PREDATEUR")
#'
#' @export
rt_interactions_type = function(interaction_id = NULL) {

  if (is.null(interaction_id)) {
    api_query = rt_GET("interactions/types/")
  } else {
    api_query = rt_GET("interactions/types/", interaction_id)
  }

  parse_taxa(api_query)
}
