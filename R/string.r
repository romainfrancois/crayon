
#' Convert to character
#'
#' This function just calls \code{as.character}, but it is
#' easier to type and read.
#'
#' @param x Object to be coerced.
#' @param ... Further arguments to pass to \code{as.character}.
#' @return Character value.
#'
#' @export

chr <- function(x, ...) as.character(x, ...)

#' Concatenate character vectors
#'
#' The length of the two arguments must match, or
#' one of them must be of length one. If the length of
#' one argument is one, then the output's length will
#' match the length of the other argument. See examples
#' below.
#'
#' @param lhs Left hand side, character vector.
#' @param rhs Right hand side, character vector.
#' @return Concatenated vectors.
#'
#' @name concat
#' @export
#'
#' @examples
#' "foo" %+% "bar"
#'
#' letters[1:10] %+% chr(1:10)
#'
#' letters[1:10] %+% "-" %+% chr(1:10)
#'
#' ## This is empty (unlike for parse)
#' character() %+% "*"

`%+%` <- function(lhs, rhs) {

  stopifnot(is.character(lhs), is.character(rhs))
  stopifnot(length(lhs) == length(rhs) || length(lhs) == 1 || length(rhs) == 1)

  if (length(lhs) == 0 && length(rhs) == 0) {
    paste0(lhs, rhs)

  } else if (length(lhs) == 0) {
    lhs

  } else if (length(rhs) == 0) {
    rhs

  } else {
    paste0(lhs, rhs)
  }
}
