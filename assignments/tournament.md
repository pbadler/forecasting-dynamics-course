---
title: "Forecasting tournament"
output:
  html_document: default
layout: post
---

(under construction)

### Let the games begin ###

Do you think you are a good forecaster? A bad one? There is only one way to find out:
a competition! We are going to try to forecast forage production in the annual
grasslands of California based on weather covariates. The idea is pretty simple: 

1. Each group downloads:
      + The forage production response data for years 1936-2013 (download from Canvas).
      + [Monthly weather covariates](https://github.com/pbadler/forecasting-dynamics-course/blob/master/data/tournament_prism_monthly.csv) that span the training data set 
and then continue for the 2014-2018 period.
2. Fit whatever kind of model you want, using any method you want, with 
the 1936-2013 training data. You CANNOT use covariates from any other source.
3. Once you have finalized your model, you will generate a forecast
for years 2014-2018 (using the covariates for those years). Since 
we are hindcasting, the covariates are known, and we can ignore uncertainty 
in the covariates which would be present if we were relying on climate projections.
4. Each group will also prepare a 5 minute presentation for the rest of the 
class describing their model.
5. After everyone has submitted their forecasts (just five numbers), 
I will evaluate their accuracy by comparing them to the observed 2014-2018
values using RMSE? ASE? 
6. The winning team will bask in eternal glory, and a cheap candy prize.

### Background ###

As we've discussed, mechanistic knowledge can improve forecasts. The forage
data come from the Sierra Nevada foothills of California. Here is the citation for the data, 
which USDA NRCS and University of California Extension have generously made public for our use:

Dennis Dudley, USDA NRCS Rangeland Specialist, Madera County; Neil McDougald, UCCE Livestock, 
Range, and Natural Resources Advisor Emeritus, Madera County

This is an annual grassland,
so measuring aboveground annual production (forage production) is straightforward:
biomass is clipped to ground level, dried, and weighed. This is usually done in June 
at the end of the spring growing season. For more information about the factors
that determine productivity in these grasslands, see....

I downloaded the weather data from the [PRISM Explorer](http://www.prism.oregonstate.edu/explorer/). You can find some
metadata [here](https://github.com/pbadler/forecasting-dynamics-course/blob/master/data/tournament_prism_notes.txt). "ppt" refers to precipitation, "t" to temperature,
and "vpd" to vapor pressure deficit.


