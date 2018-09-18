
library(mvtnorm)

my_mu = c(1,10)
my_sigma = cbind(c(1,0),c(0,5))  # no correlations
out = rmvnorm(100,mean=my_mu,sigma=my_sigma)
plot(out)

my_sigma = cbind(c(1,2),c(2,5))  # positive correlations
out = rmvnorm(100,mean=my_mu,sigma=my_sigma)
plot(out)

my_sigma = cbind(c(1,-2),c(-2,5))  # negative correlations
out = rmvnorm(100,mean=my_mu,sigma=my_sigma)
plot(out)


# simulate an independent variable and a response 
x = 1:100
y = 0.8*x + rnorm(length(x),0,max(x)/5)  # rnorm() adds some noise 
plot(x,y)
reg = lm(y~x)

# extract estimates of parameter means and var-cov matrix
mu = coef(reg)
sigma = vcov(reg)
plot(rmvnorm(1000,mu,sigma ))

# Monte Carlo simulation

# Simulation parameters:
NE = 100      ## Ensemble size

# Generate predictions for each value of x using different parameter samples
n = matrix(NA,NE,length(x))   # storage for all simulations
coef_samples = rmvnorm(NE,mean=mu,sigma=sigma)  # sample values of coefficients
for(i in 1:NE){        # loop over r and K samples
  n[i,] = coef_samples[i,1] + coef_samples[i,2]*x   # predict values at each x
}

# calculate the median and 95% CI limits for each time point
n.stats = apply(n,2,quantile,c(0.025,0.5,0.975))

true_PI = predict(reg,interval="prediction", level=0.95)

# plot the median
plot(x,y)

# add predictions, upper and lower CI's
lines(predict(reg))

# truth
lines(x,true_PI[,2],col="blue")
lines(x,true_PI[,3],col="blue")

# mine 
lines(x,n.stats[1,],col="blue",lty="dashed")
lines(x,n.stats[3,], col="blue",lty="dashed")
