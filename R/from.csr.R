#' Sparse .csr Adjacency Matrix to \code{fastnet}
#'
#' @description Transform a sparse .csr adjacency matrix to an ego-centric list form used in \code{fastnet}.
#' @param sparse.mat.csr	 The input adjacency matrix stored in the .csr sparse matrix form
#' @return A list containing the nodes of the network and their respective neighbors
#' @author Xu Dong
#' @export

from.csr <- function (sparse.mat.csr){
  net <- lapply( igraph::as_adj_list( igraph::graph_from_adjacency_matrix(as.matrix(sparse.mat.csr)), mode = "out" ),
                 as.numeric )
  net
}


