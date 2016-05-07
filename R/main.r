#' Comma Concatenation
#'
#' \code{cc} collapses text into a comma-separated list (the colloquial kind of
#' list). \code{cc_or} and \code{cc_and} insert "\code{or}" and "\code{or}"
#' before the last element.
#'
#' The \code{data.frame} method is dispatched when the first argument in
#' \code{...} is a \code{data.frame}. It operates row-wise. If there are
#' subsequent arguments to \code{cc} they are be ignored.
#' @param ... Character vectors or a \code{data.frame}.
#' @param oxford Whether to use the Oxford comma.
#' @return A length-one character vector in which each element in \code{...} is
#' separated by a comma (and a space).
#' @seealso \code{\link{cn}} for \code{cc} with (grammatical) number awareness
#' (like \code{ngettext}) and substitution (like \code{sprintf})
#' @examples
#' cc("hello", "world")
#'
#' a <- "one thing"
#' b <- "another"
#' cc_or(a, b)
#'
#' a <- "this"
#' b <- c("that", "the other")
#' cc_and(a, b)
#' @name cc
NULL

#' @rdname cc
#' @export
cc <- function(...) {
  s <- unlist(list(...))
  s <- trimws(s)
  paste(s, sep = ", ", collapse = ", ")
}

setGeneric("cc", signature = "...",
           function(...) standardGeneric("cc"))

#' @rdname cc
#' @export
setMethod("cc", "data.frame",
          function(...) {
            DF <- apply(list(...)[[1]], 1, cc)
            cc(DF)
          })

#' @rdname cc
#' @export
cc_or <- function(..., oxford = FALSE) {
  x = unlist(list(...))
  res <- cc(x[-length(x)])
  comma <- ifelse(isTRUE(oxford) && length(x) > 2, ",", "")
  or <- ifelse(length(x) > 1L, " or ", "")
  paste0(res, comma, or, x[length(x)])
}

#' @rdname cc
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
#' \code{\%+\%} is a binary \code{paste} like Python's \code{+} for strings.
#' \code{\% + \%}: inserts a space between its inputs.  \code{\%,\%},
#' \code{\%or\%} and \code{\%and\%} are binary versions of \code{\link{cc}},
#' \code{\link{cc_or}}, and \code{\link{cc_and}}.
#' @param x,y Character vectors.
#' @examples
#' v <- "important value"
#' v %+% "!"
#'
#' message("Two" % + % "words")
#' @name grapes-plus-grapes
NULL

#' @rdname grapes-plus-grapes
#' @export
`%+%` <- function(x, y) {
  paste0(x, y)
}

#' @rdname grapes-plus-grapes
#' @export
`% + %` <- function(x, y) {
  paste(x, y)
}

#' @rdname grapes-plus-grapes
#' @export
`%,%` <- function(x, y) {
  cc(c(x, y))
}

#' @rdname grapes-plus-grapes
#' @export
`%or%` <- function(x, y) {
  cc_or(c(x, y), oxford = FALSE)
}

#' @rdname grapes-plus-grapes
#' @export
`%and%` <- function(x, y) {
  cc_and(c(x, y), oxford = FALSE)
}

cn_ <- function(FUN, n, object, singular, plural, ...) {
  msg <- ifelse(n == 1, singular, plural)
  msg <- gsub("%c", FUN(object), msg, fixed = TRUE)
  msg <- gsub("%n", n, msg, fixed = TRUE)
  msg
}

#' Number-aware Strings with Substitution
#'
#' \code{cn} combines grammatical number awareness as in \code{\link{ngettext}}
#' with \code{\link{sprintf}}-like substitution for comma-concatenated text.
#'
#' Like \code{ngettext}, this function returns one string to be used with a
#' singular referent and another with a plural referent. \code{cn} chooses
#' between the two based on the length of its first argument, \code{object}, or
#' if \code{object} is a \code{data.frame}, its row count.
#'
#' Two substitions are made \code{sprintf}-style. "\code{\%n}" is replaced with
#' the number of \code{object}, and "\code{\%c}" is replaced with the
#' comma-concatenated values of \code{object}, as in \code{\link{cc}}.
#'
#' \code{cn_and} uses \code{\link{cc_and}} instead of \code{cc}; \code{cn_or}
#' uses \code{\link{cc_or}}.
#'
#' @param object An n-vector, or \code{data.frame} with n rows.
#' @param singular The string to return if n = 1.
#' @param plural The string to return if n is in 0, 2, 3, 4, ...
#' @seealso \link{cc}
#' @name cn
NULL

#' @rdname cn
#' @export
cn <- function(object, singular, plural = singular) {
  cn_(cc, length(object), object, singular, plural)
}

#' @rdname cn
#' @export
cn_and <- function(object, singular, plural = singular) {
  cn_(cc_and, length(object), object, singular, plural)
}

#' @rdname cn
#' @export
cn_or <- function(object, singular, plural = singular) {
  cn_(cc_or, length(object), object, singular, plural)
}

setGeneric("cn", signature = "object",
           function(object, singular, plural = singular)standardGeneric("cn"))

#' @rdname cn
#' @inheritParams cn
#' @import methods
#' @export
setMethod("cn", "data.frame",
          function(object, singular, plural = singular) {
            cn_(cc, nrow(object), object, singular, plural)
})
