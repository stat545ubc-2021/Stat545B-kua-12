#' @title Summary Statistics
#'
#' @description This function outputs minimum, maximum, and mean summary statistics for quantitative measurements for defined categories in the data set.
#'
#' @param data The data frame used to run summary statistics.
#'
#' @param category The category that the data is sorted by for further statistic calculations.
#'
#' @param values The quantitative numerical data values used to run statistics
#'
#' @return A tibble with the summary statistic information: minimum, maximum, and mean.
#' @export


Function1 <- function(data, category, values) {
  data %>%
    dplyr::group_by({{ category }}) %>%
    dplyr::summarise(min = min({{ values }}),
              max = max({{ values }}),
              mean = mean({{ values }}))
}


#' @example
#' 1. An example of the function ran in Flow_Samples dataset
#'
#' @description  Flow Summary statistics from MDA:

Function1(datateachr::flow_sample,month,flow)

#' @example
#' 2. An example of the function ran in Vancouver_Trees dataset
#'
#' @description Calculates summary statistics for each genus name.

Function1(datateachr::vancouver_trees,genus_name,diameter)

#' @example
#' 3. An example of the function ran in Cancer_Sample dataset
#'
#' @description Calculates summary statistics for each diagnosis type.

Function1(datateachr::cancer_sample,diagnosis,radius_mean)
