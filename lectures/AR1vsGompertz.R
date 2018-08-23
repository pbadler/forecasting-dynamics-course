
# simulate an AR1 process 
tot_time <- 100
a = 2
b = 1
sigma = 0
initial_n <- 1

ar1 <- function(n,a,b,sigma){
  new_n <- a + b*n +rnorm(1,0,sigma)
}
N <- numeric(tot_time)
N[1] = initial_n
for(i in 2:tot_time){
  N[i] = ar1(N[i-1],a=a,b=b,sigma=sigma)
}
plot(N,type="l")

# simulate a Gompertz process
# same thing but exponentiate to backtransform from log scale
plot(exp(N),type="l")

