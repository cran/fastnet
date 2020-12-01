#' \code{fastnet} to \code{tidygraph}
#'
#' @description Coerce a fastnet object to a tidygraph object.
#' @param g A fastnet object.
#' @return A tidygraph object
#' @author Xu Dong
#' @export

to.tidygraph <- function(g) {

  net.tidy <- tidygraph::as_tbl_graph(igraph::graph_from_adj_list(g))
  net.tidy
}

