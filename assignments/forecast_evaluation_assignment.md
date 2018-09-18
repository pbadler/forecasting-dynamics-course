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

#### Preliminary steps

1. Download the same data you used for the [model selection assignment]({{ site.baseurl }}/assignments/model_selection_assignment), and then prepare the data the same way
(creating log(N) and lag log(N) variables, and aggregating and merging the 
precipitation data to annual time scale).

2. Split data into training set and test set.

3. Fit time series only model.

4. Fit a model with at least one weather covariate. Based on the last assignment,
January precipitation would be a good bet. 

Now you should be ready to generate forecasts.

#### Questions

1. Generate forecasts for both of your models, then calculate and compare 
their forecast accuracy. 

2. Compute and compare the uncertainty due to parameter
error for each model. To do this, you will need to extract
the variance-covariance matrix from the model fit, then run a Monte Carlo 
simulation. 

3. Visualize the forecasts: plot the observed population counts for the 
training and test data, the predictions for the test data, and the uncertainty
around the predictions due to parameter error. 

#### Hints

