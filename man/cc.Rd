% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cc.r
\docType{methods}
\name{cc}
\alias{cc}
\alias{cc,data.frame-method}
\alias{cc_and}
\alias{cc_or}
\title{Comma Concatenation}
\usage{
cc(...)

\S4method{cc}{data.frame}(...)

cc_or(..., oxford = FALSE)

cc_and(..., oxford = FALSE)
}
\arguments{
\item{...}{Character vectors or a \code{data.frame}.}

\item{oxford}{Whether to use the Oxford comma.}
}
\value{
A length-one character vector in which each element in \code{...} is
separated by a comma (and a space).
}
\description{
\code{cc} collapses text into a comma-separated list (the colloquial kind of
list). \code{cc_or} and \code{cc_and} insert "\code{or}" and "\code{or}"
before the last element.
}
\details{
The \code{data.frame} method is dispatched when the first argument in
\code{...} is a \code{data.frame}. It operates row-wise. If there are
subsequent arguments to \code{cc} they are be ignored.
}
\examples{
cc("hello", "world")

a <- "one thing"
b <- "another"
cc_or(a, b)

a <- "this"
b <- c("that", "the other")
cc_and(a, b)
}
\seealso{
\code{\link{cn}} for \code{cc} with (grammatical) number awareness
(like \code{ngettext}) and substitution (like \code{sprintf})
}

