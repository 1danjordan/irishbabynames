# Ainmneacha Naíonán na hÉireann - Irish Baby Names

This package contains three datasets scraped from the Irish Central Statistics Office Statbank. Each dataset is broken down by year, sex and age (or age group). 

  * `babynames` (1964 - 2018)
  * `population` (1926 - 2018) 
  * `migration` (1987 - 2018)

This package was inspired by Hadley Wickham's [`babynames` package](https://github.com/hadley/babynames)

## Installation

```r
devtools::install_github("dandermotj/irishbabynames")
library(irishbabynames)

babynames
## A tibble: 285,498 x 4
#    year sex   name      n
#   <int> <chr> <chr> <int>
# 1  1964 male  Jack     NA
# 2  1965 male  Jack     NA
# 3  1966 male  Jack     NA
# 4  1967 male  Jack     NA
# 5  1968 male  Jack     NA
# 6  1969 male  Jack     NA
# 7  1970 male  Jack      3
# 8  1971 male  Jack     NA
# 9  1972 male  Jack     NA
#10  1973 male  Jack      3
## … with 285,488 more rows

population
## A tibble: 6,800 x 4
#    year sex     age population
#   <int> <chr> <int>      <int>
# 1  1926 male      0      28084
# 2  1936 male      0      27152
# 3  1946 male      0      33798
# 4  1951 male      0      32630
# 5  1961 male      0      32137
# 6  1966 male      0      32514
# 7  1971 male      0      33276
# 8  1979 male      0      36171
# 9  1981 male      0      37717
#10  1986 male      0      31315
## … with 6,790 more rows

migration
## A tibble: 640 x 5
#    year sex   age_group flow        n
#   <int> <chr> <chr>     <chr>   <int>
# 1  1987 male  0 - 14    outward  1400
# 2  1988 male  0 - 14    outward  4300
# 3  1989 male  0 - 14    outward  4100
# 4  1990 male  0 - 14    outward  3600
# 5  1991 male  0 - 14    outward  2300
# 6  1992 male  0 - 14    outward   300
# 7  1993 male  0 - 14    outward   600
# 8  1994 male  0 - 14    outward   600
# 9  1995 male  0 - 14    outward   600
#10  1996 male  0 - 14    outward   400
## … with 630 more rows
```  

