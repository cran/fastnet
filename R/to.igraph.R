#' \code{fastnet} to \code{igraph}
#'
#' @description Coerce a fastnet object to an igraph object
#' @param g A fastnet object
#' @return An igraph object
#' @author Xu Dong
#' @export

to.igraph <- function(g) {

  net.ig <- igraph::graph_from_adj_list(g)
  net.ig
}

