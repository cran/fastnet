#' Edgelist to \code{fastnet}
#'
#' @description Transform an edgelist to an ego-centric list form used in \code{fastnet}.
#' @param edgelist A 2-column data frame, in which the 1st column represents the start nodes, and the 2nd column represents the destination nodes.
#' @details Most network data repositories choose to store the data in an edgelist form. This function helps user to load it in \code{fastnet}.
#' @return A list containing the nodes of the network and their respective neighbors.
#' @author Xu Dong
#' @examples
#' edgelist <- data.frame(from=c(1, 3, 2, 3, 3), to=c(4, 5, 6, 5, 7))
#' g <- from.edgelist(edgelist)
#' @export

from.edgelist <- function(edgelist) {
  g_0 <- igraph::graph_from_data_frame(edgelist, vertices = NULL)
  n <- igraph::vcount(g_0)
  g_0 <- igraph::set.vertex.attribute(g_0, "name", value=seq(n))
  net <- unname( lapply( igraph::as_adj_list(g_0), as.numeric ) )
  net
}


