#' Degrees of nodes
#'
#' @description Collect the degrees for all nodes in a network.
#' @param net	 The input network.
#' @details Obtain the degrees for all nodes.
#' @return A vector.
#' @author Xu Dong, Nazrul Shaikh.
#' @examples \dontrun{
#  x <-  net.erdos.renyi.gnp(1000, 0.01)
#' x.deg <- degree.collect(x)
#' summary(x.deg)}
#' @export

degree.collect <- function(net){

  lengths(net)

}
