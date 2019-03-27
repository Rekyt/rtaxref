#' Retrieve the status of all Taxa according to a Status Type
#'
#' @param interaction_id {`character(1)`}\cr{}
#'                  The identifier of status (see [`rt_interactions_type()`] for
#'                  the list of status types)
#' @inheritParams rt_taxa_search
#'
#' @examples
#' rt_interactions_find_type(interaction_id = "GALLES")
#'
#' @seealso the list of status types [`rt_interactions_type()`]
#' @export
rt_interactions_find_type = function(interaction_id = NULL, page = 1,
                                     size = 2000) {

  api_query = rt_GET("interactions/findByType/", interaction_id,
                     query = list(page = page,
                                  size = size))

  parse_taxa(api_query, FALSE)
}