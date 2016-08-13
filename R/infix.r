#' Binary Infix Concatenation
#'
#' \describe{
#' \item{\code{\%c\%}:}{binary infix operator for strings.}
#' \item{\code{\% c \%}:}{like \code{\%c\%} but with a space between its
#' inputs.}
#' \item{\code{\%,\%}, \code{\%or\%}, \code{\%and\%}:}{infix versions of
#'       \code{\link{cc}}, \code{\link{cc_or}}, \code{\link{cc_and}}.}
#' }
#' @param x,y Character vectors.
#' @examples
#' v <- "important value"
#' v %c% "!"
#'
#' message("Two" % c % "words")
#' @name infix
NULL

#' @rdname infix
#' @export
`%c%` <- function(x, y) {
  paste0(x, y)
}

#' @rdname infix
#' @export
`% c %` <- function(x, y) {
  paste(x, y)
}

#' @rdname infix
#' @export
`%,%` <- function(x, y) {
  cc(c(x, y))
}

#' @rdname infix
#' @export
`%or%` <- function(x, y) {
  cc_or(c(x, y), oxford = FALSE)
}

#' @rdname infix
#' @export
`%and%` <- function(x, y) {
  cc_and(c(x, y), oxford = FALSE)
}
