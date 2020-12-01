#' \code{fastnet} to edgelist
#'
#' @description Coerce a fastnet object to edgelist.
#' @param network A fastnet object.
#' @param ncores The number of cores to be used.
#' @return A 2-column list with each row representing an edge, from source to destination
#' @author Xu Dong
#' @examples \dontrun{
#' g <- net.erdos.renyi.gnp(100, 0.1)
#' el <- to.edgelist(g)}
#' @export

to.edgelist <- function(network, ncores) {

  n = length(network) # n is the size of the network
  registerDoParallel(cores = ncores) # register the workers
  i <- NULL
  edgelist <- foreach(i = 1:n, .combine = rbind) %dopar% { # transfer a fastnet objec, i.e., network, to its edgelist form
    matrix(c(rep(i,length(network[[i]])),network[[i]]), ncol=2)
  }
  edgelist
}

