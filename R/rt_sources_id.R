#' Retrieve a source of taxonomic information using its id
#'
#' @param source_id {`integer(1)` \[**required**\]}\cr{}
#'                  an integer giving the id of the source in TAXREF
#' @param bibtex {`logical(1)` \[default = `FALSE`\]}\cr{}
#'               should citation be returned as BibTeX?
#'
#' @examples
#' \dontrun{
#' rt_sources_id(source_id = 160688, bibtex = FALSE)
#' rt_sources_id(source_id = 160688, bibtex = TRUE)
#' }
#'
#' @export
#' @importFrom httr content
rt_sources_id = function(source_id, bibtex = FALSE) {

  check_required_arg(source_id, "retrieve a specific source using its id")

  stopifnot("'source_id' must be a numeric" = is.numeric(source_id))
  stopifnot("'bibtex' must be a logical"    = is.logical(bibtex))

  bib = ""

  if (bibtex) bib = "/transform/application/x-bibtex"

  api_query = rt_GET("sources/", source_id, bib)

  if (!bibtex) {
    parse_taxa(api_query)
  } else {
    content(api_query, type = "text/plain", encoding = "UTF-8")
  }
}
