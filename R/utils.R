rt_base_url = function() {
    "https://taxref.mnhn.fr/"
}

#' @importFrom httr content http_error
parse_taxa = function(api_query, cut_names = TRUE) {

  if (http_error(api_query)) {
    stop("The query returned an error. Either TaxRef is down and try later ",
         "or the query is invalid.")
  }

  raw_response = content(api_query, type = "application/json",
                         encoding = "UTF-8", simplifyDataFrame = TRUE,
                         flatten = TRUE)

  if (!("_embedded" %in% names(raw_response))) {
    # If there is a single answer

    not_links = setdiff(names(raw_response), "_links")

    # If there is a single response
    response = as.data.frame(lapply(raw_response[not_links], function(x) {
      ifelse(is.null(x), NA, x)
    }))

  } else {
    # If there are several answers
    response = raw_response[["_embedded"]][[1]]

    # Tidy names
    all_names = colnames(response)

    name_categories = grepl(".", all_names, fixed = TRUE)

    # if there is composed names
    if (any(name_categories)) {
      name_cat = unique(lapply(all_names[name_categories], function(x) {
        strsplit(x, ".", fixed = TRUE)[[1]][1]
      }))

      # If taxon put it in front
      if ("taxon" %in% name_cat) {
        other_names = setdiff(seq_along(all_names), grep("taxon", all_names))

        response = response[, c(grep("taxon", all_names), other_names)]
      }

      if (cut_names) {
        # Delete category from original column names
        colnames(response) = gsub(paste(name_cat, "\\.", sep = "",
                                        collapse = "|"), "", colnames(response))
      }
    }
  }
  return(response)
}
