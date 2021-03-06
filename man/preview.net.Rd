% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preview.net.R
\name{preview.net}
\alias{preview.net}
\title{Preview of a network}
\usage{
preview.net(net)
}
\arguments{
\item{net}{The input network.}
}
\value{
A list.
}
\description{
Present the first 10 ego-centric lists of a network.
}
\details{
the connection condition of the first 10 nodes in a network.
}
\examples{
\dontrun{
x <-  net.ring.lattice(12,4)
preview.net(x)}
}
\author{
Xu Dong, Nazrul Shaikh.
}
