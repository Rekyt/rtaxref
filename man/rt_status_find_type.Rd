% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rt_status_find_type.R
\name{rt_status_find_type}
\alias{rt_status_find_type}
\title{Retrieve the status of all Taxa according to a Status Type}
\usage{
rt_status_find_type(status_id = NULL, page = 1, size = 2000)
}
\arguments{
\item{status_id}{{\code{character(1)} [\strong{required}]}\cr{}
The identifier of status (see \code{\link[=rt_status_type]{rt_status_type()}} for the
list of status types)}

\item{page}{{\code{integer(1)} [default = \code{1}]}\cr{}
The page number returned}

\item{size}{{\code{integer(1)} [default = \code{2000}]}\cr{}
The number of lines returned per page (maximum = 2000)}
}
\description{
Retrieve the status of all Taxa according to a Status Type
}
\examples{
\dontrun{
# Find all taxa concerned by Habitat Directive referenced in TAXREF
rt_status_find_type("DH")
}

}
\seealso{
the list of status types \code{\link[=rt_status_type]{rt_status_type()}}
}
