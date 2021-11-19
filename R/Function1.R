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
#'
#' @export

Function1 <- function(data, category, values) {
  data %>%
    dplyr::group_by({{ category }}) %>%
    dplyr::summarise(min = min({{ values }}),
              max = max({{ values }}),
              mean = mean({{ values }}))
}


#' @example
#' # An example of the function ran in Flow_Samples data set
Function1(datateachr::flow_sample,month,flow)

#' @example
#' # An example of the function ran in Vancouver_Trees data set
Function1(datateachr::vancouver_trees,genus_name,diameter)

#' @example
#' # An example of the function ran in Cancer_Sample data set
Function1(datateachr::cancer_sample,diagnosis,radius_mean)
