#' Retrieve Taxon ID from partially matching its Name
#'
#' @param term {`character(1)` \[**required**\]}\cr{}
#'             the beginning of the scientific name of the searched taxa
#' @param size {`integer(1)` \[default = `200`]}\cr{}
#'             The number of lines returned per page (maximum = 200)
#' @inheritParams rt_taxa_search
#'
#' @examples
#' \dontrun{
#' rt_taxa_autocomplete(term = "Bradypus")
#' }
#'
#' @seealso the list of taxonomic ranks avaible through [rt_taxo_ranks()]
#'
#' @export
rt_taxa_autocomplete = function(term = NULL, territories = NULL, rank = NULL,
                                domain = NULL, page = 1, size = 200) {

  check_required_arg(term, "autocomplete taxon search")

  stopifnot("'term' must be a character" = is.character(term))
  stopifnot("'territories' must be a character or NULL" =
              is.character(territories) | is.null(territories))
  stopifnot("'rank' must be a character or NULL" =
              is.character(rank) | is.null(rank))
  stopifnot("'domain' must be a character or NULL" =
              is.character(domain) | is.null(domain))
  stopifnot("'page' must be a numeric"       = is.numeric(page))
  stopifnot("'size' must be a numeric"       = is.numeric(size))

  api_query = rt_GET("taxa/autocomplete",
                     query = list(term        = term,
                                  territories = territories,
                                  rank        = rank,
                                  domain      = domain,
                                  page        = page,
                                  size        = size))

  parse_taxa(api_query)
}
