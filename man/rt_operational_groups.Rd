% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rt_operational_groups.R
\name{rt_operational_groups}
\alias{rt_operational_groups}
\title{Retrieve operational groups used in TAXREF}
\usage{
rt_operational_groups(opgroup_id = NULL)
}
\arguments{
\item{opgroup_id}{{\code{NULL} or \code{numeric(1)} [default = \code{NULL}]}\cr{}
the id of an operational group referenced in TAXREF}
}
\description{
Operational Groups are names of groups either taxonomic or vernacular
used across TAXREF in French. If used without argument returns the list of
all operational groups used in TAXREF.
}
\examples{
\dontrun{rt_operational_groups(opgroup_id = 143)}
}
