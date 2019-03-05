# Read in PC-AXIS files tidy them, merge them and save as tibble
library(dplyr)

boys_link <- "https://www.cso.ie/px/pxeirestat/Database/eirestat/Irish%20Babies%20Names/VSA05.px"
girls_link <- "https://www.cso.ie/px/pxeirestat/Database/eirestat/Irish%20Babies%20Names/VSA12.px"

boys <- pxR::read.px(boys_link) %>%
  as.data.frame() %>%
  filter(!grepl("Rank", Statistic)) %>%
  select(-Statistic) %>%
  as_tibble() %>%
  setNames(tolower(names(.))) %>%
  mutate(
    year = as.integer(levels(year))[year],
    name = as.character(name),
    value = as.integer(value),
    sex = "Male"
  ) %>%
  select(year, sex, name, n = value)

girls <- pxR::read.px(girls_link) %>%
  as.data.frame() %>%
  filter(!grepl("Rank", Statistic)) %>%
  select(-Statistic) %>%
  as_tibble() %>%
  setNames(tolower(names(.))) %>%
  mutate(
    year = as.integer(levels(year))[year],
    name = as.character(name),
    value = as.integer(value),
    sex = "Female"
  ) %>%
  select(year, sex, name, n = value)

irishbabynames <- bind_rows(boys, girls)

write.csv(irishbabynames, "data-raw/irish-baby-names.csv")
usethis::use_data(irishbabynames, compress = "xz", overwrite = TRUE)
