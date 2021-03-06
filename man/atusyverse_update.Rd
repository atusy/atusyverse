% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/verse.R
\name{atusyverse_update}
\alias{atusyverse_update}
\title{Update atusyverse packages}
\usage{
atusyverse_update(recursive = FALSE)
}
\arguments{
\item{recursive}{If \code{TRUE}, will also check all dependencies of
atusyverse packages.}
}
\description{
This will check to see if all atusyverse packages (and optionally, their
dependencies) are up-to-date, and will install after an interactive
confirmation.
}
\examples{
\dontrun{
atusyverse_update()
}
}
