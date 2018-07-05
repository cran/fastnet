#' Histogram of the degree distribution of a network
#'
#' @description Plot the histogram of all degrees of a network.
#' @param g	 The input network.
#' @param breaks	 A single number giving the number of cells for the histogram.
#' @details Plot the histogram of all degrees of a network.
#' @return A .gif plot.
#' @author Xu Dong
#' @examples \dontrun{
#' x <-  net.erdos.renyi.gnp(1000, 0.05)
#' degree.hist(x)}
#' @export

degree.hist <- function(g, breaks = 100) {

  graphics::hist(lengths(g), breaks = breaks, xlab = "Degree", main = NULL)

}
