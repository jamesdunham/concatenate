#' concatenate: Comma Concatenation
#'
#' Each of the simple functions in concatenate takes one or more character
#' vectors and returns a comma-separated string. (A length-one character
#' vector.)
#'
#' These functions help avoid repetitive code when producing human-friendly
#' messages whose elements aren't known in advance.
#'
#' Four main functions: `\link{cc}`, `\link{cc_or}`, `\link{cc_and}`, and
#' `\link{\%+\%}`.
#' 
#' @docType package
#' @name concatenate
#' @examples
#' cc(LETTERS[1:3])
#'
#' cc_and(LETTERS[1:2], LETTERS[3:4], LETTERS[5:6])
NULL
