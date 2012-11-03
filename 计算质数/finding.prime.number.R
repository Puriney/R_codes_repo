finding.primes<-function(n){
	num <- seq(2,n)
	primes<-c()
	#for (i in seq(2,n)){
  for (i in seq(2,round(sqrt(n)))){
		if (any(num== i)){
		primes<-c(primes,i)
		num <- num[(num %% i) !=0]
		}
	}
#return (num)
out <- c(primes, num)
#return (primes)
return (max(out))
}

