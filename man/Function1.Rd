% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Function1.R
\name{Function1}
\alias{Function1}
\title{Summary Statistics}
\usage{
Function1(data, category, values)
}
\arguments{
\item{data}{The data frame used to run summary statistics.}

\item{category}{The category that the data is sorted by for further statistic calculations.}

\item{values}{The quantitative numerical data values used to run statistics}
}
\value{
A tibble with the summary statistic information: minimum, maximum, and mean.
}
\description{
This function outputs minimum, maximum, and mean summary statistics for quantitative measurements for defined categories in the data set.
}
