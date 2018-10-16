---
title: "Forecast evaluation assignment"
output:
  html_document: default
layout: post
---

### Overview  ###

The purpose of this assignment is to practice visualizing and quantifying forecast accuracy. 
You will adapt code from the [forecast evaluation lecture](https://pbadler.github.io/forecasting-dynamics-course/lectures/forecasting-evaluation) 
and from the lecture on Monte Carlo simulation of [prediction intervals](https://pbadler.github.io/forecasting-dynamics-course/lectures/prediction_intervals_via_MC). We will
work again with the Yellowstone bison data; you will compare 
the forecast accuracy of a "null" model with no climate data to a
model that incorporates some climate data.

### Preliminary steps

1. Download the same data you used for the [model selection assignment](https://pbadler.github.io/forecasting-dynamics-course/assignments/model_selection_assignment), and then prepare the data the same way
(creating log(N) and lag log(N) variables, and aggregating and merging the 
precipitation data to annual time scale). You should be able to copy and paste
the first chunk of the script you wrote for that assignment.

2. Now, split the full data set into a training set, including all years
up through 2011, and a test set, for years 2012-2017.

3. Fit a no-climate model to the training data set. It should look something 
like: `null_model = lm(logN ~ logN_lag, data = train_data)`.

4. Fit an alternative model that also includes at least one weather covariate
(feel free to fancy it up if you like). 
Based on the last assignment, January precipitation would be a good bet. So
this model might look something like: 
`clim_model = lm(logN ~ logN_lag + ppt_Jan, data = train_data)` .

5. Set up a Monte Carlo simulation to a) generate predictions for the 
test data period and b) simulate uncertainty due to parameter error.
Why not just use the `forecast()` function? Because we fit the models using
`lm()` instead of `Arima()` and `forecast()` won't realize that 
the lagged density term is autoregressive. (Why didn't I ask you
to do this using `Arima()`? It's a long story that I will tell you
in class. The short version: Doing it that way would make some
things easy but would make the Monte Carlo simulations much
harder.) 

Now you should be ready to evaluate your forecasts.

### Lab report

Your assignment is to answer the question: How much (if at all) do
climate covariates improve the forecasts? Your answer should be based
on three complementary ways of comparing the two models:

1. The accuracy of the point forecasts for the test data. By "point forecast,"
I mean the mean or median of the Monte Carolo simulations of bison population size 
for the test data set years.

2. Uncertainty due to parameter error for each model. (*Bonus:* 
Run another simulation to estimate uncertainty due to
process error *and* parameter error.)

3. Visualize the forecasts. Plot the observed population counts for the 
training and test data, the predictions for the test data, and the uncertainty
around the predictions due to *parameter error*. 

As usual, you should turn in both the report (text and figures) and your
R script(s).  

### Hints

* For `lm()` objects, the `accuracy()` in package forecast
function will only return results for the training set. To compute 
the same metrics for the test set, you will pass the function 
the point predictions from your simulation along with the observations. 
It should look something like this:
```
test_results = accuracy(my_predictions, test_data$counts)
```
* The crux of this assignment will probably be the Monte Carlo simulations.
The [prediction intervals](https://pbadler.github.io/forecasting-dynamics-course/lectures/prediction_intervals_via_MC)
demo gives two examples of Monte Carlo simulations, a logistic growth example, 
and a correlated errors example for a simple regression. You will need to 
combine the population-growth aspect of the former with the correlated errors
aspect of the latter.

* Since we are not using the `forecast()` function, you won't
be able to use the handy `plot.forecast()` function to visualize
the forecasts. You will have to build your own figure. It should 
show the observed data for the training and test period, the
point predictions for the test period, and the 95% confidence
intervals around those predictions. Extra gratitude to
whoever shows me how to do this using ggplot. 

* For the bonus problem, remember that the variance of the residuals 
is equivalent to the process error in a linear regression.
So a 95% confidence interval around a prediction would be the 
point prediction +/- two times the standard deviation of the 
residuals.

##  Test links

Try these:

* Forecast evaluation [demo code]({{ site.baseurl }}/lectures/forecasting-evaluation)

* [Simulating prediction intervals]({{ site.baseurl }}/lectures/prediction_intervals_via_MC)

* Begin [Evaluating forecasts assignment]({{ site.baseurl }}/assignments/forecast_evaluation_assignment)



