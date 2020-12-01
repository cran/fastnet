#' \code{statnet}  to \code{fastnet}
#'
#' @description Import a \code{statnet} object.
#' @param net.statnet The input \code{statnet} object.
#' @param ncores The number of cores to be used.
#' @return A list containing the nodes of the network and their respective neighbors.
#' @author Xu Dong
#' @examples \dontrun{
#' library("ergm")
#' library("doParallel")
#' data("flo")
#' nflo <- network(flo, loops = TRUE)
#' fflo <- from.statnet(nflo)}
#' @export

from.statnet <- function(net.statnet, ncores = detectCores()){

  net.el <- as.matrix(net.statnet,matrix.type = "edgelist")
  n = attr(net.el,"n") # extract the size of the network

  # Return an ego-centric list
  network = vector("list", length = n) # create a void list
  registerDoParallel(cores = ncores)
  i <- NULL
  network <- foreach(i = 1:n) %dopar% {
    net.el[,2][which(net.el[,1]==i)]
  }
  network
}
