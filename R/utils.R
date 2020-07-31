# almost_equal -----------------------------------------------------------------
almost_equal <- function(x, y, tolerance = 1e-6)
{
  abs(x - y) < tolerance
}

# round_up ---------------------------------------------------------------------
round_up <- function(x, num) {
  num * ceiling(x / num)
}

# round_down -------------------------------------------------------------------
round_down <- function(x, num) {
  num * floor(x / num)
}

# read_csv ----------------------------------------------------------------

#' read csv file, e.g. variable rehab strategy or simulation results to compare
#'
#' @param file path to csv file
#' @param dec decima semperator
#'

read_csv <- function(file = NULL, dec)
{
  if (! is.null(file)) {
    utils::read.table(file, header = TRUE, sep = ";", dec = dec)  
  }
}

# write_csv --------------------------------------------------------------------

#' write csv file, e.g. simulation result table
#'
#' @param data dataframe to be written
#' @param outdir directory to save data
#' @param filename filename to save data
#' @param dec decima semperator
#'
write_csv <- function(data, outdir, filename, dec) {
  utils::write.table(
    data, file.path(outdir, filename),
    quote = FALSE, row.names = FALSE, col.names = TRUE, sep = ";", dec = dec
  )
}

# unique_sort_char -------------------------------------------------------------
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
  
  result <- kwb.utils::multiSubstitute(x, replacements = list(
    "<ae>" = "\xE4",
    "<ue>" = "\xFC",
    "<UE>" = "\xDC",
    "<oe>" = "\xF6",
    "<sz>" = "\xDF",
    "<euro>" = "\xAC",
    "<nbsp>" = "\xA0"
  ))
  
  #browser(expr = getOption("sema.berlin.app.debug", FALSE))  
  
  result
}

# str_remove_all ---------------------------------------------------------------
str_remove_all <- function(x, pattern) {
  #stringr::str_remove_all(x, pattern = pattern)
  gsub(pattern, "", x)
}
