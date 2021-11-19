Assignment_B1
================
Andrea_Ku
10/31/2021

##### Load relevant packages:

``` r
#install.packages("devtools")
#devtools::install_github("UBC-MDS/datateachr")

library(datateachr)
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --

    ## v ggplot2 3.3.5     v purrr   0.3.4
    ## v tibble  3.1.4     v dplyr   1.0.7
    ## v tidyr   1.1.3     v stringr 1.4.0
    ## v readr   2.0.1     v forcats 0.5.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches

    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null

    ## The following objects are masked from 'package:readr':
    ## 
    ##     edition_get, local_edition

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

# Exercise 1 & 2: Make a Function & Document your Function

##### The written function is meant to run summary statistics within a category for the data set.

``` r
#' @title Summary Statistics for Flow_sample data set
#'
#' @description This function outputs minimum, maximum, and mean summary statistics for flow measurements for each recorded month in the flow_samples data set. The function identifies the data, groups by a given category, and calculates summary statistics for the measured values.
#'
#' @param data The data set: flow_samples. I named the parameter "data" to identify that the function is seeking the sourced data set.
#' #
#' @param category The category to calculate the statistics in: month. I named the parameter "category" to identify that the function is grouping the data set into seperate categories, and is asking for specification on which columns to group the outputs into. 
#' 
#' @param values The data values to run statistics on: flow. I named the parameter
#' 
#' @return A tibble with the summary statistic information 

 Function1 <- function(data, category, values) {
  data %>%
  group_by({{ category }}) %>%
  summarise(min = min({{ values }}),
            max = max({{ values }}),
            mean = mean({{ values }})) 
 }
```

# Exercise 3: Include Examples

##### Function was written to replicate this summary statistic chart from the Mini Data Analysis. The function output will be identical to the output of this code chunk if the function is working as expected.

``` r
# Flow Summary statistics from MDA:

FlowSummary <- flow_sample%>% 
              group_by(month) %>%
  summarise(min = min(flow),
            max = max(flow),
            mean = mean(flow))
print(FlowSummary)
```

    ## # A tibble: 11 x 4
    ##    month    min    max   mean
    ##    <dbl>  <dbl>  <dbl>  <dbl>
    ##  1     1   3.62   8.41   6.50
    ##  2     2   4.08   7.98   6.07
    ##  3     3   4.14   8.44   6.42
    ##  4     4   4.9    7.53   6.17
    ##  5     5 133    289    194.  
    ##  6     6 107    466    218.  
    ##  7     7 130    314    200.  
    ##  8     8 174    174    174   
    ##  9    11   5.21   7.16   6.11
    ## 10    12   5.27   7.88   6.19
    ## 11    NA  NA     NA     NA

##### Demonstrating the usage of this function for the flow_samples data set:

###### Example 1

###### Same output as above, but using the function. This code chunk identifies flow_sample as the data set to use, month as the category, and flow as the data to summarize.

``` r
# Flow Sample Example

is(Function1(flow_sample,month,flow))
```

    ## # A tibble: 11 x 4
    ##    month    min    max   mean
    ##    <dbl>  <dbl>  <dbl>  <dbl>
    ##  1     1   3.62   8.41   6.50
    ##  2     2   4.08   7.98   6.07
    ##  3     3   4.14   8.44   6.42
    ##  4     4   4.9    7.53   6.17
    ##  5     5 133    289    194.  
    ##  6     6 107    466    218.  
    ##  7     7 130    314    200.  
    ##  8     8 174    174    174   
    ##  9    11   5.21   7.16   6.11
    ## 10    12   5.27   7.88   6.19
    ## 11    NA  NA     NA     NA

###### Example 2

###### Using the Vancouver Trees data set, the function is calculating the miniumum, maximum, and the mean for the diameter for each genus name.

``` r
# Vancouver Trees Example
Function1(vancouver_trees,genus_name,diameter)
```

    ## # A tibble: 97 x 4
    ##    genus_name    min   max  mean
    ##    <chr>       <dbl> <dbl> <dbl>
    ##  1 ABIES           1  42.5 12.9 
    ##  2 ACER            0 317   10.6 
    ##  3 AESCULUS        0  64   23.7 
    ##  4 AILANTHUS       3  21.5 15.9 
    ##  5 ALBIZIA         6   6    6   
    ##  6 ALNUS           0  40   17.5 
    ##  7 AMELANCHIER     0  20    3.21
    ##  8 ARALIA          3  12    6.81
    ##  9 ARAUCARIA       3  32   11.4 
    ## 10 ARBUTUS         6  33   18.4 
    ## # ... with 87 more rows

###### Example 3

###### Using the cancer sample data set, the function is calculating the miniumum, maximum, and the mean for the mean radius for each diagnosis type.

``` r
# Cancer Sample Example
Function1(cancer_sample,diagnosis,radius_mean)
```

    ## # A tibble: 2 x 4
    ##   diagnosis   min   max  mean
    ##   <chr>     <dbl> <dbl> <dbl>
    ## 1 B          6.98  17.8  12.1
    ## 2 M         11.0   28.1  17.5

# Exercise 4: Test the Function

###### I tested the function within the function iself using if()and stop() functions, and by using expect\_() functions from the testthat package.

``` r
# Using if() stop() functions, I tested to see if the input for "data" was a data frame, and if the input for "values" was numeric.

 Function_test <- function(data, category, values, na.rm = TRUE) {
     
   if(!is.data.frame(data)) {
    stop('I am so sorry, but this function only works a data frame input! Enter your data frame as the input.\n',
         'You have provided an object of class: ', class(data)[1])
   }
   
    check <- dplyr::summarise(data, is.numeric({{ values }}))
  if (!check[[1]]) {
    stop("values is not numeric")
  }
    

  data %>%
  group_by({{ category }}) %>%
  summarise(min = min({{ values }}),
            max = max({{ values }}),
            mean = mean({{ values }})) 
 }
```

###### Using expect\_() functions, I tested to see if the inputs were the expected type.

``` r
# Since each expect_() function tested to see if each input (data, category, values) was correct or if the input gave an error when an error was expected.

Testing <- test_that("Testing function", {
  FlowFunc <- Function_test(flow_sample,month,flow)
  expect_true(is.data.frame(flow_sample))
  expect_true(is.numeric(flow_sample$flow))
  expect_error(Function_test(flow_sample,month))
  expect_error(Function_test(flow_sample,flow))

})
```

    ## Test passed

