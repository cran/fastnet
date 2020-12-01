#' Plot of the degree distribution of a network
#'
#' @description Plot the degree distribution of a network.
#' @param net The input network.
#' @param cumulative A logical index asking whether a cumulative distribution should be returned.
#' @param log A logical index asking whether a logarithm-scaled distribution should be returned.
#' @details Plot the degree distribution of a network.
#' @return A .gif plot.
#' @author Xu Dong
#' @examples \dontrun{
#' x <-  net.erdos.renyi.gnp(1000, 0.01)
#'
#' ## Plot the standard degree distribution of x.
#' degree.dist(x, cumulative = FALSE, log = FALSE)
#'
#' ## Plot the degree distribution of x, with a logarithm scale.
#' degree.dist(x, cumulative = FALSE, log = TRUE)
#'
#' ## Plot the cumulative degree distribution of x.
#' degree.dist(x, cumulative = TRUE, log = FALSE)
#'
#' ## Plot the cumulative degree distribution of x, with a logarithm scale.
#' degree.dist(x, cumulative = TRUE, log = TRUE)
#' }
#' @export

degree.dist <- function(net, cumulative = TRUE, log = TRUE){

  if ( cumulative != TRUE & log != TRUE ){

    freq <- as.data.frame(table(lengths(net)))
    freq$Freq <- freq$Freq/length(net)
    graphics::plot(freq, xlab="Degree", ylab = "Prob")

  } else if ( cumulative != TRUE & log == TRUE ){

    prob <- cbind(names(table(lengths(net))), as.numeric(table(lengths(net)))/length(net))
    graphics::plot(prob, log="xy", xlab="Degree", ylab="Prob")

  } else if ( cumulative == TRUE & log != TRUE ){

    graphics::plot(stats::ecdf(lengths(net)),xlab="Degree",ylab="Prob",main="")

  } else {

    cum.freq <- cbind(as.numeric(names(table(lengths(net)))),
                      rev(cumsum(rev(unname(table(lengths(net))))))/sum(unname(table(lengths(net)))))
    graphics::plot(cum.freq, log="xy", xlab="Degree", ylab="Prob")

  }

}


