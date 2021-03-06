% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metric.graph.density.R
\name{metric.graph.density}
\alias{metric.graph.density}
\title{Graph Density}
\usage{
metric.graph.density(g)
}
\arguments{
\item{g}{The input network.}
}
\value{
A real constant.
}
\description{
Calculate the density of a graph.
}
\details{
Computes the ratio of the number of edges and the number of possible edges.
}
\examples{
\dontrun{
x <-  net.erdos.renyi.gnp(1000, 0.01)
metric.graph.density(x)}
}
\author{
Xu Dong, Nazrul Shaikh.
}
