#' Retrieve Taxon Conservation Status
#'
#' @inheritParams rt_taxa_id
#' @param detail {`logical(1)` default = `FALSE`}\cr{}
#'               Should the table be a long table detailing all the statuses or
#'               a compact table?
#'
#' @export
rt_taxa_status = function(id, detail = FALSE) {

  status_type = "columns"

  if (detail) status_type = "lines"

  api_query = GET(rt_base_url(), path = paste0("api/taxa/", id,
                                               "/status/", status_type))

  parse_taxa(api_query)
}
