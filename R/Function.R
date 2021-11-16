#' @title Summary Statistics for Flow_sample data set
#'
#' @description This function outputs minimum, maximum, and mean summary statistics for flow measurements for each recorded month in the flow_samples data set. The function identifies the data, groups by a given category, and calculates summary statistics for the measured values.
#'
#' @params data The data set: flow_samples. I named the parameter "data" to identify that the function is seeking the sourced data set.
#' #
#' @params category The category to calculate the statistics in: month. I named the parameter "category" to identify that the function is grouping the data set into seperate categories, and is asking for specification on which columns to group the outputs into.
#'
#' @params values The data values to run statistics on: flow. I named the parameter
#'
#' @return A tibble with the summary statistic information
#' @export


Function1 <- function(data, category, values) {
  data %>%
    dplyr::group_by({{ category }}) %>%
    dplyr::summarise(min = min({{ values }}),
              max = max({{ values }}),
              mean = mean({{ values }}))
}


#' @examples 1. An example of the function ran in Flow_Samples dataset
#'
#' @description  Flow Summary statistics from MDA:

Function1(datateachr::flow_sample,month,flow)

#' @examples 2. An example of the function ran in Vancouver_Trees dataset
#'
#' @description Calculates summary statistics for each genus name.

Function1(datateachr::vancouver_trees,genus_name,diameter)
