# News

## 0.1.5
* draw.degdist.cum.log() is deprecated, use degree.dist(cumulative = TRUE, log = TRUE) instead
* draw.degdist.cum() is deprecated, use degree.dist(cumulative = TRUE, log = FALSE) instead
* draw.degdist.log() is deprecated, use degree.dist(cumulative = FALSE, log = TRUE) instead
* draw.degdist() is deprecated, use degree.dist(cumulative = FALSE, log = FALSE) instead 
* histo.dist() is deprecated, use degree.hist() instead
* dist.deg() is deprecated, use degree.collect() instead

## 0.1.4
* Fix the consistancy issue when presenting a fastnet network object by removing the ‘igraph.vs’ class from the output for the function "from.adjacency" and "from.igraph"
* Elaborate the example and the statements of the “parameters” and “details” in the "from.edgelist" documentation
* Make the argument “ncores” consistent with other functions for "net.rewired.caveman"
* Add a new function "to.edgelist" to Coerce a fastnet object to an edgelist representation
* Add a new function "to.igraph" to Coerce a fastnet object to an igraph object
* Add a new function "to.tidygraph" to Coerce a fastnet object to a tidygraph object
* Add a new function "from.csc" to transform a sparse .csc adjacency matrix to an ego-centric list form used in \code{fastnet}
* Add a new function "from.csr" to transform a sparse .csr adjacency matrix to an ego-centric list form used in \code{fastnet}
* Add a new function "from.statnet" to transform a \code{network} object  to an ego-centric list form used in \code{fastnet}

## 0.1.3
* Changes in plot labels: draw.degdist.cum.log, draw.degdist.cum, histo.dist
* Minor changes in options and display: draw.degdist.log, draw.degdist
* Minor changes (typos, spaces): net.barabasi.albert, net.erdos.renyi.gnp, net.erdos.renyi.gnm

## 0.1.2
* Three new functions to convert lists to networks
* Some additional validations for metric functions

## 0.1.1 
* (Issue #1) Fixed main title.

## 0.1.0 Initial Release
