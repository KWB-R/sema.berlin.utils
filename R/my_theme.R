# my_theme ---------------------------------------------------------------------

#' turn decimal number into string with comma
#'
#' @param ... others arguments passed to 'ggplot2::theme()'
#' @export
#'
my_theme <- function(...) {
  
  (ggplot2::theme_classic() +
     ggplot2::theme(
       axis.text = ggplot2::element_text(
         colour = "black",
         size = 11,
         angle = 0,
         vjust = 0.5,
         margin = ggplot2::margin(t = 5, unit = "pt")
       ),
       axis.title.y = ggplot2::element_text(
         colour = "black",
         size = 11,
         margin = ggplot2::margin(r = 10, unit = "pt")
       ),
       legend.text = ggplot2::element_text(size = 11),
       #legend.title = ggplot2::element_blank(),
       legend.background = ggplot2::element_blank(),
       legend.key = ggplot2::element_blank(),
       legend.spacing.x = ggplot2::unit(10, "pt"),
       axis.ticks.length = ggplot2::unit(5, "pt"),
       strip.background = ggplot2::element_blank(),
       strip.text.x = ggplot2::element_text(
         size = 11, hjust = 0, face = "italic", 
         margin = ggplot2::margin(t = 10, b = 7,  unit = "pt")
       ),
       strip.text.y = ggplot2::element_text(
         size = 11, vjust = 0.5, face = "italic", 
         margin = ggplot2::margin(l = 10, r = 7,  unit = "pt")
       ),
       panel.spacing = ggplot2::unit(2, "lines"),
       ...
     )
  )
}
