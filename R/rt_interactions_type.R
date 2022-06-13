#' Retrieve Interactions Types used in TAXREF
#'
#' If used without argument returns the list of all interactions used in TAXREF
#'
#' @param interaction_id {`NULL` or `character(1)` \[default = `NULL`\]}\cr{}
#'                  A character identifying the type of interactions
#'
#' @examples
#' \dontrun{rt_interactions_type(interaction_id = "PREDATEUR")}
#'
#' @export
rt_interactions_type = function(interaction_id = NULL) {

  api_query = rt_GET("interactions/types/", toupper(interaction_id))

  parse_taxa(api_query)
}
