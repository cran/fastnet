#' Neighbors of an agent in a network
#'
#' @description Presents all neighbors of a given node.
#' @param net	 The input network.
#' @param NodeID The ID of the input node.
#' @details Neighbors of a node are nodes that directly connects to this node.
#' @return A vector.
#' @author Xu Dong
#' @examples \dontrun{
#' x <-  net.ring.lattice(12,4)
#' neighbors(x,2)}
#' @export

neighbors <- function(net,NodeID) {
  net[[NodeID]]
}
