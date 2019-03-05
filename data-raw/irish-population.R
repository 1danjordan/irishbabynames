library(dplyr)

irish_pop_link <- "https://www.cso.ie/px/pxeirestat/Database/eirestat/Annual%20Population%20Estimates/PEA11.px"

population <- pxR::read.px(irish_pop_link) %>%
  as.data.frame() %>%
  as_tibble() %>%
  mutate(age = as.character(Single.Year.of.Age)) %>%
  filter(Sex %in% c("Male", "Female"), age != "All ages") %>%
  transmute(
    year = as.integer(levels(Year))[Year],
    sex = as.character(Sex) %>% tolower(),
    age = case_when(
      age == "Under 1 year" ~ "0 years",
      age == "99 years and over" ~ "99 years",
      TRUE ~ age
    ) %>%
      readr::parse_number() %>%
      as.integer(),
    population = as.integer(value)
  )

readr::write_csv(population, "data-raw/population.csv")
usethis::use_data(population, compress = "xz", overwrite = TRUE)
