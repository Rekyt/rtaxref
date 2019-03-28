rt_base_url = function() {
    "https://taxref.mnhn.fr/"
}

#' @importFrom httr GET status_code
rt_GET = function(..., query = NULL) {
  GET(rt_base_url(), path = paste0("api/", ...), query = query)
}

check_required_arg = function(arg, stop_message) {
  if (arg == "" | is.null(arg)) {
    stop("'", substitute(arg), "' argument is needed to ", stop_message,
         call. = FALSE)
  }
}

#' @importFrom httr content http_error http_status status_code
parse_taxa = function(api_query, cut_names = TRUE) {

  reason = http_status(api_query)$reason

  if (status_code(api_query) == 400 & reason == "Bad Request") {

    stop("The query is invalid. Please try another query.", call. = FALSE)

  } else if (status_code(api_query) == 404 & reason == "Not Found"){

    stop("The query returned no results. Please try another query",
         call. = FALSE)

  } else if (http_error(api_query)) {

    stop("TaxRef is down. Please try again later.", call. = FALSE)

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

  if (identical(dim(response), c(0L, 0L))) {
    stop("The query returned no results. Please try another query",
         call. = FALSE)
  }

  tibble::as_tibble(response)
}
