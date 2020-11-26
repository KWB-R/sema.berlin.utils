# almost_equal -----------------------------------------------------------------

#' Compare Two Values Allowing a Tolerance
#'
#' @param x vector of numeric
#' @param y vector of numeric
#' @param tolerance tolerance, default: \code{1e-6}
#' @return vector of logical
#' @export
#'
almost_equal <- function(x, y, tolerance = 1e-6)
{
  abs(x - y) < tolerance
}

# format_comma -----------------------------------------------------------------

#' turn decimal number into string with comma
#'
#' @param x numeric vector
#' @param nsmall number of digits to show
#' @param ... others
#' @export
#'
format_comma <- function(x, nsmall = 0, ...) {
  not_na <- ! is.na(x)
  x[not_na] <- format(x[not_na], decimal.mark = ",", nsmall = nsmall, ...)
  x
}

# read_csv ----------------------------------------------------------------

#' read csv file, e.g. variable rehab strategy or simulation results to compare
#'
#' @param file path to csv file
#' @param dec decimal separator
#' @export
#'
read_csv <- function(file = NULL, dec)
{
  if (! is.null(file)) {
    utils::read.table(file, header = TRUE, sep = ";", dec = dec)
  }
}

# str_remove_all ---------------------------------------------------------------

#' Remove All Substrings Matching the Pattern
#'
#' @param x vector of character
#' @param pattern regular expression agains which the strings in \code{x} are
#'   matched
#' @return \code{x} with elements in which substrings matching the
#'   \code{pattern} are removed
#' @export
#'
str_remove_all <- function(x, pattern) {
  #stringr::str_remove_all(x, pattern = pattern)
  gsub(pattern, "", x)
}

# translate_data ---------------------------------------------------------------

#' Translate column names and categorical data
#'
#' @param df data to be translated
#' @param translation_list list of names to be translated in format
#'   `list(oldname1 = "newname1", oldname2 = "newname2", ...)`
#' @export
#'
translate_data <- function(df, translation_list) {

  #browser(expr = getOption("sema.berlin.app.debug", FALSE))

  # translation of column names. Don't use tibbles to make multiSubstitute work
  df <- kwb.utils::renameColumns(as.data.frame(df), translation_list)

  # check which columns are factors
  is_factor <- sapply(df, is.factor)

  # rename levels of factor columns (maintaining level order)
  df[is_factor] <- lapply(df[is_factor], function(x) {
    `levels<-`(x, kwb.utils::multiSubstitute(levels(x), translation_list))
  })

  # check which columns are character vectors
  is_character <- sapply(df, is.character)

  # rename values of character columns
  df[is_character] <- lapply(df[is_character], function(x) {
    as.factor(kwb.utils::multiSubstitute(x, translation_list))
  })

  df
}

# unique_sort_char -------------------------------------------------------------

#' Sorted Unique Character Values
#'
#' @param x vector of objects that can be converted to a vector of character
#'   with \code{as.character}
#' @export
#'
unique_sort_char <- function(x) {
  sort(unique(as.character(x)))
}

# use_spec_chars ---------------------------------------------------------------

#' Replace Placeholders with Special Characters
#'
#' @param x vector of character
#' @export
#'
use_spec_chars <- function(x) {

  # For the code of the EUR character, <euro>, see
  # https://www.gerd-riesselmann.net/webentwicklung/
  #   utf-8-latin1-aka-iso-8859-1-und-das-euro-zeichen/
  replacements <- list(
    "<ae>" = "\xE4",
    "<ue>" = "\xFC",
    "<UE>" = "\xDC",
    "<oe>" = "\xF6",
    "<sz>" = "\xDF",
    "<euro>" = "\x80",
    "<nbsp>" = "\xA0"
  )

  result <- kwb.utils::multiSubstitute(x, replacements)

  #browser(expr = getOption("sema.berlin.app.debug", FALSE))

  result
}

# write_csv --------------------------------------------------------------------

#' write csv file, e.g. simulation result table
#'
#' @param data dataframe to be written
#' @param outdir directory to save data
#' @param filename filename to save data
#' @param dec decimal separator
#' @export
#'
write_csv <- function(data, outdir, filename, dec) {
  utils::write.table(
    data, file.path(outdir, filename),
    quote = FALSE, row.names = FALSE, col.names = TRUE, sep = ";", dec = dec
  )
}
