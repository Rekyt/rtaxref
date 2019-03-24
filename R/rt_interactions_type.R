#' Retrieve all Interactions Types
#'
#' @seealso [`rt_interactions_find_type()`] to retrieve all information by
#'          interactions
#'
#' @export
#'
#' @importFrom httr GET
rt_interactions_type = function() {

  api_query = GET(rt_base_url(), path = "api/interactions/types/")

  parse_taxa(api_query)
}


#' Retrieve a interactions Types based on its id
#'
#' @param interaction_id {`character(1)`}\cr{}
#'                  A character identifying the type of interactions (see
#'                  [`rt_interactions_type()`] for a list of interactions types)
#'
#' @seealso see [`rt_interactions_type()`] for a list of interactions types
#' @examples
#' rt_interactions_type_id("PREDATEUR")
#' @export
#'
#' @importFrom httr GET
rt_interactions_type_id = function(interaction_id) {

  api_query = rt_GET(paste0("interactions/types/", interaction_id))

  parse_taxa(api_query)
}
