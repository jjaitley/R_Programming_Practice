# Evencount function
evencount <- function(x) {
  # Set k to be 0
  k <- 0 
  for(n in x) {
    # %% finds remainder on division
    if(n %% 2 == 0) k <- k + 1 
  }
  return(k)
}

evencount(c(1,4,5))
evencount(c(1,2,3,6,7,8,9))