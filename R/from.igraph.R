#' Transform an \code{igraph} object to a \code{fastnet} object
#'
#' @description Transform an \code{igraph} object to an ego-centric list form used in \code{fastnet}.
#' @param net.igraph The input \code{igraph} object.
#' @return A list containing the nodes of the network and their respective neighbors.
#' @author Xu Dong.
#' @examples \dontrun{
#' library("igraph")
#' net.igraph <- erdos.renyi.game(100,0.1)
#' g <- from.igraph(net.igraph)}
#' @export

from.igraph <- function(net.igraph){
  n <- igraph::vcount(net.igraph)
  g_0 <- igraph::set.vertex.attribute(net.igraph, "name", value=seq(n))
  net <- unname( lapply( igraph::as_adj_list(g_0), as.numeric ) )
  net
}



