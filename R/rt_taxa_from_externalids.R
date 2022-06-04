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
#' \dontrun{rt_taxa_from_externalids("TROPICOS", 26600197)}
#' @seealso [`rt_external_db()`] for the list of external databases linked to
#' TAXREF; [`rt_taxa_externalids()`] to get the external ids associated with
#' a taxon in TAXREF
#'
#' @export
rt_taxa_from_externalids = function(external_db = NULL, external_id = NULL) {

  check_required_arg(external_db, "retrieve taxon using external IDs")
  check_required_arg(external_id, "retrieve taxon using external IDs")

  api_query = rt_GET("taxa/findByExternalId",
                     query = list(externalDbId = tolower(external_db),
                                  externalId   = external_id))

  parse_taxa(api_query)
}
