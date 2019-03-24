#' Retrieve Synonyms associated with a Taxon
#'
#' @param term the beginning of the scientific name of the taxon
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

  if (term == "") stop("`term` is required to autocomplete taxon search")

  api_query = rt_GET("taxa/autocomplete",
                     query = list(term        = term,
                                  territories = territories,
                                  rank        = rank,
                                  domain      = domain,
                                  page        = page,
                                  size        = size))

  parse_taxa(api_query)
}
