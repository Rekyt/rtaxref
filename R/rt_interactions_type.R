#' Retrieve all Interactions Types
#'
#' @seealso [`rt_interactions_find_type()`] to retrieve all information by
#'          interactions
#'
#' @export
rt_interactions_type = function() {

  api_query = rt_GET("interactions/types/")

  parse_taxa(api_query)
}


#' Retrieve a interactions Types based on its id
#'
#' @param interaction_id {`character(1)`}\cr{}
#'                  A character identifying the type of interactions (see
#'                  [`rt_interactions_type()`] for a list of interactions types)
#'
#' @examples
#' rt_interactions_type_id("PREDATEUR")
#'
#' @seealso see [`rt_interactions_type()`] for a list of interactions types
#'
#' @export
rt_interactions_type_id = function(interaction_id) {

  check_required_arg(interaction_id, paste0("retrieve a specific interaction ",
                                            "type using its id"))

  api_query = rt_GET("interactions/types/", interaction_id)

  parse_taxa(api_query)
}
