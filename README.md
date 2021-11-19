---
title: "Stat545B Assignments"
author: "Andrea_Ku"
date: "10/31/2021"
---
#For Assignment 2:

## R Package Description: 
#### Package name: Stat545BAndreaKu
#### This package runs summary statistics with dplyr on data from the datateachr package. Summary statistics include minimum, maximum, and mean.

## Installation Instructions:
#### Install this package by loading the following package dependencies:

```{r}
# install.packages("devtools")
devtools::install_github("https://github.com/stat545ubc-2021/Stat545BAndreaKu.git")
```
## Usage is demonstrated with data from the datateachr package: 
#### Examples are included for the Flow_samples, Vancouver_trees, and Cancer sample datasets.

```{r}
library(Stat545BAndreaKu)


#' @example
#' # An example of the function ran in Flow_Samples data set
Function1(datateachr::flow_sample,month,flow)

#' @example
#' # An example of the function ran in Vancouver_Trees data set
Function1(datateachr::vancouver_trees,genus_name,diameter)

#' @example
#' # An example of the function ran in Cancer_Sample data set
Function1(datateachr::cancer_sample,diagnosis,radius_mean)
```




#For Assignment 1:

## Purpose
This repository was created to store a project for the Stat545B course at UBC. These assignments will help me practice and apply the concepts learned in lecture. 

Assignment B1 overviews creating a function in R, documenting it with roxygen2 tags, and testing it with expect_() functions.

To engage with this repository, open RStudio and run the code contained in the rmd files.

Files contained in this repository:
1. README.md: Contains information about the files and the project scope

2. Assignment_B1: rmd file working script; md file was the knitted file to a github document
