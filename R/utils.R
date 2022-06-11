rt_base_url = function() {
    "https://taxref.mnhn.fr/"
}

#' rtaxref User Agent
#'
#' @noRd
rt_ua <- function() {
  paste0("http://github.com/Rekyt/rtaxref R package rtaxref/",
         utils::packageVersion("rtaxref"))
}

#' @importFrom httr GET status_code add_headers
rt_GET <- function(..., query = NULL) {
  if(!is.null(query)) {
    query <- rt_flatten_query(query)
  }

  GET(rt_base_url(), config = add_headers("user-agent" = rt_ua()),
      path = paste0("api/", ...), query = query)
}

#' Flatten query
#'
#' Flatten a query, meaning that when an argument of the query is an array
#' the function gives back a list with as many elements in the array named the
#' same.
#'
#' @param query {`list(1)`}\cr{}
#'              a list that represents the query argument from `rt_GET()`
#'
#' @noRd
rt_flatten_query <- function(query) {
  flat_query <- lapply(names(query), function(el) {
    trans_list <- as.list(query[[el]])
    names(trans_list) <- rep(el, length(query[[el]]))
    return(trans_list)
  })

  unlist(flat_query, recursive = FALSE)
}



#' Simple Check
#'
#' Check that argument is not null nor equal to ""
#'
#' @param arg actual variable\cr{}
#'            give the variable to be used and checked
#' @param stop_message {`character(1)`}\cr{}
#'                     The `stop()` message to display explaining why this
#'                     argument is needed
#' @noRd
check_required_arg = function(arg, stop_message) {
  if (is.null(arg) | (length(arg) != 0 && arg == "")) {
    stop("'", substitute(arg), "' argument is needed to ", stop_message,
         call. = FALSE)
  }
}

check_arg_in_list = function(arg, list, with_null = TRUE) {
  if (
    ((isFALSE(arg %in% list) | is.null(arg)) & isFALSE(with_null)) |
    (isTRUE(with_null) & !is.null(arg) & isFALSE(arg %in% list))
  ) {
    stop(
      "'", substitute(arg), "' argument should be in '",
      paste(list, collapse = ", "), "'", ifelse(with_null, " or NULL", "")
    )
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

    stop("TAXREF is down. Please try again later.", call. = FALSE)

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

  tibble::as_tibble(response, .name_repair = "universal")
}
