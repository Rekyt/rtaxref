#' Search statuses based on a list of criteria
#'
#' @inheritParams rt_taxa_status
#' @inheritParams rt_operational_groups_id
#' @param location_id {`character(1)`}\cr{}
#'                    a string identifying a location
#' @param latitude    {`numeric(1)`}\cr{}
#'                    a latitude value
#' @param longitude   {`numeric(1)`}\cr{}
#'                    a longitude value
#' @inheritParams rt_taxa_search
#'
#' @examples
#' \dontrun{
#' #' rt_status_search(id = 443800, detail = FALSE)
#' rt_status_search(id = 443800, detail = TRUE)
#' }
#'
#' @export
rt_status_search = function(id = NULL, opgroup_id = NULL, location_id = NULL,
                            latitude = NULL, longitude = NULL, page = 1,
                            size = 2000, detail = FALSE) {

  status_type = "columns"

  if (detail) status_type = "lines"

  api_query = rt_GET(paste0("/status/search/", status_type),
                     query = list(taxrefId           = id,
                                  operationalGroupId = opgroup_id,
                                  locationId         = location_id,
                                  latitude           = latitude,
                                  longitude          = longitude,
                                  page               = page,
                                  size               = size))

  parse_taxa(api_query)
}
