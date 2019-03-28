#' Retrieve Synonyms associated with a Taxon
#'
#' @param term the beginning of the scientific name of the taxon
#' @param size {`integer(1)`; default = `200`}\cr{}
#'             The number of lines returned per page (maximum = 200)
#' @inheritParams rt_taxa_search
#'
#' @examples
#' \dontrun{
#' rt_taxa_autocomplete(term = "Bradypus")
#' }
#'
#' @export
rt_taxa_autocomplete = function(term = NULL, territories = NULL, rank = NULL,
                                domain = NULL, page = 1, size = 200) {

  check_required_arg(term, "autocomplete taxon search")

  api_query = rt_GET("taxa/autocomplete",
                     query = list(term        = term,
                                  territories = territories,
                                  rank        = rank,
                                  domain      = domain,
                                  page        = page,
                                  size        = size))

  parse_taxa(api_query)
}
