% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_bce_ymd.R
\name{parse_bce_ymd}
\alias{parse_bce_ymd}
\title{Function creates dates before new era}
\usage{
parse_bce_ymd(str)
}
\arguments{
\item{str}{Input string of date that will be transformed to BCE}
}
\description{
There is a problem with transforming negative dates to BCE calendar with as_date
function. This function creates date before BCE when string is passed to function.
}
\examples{
parse_bce_ymd("1991-01-01")

}
