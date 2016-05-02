#' Comma Concatenation
#'
#' `cc` collapses text into a comma-separated list (the colloquial kind of
#' list).
#' @param ... Character vectors.
#' @return A length-one character vector in which each element in `...` is
#' separated by a comma (and a space).
#' @seealso `\link{cc_or}` `\link{cc_and}`
#' @examples
#' cc(LETTERS[1:11])
#' # [1] "A, B, C, D, E, F, G, H, I, J, K"
#'
#' @export
cc <- function(...) {
  s <- unlist(list(...))
  s <- trimws(s)
  paste(s, sep = ", ", collapse = ", ")
}

#' Comma Concatenation with a Penultimate "or"
#'
#' `cc_or` collapses text into a comma-separated list inserting`"or"` before the
#' last element of text. 
#' @inheritParams cc
#' @param oxford Whether to use the Oxford comma.
#' @export
#' @seealso `\link{cc}` `\link{cc_and}`
#' @examples
#' a <- "one thing"
#' b <- "another"
#' message("likely reason: ", cc_or(a, b))
cc_or <- function(..., oxford = FALSE) {
  x = unlist(list(...))
  res <- cc(x[-length(x)])
  comma <- ifelse(isTRUE(oxford) && length(x) > 2, ",", "")
  or <- ifelse(length(x) > 1L, " or ", "")
  paste0(res, comma, or, x[length(x)])
}

#' Comma Concatenation with a Penultimate "and"
#'
#' `cc_and` collapses text into a comma-separated list inserting`"and"` before
#' the last element of text. 
#' @seealso `\link{cc}` `\link{cc_or}`
#' @inheritParams cc_or
#' @export
cc_and <- function(..., oxford = FALSE) {
  x = unlist(list(...))
  res <- cc(x[-length(x)])
  comma <- ifelse(isTRUE(oxford) && length(x) > 2, ",", "")
  and <- ifelse(length(x) > 1L, " and ", "")
  paste0(res, comma, and, x[length(x)])
}

#' Binary Concatenation
#'
#' `%+%` is a binary `paste` like Python's `+` for strings. 
#' @param x,y Character vector.
#' @export
#' @examples
#' v <- "important value"
#' v %+% "!"
`%+%` <- function(x, y) {
  paste0(x, y)
}

#' Binary Concatenation
#'
#' `% + %` is like `%+%` but inserts a space between its inputs.
#' @inheritParams %+%
#' @export
#' @examples
#' message("Two" % + % "words")
`% + %` <- function(x, y) {
  paste(x, y)
}

#' @rdname cc 
#' @inheritParams %+%
#' @export
`%,%` <- function(x, y) {
  cc(c(x, y))
}

#' @rdname cc_or
#' @inheritParams %+%
#' @export
`%or%` <- function(x, y) {
  cc_or(c(x, y), oxford = FALSE)
}

#' @rdname cc_and
#' @inheritParams %+%
#' @export
`%and%` <- function(x, y) {
  cc_and(c(x, y), oxford = FALSE)
}
