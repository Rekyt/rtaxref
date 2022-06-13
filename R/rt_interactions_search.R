#' Search Interactions based on a list of criteria
#'
#'
#' @param size {`integer(1)` \[default = `2000`\]}\cr{}
#'             The number of lines returned per page (maximum = 2000)
#'
#' @inheritParams rt_interactions_type
#' @inheritParams rt_taxa_search
#' @inheritParams rt_operational_groups
#'
#' @examples
#' \dontrun{
#' # Interactors with 'Ophrys apifera' (id = 110335)
#' rt_interactions_search(id = 110335)
#' }
#'
#' @seealso the list of interaction type [rt_interactions_type()] and
#'          the list of operational groups [rt_operational_groups()]
#'
#' @export
rt_interactions_search = function(id = NULL, interaction_id = NULL,
                                  opgroup_id = NULL, page = 1, size = 2000) {

  stopifnot("'id' must be a numeric"             = is.numeric(id) | is.null(id))
  stopifnot("'interaction_id' must be a character" =
              is.character(interaction_id) | is.null(interaction_id))
  stopifnot("'opgroup_id' must be a numeric"     = is.numeric(opgroup_id) |
              is.null(opgroup_id))
  stopifnot("'page' must be a numeric"           = is.numeric(page))
  stopifnot("'size' must be a numeric"           = is.numeric(size))

  api_query = rt_GET("interactions/search/",
                     query = list(taxrefId           = id,
                                  interactionTypeId  = interaction_id,
                                  operationalGroupId = opgroup_id,
                                  page               = page,
                                  size               = size))

  parse_taxa(api_query, FALSE)
}
