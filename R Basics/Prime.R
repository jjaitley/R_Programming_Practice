# isprime function
primecheck <- function(x) {
  # Set k to be 0
  k <- 0 
  for(n in x) {
    if(all(isprime(n))){
      k <- k + 1 
    }
  }
  return(k)
}

primecheck(c(1,2,3,6,7,8,9,11))

