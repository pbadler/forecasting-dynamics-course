---
title: "Forecast evaluation assignment"
output:
  html_document: default
layout: post
---

under construction

### Overview  ###

The purpose of this assignment is to practice visualizing and quantifying forecast accuracy. 
You will adapt code from the [forecast evaluation lecture]({{ site.baseurl }}/lectures/forecast_evaluation) 
and from the lecture on Monte Carlo simulation of [prediction intervals]({{ site.baseurl }}/lectures/prediction_intervals_via_MC). We will
work again with the Yellowstone bison data; you will compare 
the forecast accuracy of a time-series only model with a
model that incorporates some climate data as well.

### Preliminary steps

1. Download the same data you used for the [model selection assignment]({{ site.baseurl }}/assignments/model_selection_assignment), and then prepare the data the same way
(creating log(N) and lag log(N) variables, and aggregating and merging the 
precipitation data to annual time scale). You should be able to copy and paste
the first chunk of the script you wrote for that assignment.

2. Now, split the full data set into a training set, including all years
up through 2011, and a test set, for years 2012-2017.

3. Fit a time-series-only model to the training data set.

4. Fit an alternative model that also includes at least one weather covariate. 
Based on the last assignment, January precipitation would be a good bet. 

Now you should be ready to generate forecasts.

### Questions

1. Generate forecasts for both of your models, then calculate and compare 
their forecast accuracy. 

2. Compute and compare the uncertainty due to parameter
error for each model. To do this, you will need to extract
the variance-covariance matrix from the model fit, then run a Monte Carlo 
simulation. 

3. Visualize the forecasts: plot the observed population counts for the 
training and test data, the predictions for the test data, and the uncertainty
around the predictions due to *parameter error*. 

### Hints

* You can choose whether to fit the two models using time-series tools or using 
simple linear models. For the time-series approach, you will need to
turn the bison data and your covariate(s) into `ts()` objects, and then fit
your models using `arima()`. To do this with `lm()`, you will need to create 
a lag N (or lag log(N)) covariate. The `forecast()`, and forecast
plotting functions in package forecast will work with `lm()` objects. However,
for `lm()` objects, the `accuracy()` function will only return results for the 
training set. To compute the same metrics for the test set, first use 
`predict()` to get predictions for the test data set, then pass the predictions
and observations to the `accuracy()` function. It should look something like this:
```
test_results = accuracy(my_predictions, test_set$counts)
```

* That said, while the functions in the forecast package will give you uncertainty due to 
process error, in order to compute uncertainty due to parameter error (for question 3),
you will need to do a Monte Carlo simulation. The example I gave you [here]({{ site.baseurl }}/lectures/prediction_intervals_via_MC) does 
this for an `lm()` object; I have not tried to do this using an `arima()` object. It should
be possible...
