library(dplyr)

irish_pop_link <- "https://www.cso.ie/px/pxeirestat/Database/eirestat/Annual%20Population%20Estimates/PEA11.px"

irishpopulation <- pxR::read.px(irish_pop_link) %>%
  as.data.frame() %>%
  as_tibble() %>%
  mutate(age = as.character(Single.Year.of.Age)) %>%
  filter(Sex %in% c("Male", "Female"), age != "All ages") %>%
  transmute(
    year = as.integer(levels(Year))[Year],
    sex = as.character(Sex),
    age = case_when(
      age == "Under 1 year" ~ "0 years",
      age == "99 years and over" ~ "99 years",
      TRUE ~ age
    ) %>% readr::parse_number(),
    population = value
  )

readr::write_csv(irishpopulation, "data-raw/irish-population.csv")
usethis::use_data(irishpopulation, compress = "xz", overwrite = TRUE)
