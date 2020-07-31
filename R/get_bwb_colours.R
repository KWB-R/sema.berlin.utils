# get_bwb_colours --------------------------------------------------------------

#' Get Official BWB Colours
#' 
#' @param full_info if \code{TRUE}, a data frame with columns
#'   \code{approx_name}, \code{red}, \code{green}, \code{blue}, \code{value}
#'   is returned. The column \code{approx_name} contains the "approximate name" 
#'   of the colour, as found by \url{http://chir.ag/projects/name-that-color}).
#'   By default, this argument is set to \code{FALSE} in which case a named 
#'   vector containing only the "#rrggbb" strings is returned. 
#' @param simple if \code{TRUE} (the default) only the main colours with
#'   clear names (blue, green, yellow, orange, red) are returned
#' @param conditions optional. Vector of (four) condition names (best to worst)
#'   to be used as the names of the returned vector of (four) colour codes.
#'   \code{FALSE}.
#' @importFrom kwb.utils resetRowNames noFactorDataFrame
#' @importFrom grDevices rgb
#' @importFrom stats setNames
#' @export
#' @examples
#' # Get a colour vector 
#' get_bwb_colours()
#' 
#' # Plot these colours
#' plot_bwb_colours()
#' 
#' # Check the decimal numbers by setting full_info to TRUE
#' get_bwb_colours(full_info = TRUE)
#' 
get_bwb_colours <- function(full_info = FALSE, simple = TRUE, conditions = NULL)
{
  if (! is.null(conditions)) {
    stopifnot(is.character(conditions), length(conditions) == 4L)
    return(stats::setNames(get_bwb_colours()[-1], conditions))
  }
  
  rgb_components <- list(
    lochmara = c(0, 114, 198),
    wild_willow = c(178, 201, 103),
    atlantis = c(138, 185, 37),
    sunflower = c(233, 224, 39),
    golden_dream = c(238, 199, 34),
    cinnabar = c(226, 54, 66),
    tamarillo = c(170, 25, 35)
  )
  
  colours <- kwb.utils::resetRowNames(kwb.utils::noFactorDataFrame(
    approx_name = names(rgb_components),
    do.call(rbind, rgb_components)
  ))
  
  names(colours)[-1] <- c("red", "green", "blue")
  
  colours$value <- sapply(rgb_components, function(x) {
    grDevices::rgb(x[1], x[2], x[3], maxColorValue = 255)
  })
  
  if (simple) {
    
    assignments <- c(
      blue = "lochmara", green = "atlantis", yellow = "sunflower", 
      orange = "golden_dream", red = "tamarillo"
    )
    
    colours <- colours[colours$approx_name %in% assignments, ]
    colours$name <- names(assignments)
  }
  
  if (full_info) {
    return(colours)
  }
  
  name_column <- ifelse(simple, "name", "approx_name")

  stats::setNames(colours$value, colours[[name_column]])
}

# plot_bwb_colours -------------------------------------------------------------

#' Plot the BWB Colours in a Barplot
#' 
#' @param simple passed to \code{\link{get_bwb_colours}}
#' @export
#' 
plot_bwb_colours <- function(simple = TRUE)
{
  bwb_cols <- get_bwb_colours(simple = simple)
  
  graphics::barplot(
    rep(1, length(bwb_cols)), col = bwb_cols, names.arg = names(bwb_cols),
    axes = FALSE
  )
}
