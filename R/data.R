#' @importFrom tibble tibble
NULL

#' Ainmneacha Naíonán na hÉireann - Irish Baby Names (1964 - 2018)
#'
#' Irish baby name data provided by the Irish CSO dataset VSA05 and VSA12.
#' This includes all names that occur at least three times in the year.
#'
#' @format A data frame with four variables: `year`, `sex`, `name` and `n`
"babynames"

#' Irish populationg statistics by gender (1926 - 2018)
#'
#' Statistics collected by the Irish CSO under Annual Population
#' Estimates PEA11.
#' @format A data frame with four variables: `year`, `sex`, `age` and `population`
"population"

#' Irish migration statistics (1987 - 2018)
#'
#' Migration statistics by gender, flow and country of origin/destination.
#' Statistics collected by the Irish CSO under Annual Population
#' Estimates PEA03.
#' @format A data frame with five variables: `year`, `sex`, `age_group`, `flow` and `n`
"migration"
