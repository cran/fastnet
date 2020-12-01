
#' Generate a degree-constraint graph
#'
#' @description Generate a degree-constraint graph.
#' @param DEG  Degree sequence.
#' @param c.alpha Scaling parameter of the community-size distribution.
#' @param c.min Minimal size of a community.
#' @details The generated network has a pre-defined degree sequence with multiple (overlapping) communities.
#' @return A list containing the nodes of the network and their respective neighbors.
#' @author Xu Dong, Nazrul Shaikh
#' @examples \dontrun{
#' DEG <- sample(seq(5,15),100, replace=TRUE)
#' x <- net.degree.constraint(DEG, c.alpha=2, c.min=3)}
#' @export
#' @references Dong X, Castro L, Shaikh N (2020). “fastnet: An R Package for Fast Simulation and Analysis of Large-Scale Social Networks.” Journal of Statistical Software, 96(7), 1-23. doi:10.18637/jss.v096.i07 (URL: https://doi.org/10.18637/jss.v096.i07)

net.degree.constraint = function(DEG, c.alpha, c.min){
  n = length(DEG)
  ## Replicate the degree distribution
  initial_DEG = DEG
  ## Create a blank space for storing neighboring information
  NeiList = list()
  NeiList[n] = list(NULL)

  #cluster size distribution
  com.dist = sapply(seq(max(length(DEG))), function(x) (c.alpha^x)*exp(-c.alpha)/factorial(x))
  com.dist = com.dist[!is.na(com.dist)]
  com.dist = c(sum(com.dist[1:c.min]), com.dist[(c.min+1):length(com.dist)])

  ## Statistics ##
  NC = 1
  community_size = c()
  edge_add = c()
  full.connect.count = 0

  ## Generate communities
  while (TRUE) {
    # k = 1
    nea = 0
    ## Decide the size of the sampled community
    new_community_size = sample(seq(0,length(com.dist)-1), size = 1, replace = T, prob = com.dist) + c.min
    com.size = min(new_community_size, sum(DEG>0))
    sample.pool = seq(n)[DEG > 0]

    ## Community Member Selection Method
    community_member = sample(sample.pool, size = com.size)
    community_size = c(community_size, com.size)
    inner_degree = c()
    for ( i in community_member ) {
      inner_degree = c( inner_degree, min( DEG[[i]], com.size-1 ) )
    }
    inner_degree_list = cbind(community_member,inner_degree)
    inner_degree_list_ori = inner_degree_list ## for test purpose

    for (j in seq(com.size)){
      from = inner_degree_list[j,1] # node name
      # First, we check if the node degree is 1 or more
      if(inner_degree_list[j,2]==1){

        xx = inner_degree_list[inner_degree_list[,2]>1,1]
        pool = xx[!xx %in% c(from,NeiList[[from]])]

        # Second, we check the pool size
        if (length(pool)>1){
          to = sample(pool,1, prob = inner_degree_list[which(inner_degree_list[,1]%in%pool), 2]) # node name
          to_idx = which(inner_degree_list[,1]==to) # node index in list
          NeiList[[from]] = c(NeiList[[from]], to)
          NeiList[[to]] = c(NeiList[[to]], from)
          inner_degree_list[j,2] = 0
          inner_degree_list[to_idx,2] = inner_degree_list[to_idx,2] - 1
          nea = nea + 1
        } else if(length(pool)==1){
          to = pool # node name
          to_idx = which(inner_degree_list[,1]==to) # node index in list
          NeiList[[from]] = c(NeiList[[from]], to)
          NeiList[[to]] = c(NeiList[[to]], from)
          inner_degree_list[j,2] = 0
          inner_degree_list[to_idx,2] = inner_degree_list[to_idx,2] - 1
          nea = nea + 1
        } else{}
      } else if(inner_degree_list[j,2]>1){

        xx = inner_degree_list[inner_degree_list[,2]>0,1]
        pool = xx[!xx %in% c(from,NeiList[[from]])]
        if (length(pool)>1){
          # to = sample(pool, min(length(pool), inner_degree_list[j,2]), prob = 1/inner_degree_list[which(inner_degree_list[,1]%in%pool), 2]) # nodes name
          to = sample(pool, min(length(pool), inner_degree_list[j,2]))
          NeiList[[from]] = c(NeiList[[from]], to) #
          inner_degree_list[j,2] = 0
          for (to_name in to){
            to_idx = which(inner_degree_list[,1]==to_name) # nodes index in list
            inner_degree_list[to_idx,2] = inner_degree_list[to_idx,2] - 1
            NeiList[[to_name]] = c(NeiList[[to_name]], from)
          }
          nea = nea + length(to)
        } else if(length(pool)==1){
          to = pool # node name
          to_idx = which(inner_degree_list[,1]==to) # node index in list
          NeiList[[from]] = c(NeiList[[from]], to)
          NeiList[[to]] = c(NeiList[[to]], from)
          inner_degree_list[j,2] = 0
          inner_degree_list[to_idx,2] = inner_degree_list[to_idx,2] - 1
          nea = nea + 1
        } else{}
      } else{}
    }
    # renew degree list
    DEG[inner_degree_list[,1]] = initial_DEG[inner_degree_list[,1]] - lengths(NeiList[inner_degree_list[,1]])
    if (nea == 0) {
      full.connect.count = full.connect.count + 1
    } else {
      full.connect.count = 0
      NC = NC + 1
    }
    edge_add = c(edge_add, nea)
    if(sum(DEG > 0) < c.min){
      break
    }
    if(NC>15000){
      break
    }
    if(full.connect.count>100){
      break
    }
  }
  return(lapply(NeiList, function(x) unname(x)))
}
