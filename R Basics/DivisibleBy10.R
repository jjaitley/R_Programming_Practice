# Divisibilty by 10 function
DivisibleBy10count <- function(x) {
  # Set k to be 0
  k <- 0 
  for(n in x) {
    # %% finds remainder on division
    if(n %% 10 == 0) k <- k + 1 
  }
  return(k)
}

DivisibleBy10count(c(10,23,50,55,60,600))
