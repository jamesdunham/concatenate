#' concatenate: Comma Concatenation
#'
#' Each simple function in concatenate returns a comma-separated string. (A
#' length-one character vector.) These functions help avoid repetitive code,
#' especially when producing human-friendly messages whose elements aren't known
#' in advance.
#' 
#' The workhorse function is \code{\link{cc}}. \code{\link{cn}} combines it with
#' grammatical number awareness, as in \code{\link{ngettext}}, and
#' \code{\link{sprintf}}-like substitution.
#'
#' @docType package
#' @name concatenate
NULL
