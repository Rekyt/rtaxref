#' Retrieve Taxon using the ids from external databases
#'
#' @param external_db {`character(1)`}\cr{}
#'                    The name of an external database see [`rt_external_db()`]
#'                    for the list of external database names
#' @param external_id {`character(1)`}\cr{}
#'                    The identifier of the taxon in the specified external
#'                    database
#'
#' @examples
#' rt_taxa_from_externalids("TROPICOS", 26600197)

#' @seealso [`rt_external_db()`] for the list of external databases linked to
#' TaxRef; [`rt_taxa_externalids()`] to get the external ids associated with
#' a taxon in TaxRef
#'
#' @export
rt_taxa_from_externalids = function(external_db = NULL, external_id = NULL) {

  if (is.null(external_db) | external_db == "" | is.null(external_id) |
      external_id == "") {
    stop("Both the ID of the external database and the ID of the taxon in this",
         " external database are needed")
  }

  api_query = rt_GET("taxa/findByExternalId",
                     query = list(externalDbId = tolower(external_db),
                                  externalId   = external_id))

  parse_taxa(api_query)
}
