#' Sparse .csc Adjacency Matrix to \code{fastnet}
#'
#' @description Transform a sparse .csc adjacency matrix to an ego-centric list form used in \code{fastnet}.
#' @param sparse.mat.csc  The input adjacency matrix stored in the .csc sparse matrix form
#' @return A list containing the nodes of the network and their respective neighbors
#' @author Xu Dong
#' @export

from.csc <- function (sparse.mat.csc){
  net <- lapply( igraph::as_adj_list( igraph::graph_from_adjacency_matrix(as.matrix(sparse.mat.csc)), mode = "out" ),
                 as.numeric )
  net
}


