#' Get factsheet for taxa
#'
#' For some taxa, a factsheet has been written. This text, often in French,
#' describes the general ecology and some diagnosis of the submitted taxon.
#'
#' Beware, many taxa have no corresponding factsheet.
#'
#' @inheritParams rt_taxa_id
#'
#' @examples
#' \dontrun{rt_taxa_factsheet(4540)}
#'
#' @export
rt_taxa_factsheet = function(id) {
  api_query = rt_GET("taxa/", id, "/factsheet")

  parse_taxa(api_query)
}
