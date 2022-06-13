#' Retrieve Taxon Conservation Status
#'
#' @inheritParams rt_taxa_id
#' @param detail {`logical(1)` \[default = `FALSE`\]}\cr{}
#'               Should the table be a long table detailing all the statuses or
#'               a compact table?
#'
#' @examples
#' \dontrun{
#' rt_taxa_status(id = 443800, detail = FALSE)
#' rt_taxa_status(id = 443800, detail = TRUE)
#' }
#' @export
rt_taxa_status = function(id = NULL, detail = FALSE) {

  check_required_arg(id, "retrieve status of a taxon using its id")

  stopifnot("'id' must be a numeric"     = is.numeric(id))
  stopifnot("'detail' must be a logical" = is.logical(detail))

  status_type = "columns"

  if (detail) status_type = "lines"

  api_query = rt_GET("taxa/", id, "/status/", status_type)

  parse_taxa(api_query)
}
