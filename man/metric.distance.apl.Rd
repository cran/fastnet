% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metric.distance.apl.R
\name{metric.distance.apl}
\alias{metric.distance.apl}
\title{Average Path Length}
\usage{
metric.distance.apl(
  Network,
  probability = 0.95,
  error = 0.03,
  Cores = detectCores(),
  full.apl = FALSE
)
}
\arguments{
\item{Network}{The input network.}

\item{probability}{The confidence level probability.}

\item{error}{The sampling error.}

\item{Cores}{Number of cores to use in the computations. By default uses \emph{parallel} function \code{detecCores()}.}

\item{full.apl}{It will calculate the sampling version by default. If it is set to true,
the population APL will be calculated and the rest of the parameters will be ignored.}
}
\value{
A real value.
}
\description{
Calculate the average path length of a graph.
}
\details{
The average path length (APL) is the average shortest path lengths of all
pairs of nodes in graph \emph{Network}. \code{metric.distance.apl} calculates
the population APL and estimated APL of graph g with a sampling error set by the user.

The calculation uses a parallel load balancing approach,
distributing jobs equally among the cores defined by the user.
}
\examples{
\dontrun{
##Default function
x <-  net.erdos.renyi.gnp(1000,0.01)
metric.distance.apl(x)
##Population APL
metric.distance.apl(x, full.apl=TRUE)
##Sampling at 99\% level with an error of 10\% using 5 cores
metric.distance.apl(Network = x, probability=0.99, error=0.1, Cores=5)
}

}
\references{
E. W. Dijkstra. 1959. A note on two problems in connexion with graphs. Numer. Math. 1, 1 (December 1959), 269-271.

Castro L, Shaikh N. Estimation of Average Path Lengths
of Social Networks via Random Node Pair Sampling.
Department of Industrial Engineering, University of Miami. 2016.
}
\author{
Luis Castro, Nazrul Shaikh.
}
