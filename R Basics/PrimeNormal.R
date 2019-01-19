values = 2:50  # the range we are testing
primes = c() # empty vector of primes
for(val in values)
{
  # If val is not prime, val will have at least one prime factor <= the square root of val
  squareroot = floor(sqrt(val))
  isprime = TRUE  # flag as true.  If factor found, assign to be false
  for(factor in primes)  # loop through primes.  We'll short-circuit at the square root.  No sense testing GREATER than square root.
  {
    if(factor > squareroot)
    {
      break  # no factors found.  val is prime
    }
    if(val %% factor == 0)
    {
      isprime = FALSE # factor found.  Not prime.
      break
    }
  }
  if(isTRUE(isprime))
  {
    primes = c(primes, val) # add val to list of primes
  }
}
print(primes)