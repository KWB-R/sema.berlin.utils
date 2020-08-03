# matrix_to_data_frame ---------------------------------------------------------

#' Convert a Matrix to a Data Frame
#'
#' @param x matrix
#' @param name_row name to be given to the data frame column containing the
#'   row "coordinates". Default: \code{row}
#' @param name_column name to be given to the data frame column containing the
#'   column "coordinates". Default: \code{column}
#' @param name_value name to be given to the data frame column containing the
#'   matrix values. Default: \code{value}
#' @return data frame with three columns: 1. row "coordinate", 2. column
#'   "coordinate", 3. value
#' @importFrom kwb.utils stopIfNotMatrix
#' @export
#' @examples
#' matrix_to_data_frame(matrix(1:12, nrow = 3, dimnames = list(1:3, 1:4)))
#'
matrix_to_data_frame <- function(
  x, name_row = "row", name_column = "column", name_value = "value"
)
{
  kwb.utils::stopIfNotMatrix(x)

  # Prepare list of arguments to data.frame()
  args <- list()
  args[[name_column]] <- rep(colnames(x), each = nrow(x))
  args[[name_row]] <- rownames(x)
  args[[name_value]] <- `attributes<-`(x, NULL) # remove attributes

  do.call(data.frame, c(args, list(stringsAsFactors = FALSE)))
}
