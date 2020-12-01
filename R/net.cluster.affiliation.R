
#' Generate a cluster-affiliation graph
#'
#' @description Generate a cluster-affiliation graph.
#' @param DEG  Degree sequence.
#' @param community_affiliation_alpha First scaling parameter of the membership distribution.
#' @param community_affiliation_lambda Second scaling parameter of the membership distribution.
#' @param community_affiliation_min Minimal membership.
#' @param community_size_alpha First scaling parameter of the cluster-size distribution.
#' @param community_size_lambda Second scaling parameter of the cluster-size distribution.
#' @param community_size_min Minimal size of a cluster.
#' @details The generated network has multiple (overlapping) densely-connected clusters.
#' @return A list containing the nodes of the network and their respective neighbors.
#' @author Xu Dong, Nazrul Shaikh
#' @examples \dontrun{
#' DEG <- sample(seq(5,15),100, replace=TRUE)
#' x <- net.cluster.affiliation(DEG,
#'                              community_affiliation_alpha=1.5,
#'                              community_affiliation_lambda=10,
#'                              community_affiliation_min=1,
#'                              community_size_alpha=2.5,
#'                              community_size_lambda=40,
#'                              community_size_min=3)}
#' @export
#' @references Dong X, Castro L, Shaikh N (2020). “fastnet: An R Package for Fast Simulation and Analysis of Large-Scale Social Networks.” Journal of Statistical Software, 96(7), 1-23. doi:10.18637/jss.v096.i07 (URL: https://doi.org/10.18637/jss.v096.i07)

net.cluster.affiliation <- function(DEG, community_affiliation_alpha, community_affiliation_lambda, community_affiliation_min, community_size_alpha, community_size_lambda, community_size_min) {

  n = length(DEG)
  en = round(sum(DEG)/2)
  max_deg = max(DEG)
  ## Create a blank space for storing neighboring information
  NeiList = list()
  NeiList[n] = list(NULL)

  ## Check Input Parameters ##
  if ( n %% 1 != 0 | n < 500 ) {

    return ("ERROR: input is not valid since n is either not an integer or smaller than the suggested minimal number")

  }

  ## Decide the number of membership of each node/ Decide the number of communities to which each node belong ##
  community_affiliation = sample(seq(max_deg^2),size = n,replace = T,prob = sapply(seq(max_deg^2), function(x) x^(-community_affiliation_alpha)*exp(-x/community_affiliation_lambda))) + community_affiliation_min - 1

  initial_community_affiliation = community_affiliation

  ## While-Loop ##
  NC = 1

  community_size = c()

  edge_add = 1

  for (i in seq(n)){

    while ( community_affiliation[[i]]>0 && sum(edge_add) <= 1.01 * en  && length(community_affiliation[community_affiliation!=0]) >= 3 && NC<=10000000 ) {

      ## Decide the size of the sampled community
      community_size = c(community_size,min(sample(seq(community_size_min-1,max_deg),size = 1,replace = T,prob = sapply(seq(community_size_min-1,max_deg), function(x) x^(-community_size_alpha)*exp(-x/community_size_lambda))),length(community_affiliation[community_affiliation!=0])))

      ## Community Member Selection according to the community size
      cp = seq(n)[community_affiliation > 0]
      community_member = c(i,sample(cp[cp!=i], size = community_size[[NC]]-1))

      community_affiliation[community_member] = community_affiliation[community_member] - 1

      nea = 0

      for ( j in community_member ) {

        pool = community_member[!community_member %in% c(j,NeiList[[j]])]

        if (  length(pool) > 0 ) {

          NeiList[[j]] = c(NeiList[[j]],pool)

          for ( m in pool ) {

            NeiList[[m]] = c( NeiList[[m]],j )

          }

          nea = nea + length(pool)

        } else {  }

      }

      edge_add = c(edge_add, nea)

      NC = NC + 1

    }


  }

  return(NeiList)

}

