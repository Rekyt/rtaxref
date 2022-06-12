#' Search statuses based on a list of criteria
#'
#' @inheritParams rt_taxa_status
#' @param location_id {`character(1)`}\cr{}
#'                    a string identifying a location
#' @param latitude    {`numeric(1)`}\cr{}
#'                    a latitude value
#' @param longitude   {`numeric(1)`}\cr{}
#'                    a longitude value
#' @inheritParams rt_status_opgroup
#'
#' @examples
#' \dontrun{
#' rt_status_search(id = 443800, detail = FALSE)
#' rt_status_search(id = 443800, detail = TRUE)
#' }
#'
#' @export
rt_status_search = function(id = NULL, opgroup_id = NULL, location_id = NULL,
                            latitude = NULL, longitude = NULL, page = 1,
                            size = 2000, detail = FALSE) {

  stopifnot("'id' must be a numeric or NULL" = is.numeric(id) | is.null(id))
  stopifnot("'opgroup_id' must be a numeric or NULL" =
              is.numeric(opgroup_id) | is.null(opgroup_id))
  stopifnot("'location_id' must be a character or NULL" =
              is.character(location_id) | is.null(location_id))
  stopifnot("'longitude' must be a numeric or NULL" =
              is.numeric(longitude) | is.null(longitude))
  stopifnot("'latitude' must be a numeric or NULL" =
              is.numeric(latitude) | is.null(latitude))
  stopifnot("'page' must be a numeric" = is.numeric(page))
  stopifnot("'size' must be a numeric" = is.numeric(size))

  status_type = "columns"

  if (detail) status_type = "lines"

  api_query = rt_GET("/status/search/", status_type,
                     query = list(taxrefId           = id,
                                  operationalGroupId = opgroup_id,
                                  locationId         = location_id,
                                  latitude           = latitude,
                                  longitude          = longitude,
                                  page               = page,
                                  size               = size))

  parse_taxa(api_query)
}
