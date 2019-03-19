rt_base_url = function() {
    "https://taxref.mnhn.fr/"
}

#' @importFrom httr content
parse_taxa = function(api_query) {

  raw_response = content(api_query, type = "application/json",
                         encoding = "UTF-8")

  if (!("_embedded" %in% names(raw_response))) {

    not_links = setdiff(names(raw_response), "_links")

    # If there is a single response
    response = list(lapply(raw_response[not_links], function(x) {
      ifelse(is.null(x), NA, x)
    }))
  } else {
    response = lapply(raw_response[["_embedded"]][[1]], function(x) {

      not_links = setdiff(names(x), "_links")

      lapply(x[not_links], function(y) ifelse(is.null(y), NA, y))
    })
  }

  do.call(rbind, lapply(response, as.data.frame))
}
