rt_base_url = function() {
    "https://taxref.mnhn.fr/"
}

#' @importFrom httr content
parse_taxa = function(api_query) {

  raw_response = content(api_query, type = "application/json",
                         encoding = "UTF-8")

  if (!("_embedded" %in% names(raw_response))) {
    # If there is a single response
    response = list(lapply(raw_response[1:45], function(x) {
      ifelse(is.null(x), NA, x)
    }))
  } else {
    response = lapply(raw_response[["_embedded"]][["taxa"]], function(x) {
      lapply(x[1:45], function(y) ifelse(is.null(y), NA, y))
    })
  }

  do.call(rbind, lapply(response, as.data.frame))
}
