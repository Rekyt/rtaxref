rt_base_url = function() {
    "https://taxref.mnhn.fr/"
}

parse_taxa = function(api_query) {

  raw_response = content(api_query, type = "application/json",
                         encoding = "UTF-8")

  response = lapply(raw_response[1:45], function(x) ifelse(is.null(x), NA, x))

  as.data.frame(response)
}
