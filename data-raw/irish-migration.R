library(dplyr)

migration <- "https://www.cso.ie/px/pxeirestat/Database/eirestat/Annual%20Population%20Estimates/PEA03.px" %>%
  pxR::read.px() %>%
  as_tibble() %>%
  filter(
    Inward.or.Outward.Flow != "Net migration",
    Sex != "Both sexes",
    Age.Group != "All ages"
  ) %>%
  transmute(
    year = as.integer(levels(Year))[Year],
    sex = as.character(Sex) %>% tolower(),
    age_group = gsub("\\syears", "", as.character(Age.Group)),
    flow = ifelse(
      grepl("Emigrants", Inward.or.Outward.Flow),
      "outward",
      "inward"
    ),
    n = as.integer(value * 1000)
  )

readr::write_csv(migration, "data-raw/migration.csv")
usethis::use_data(migration, compress = "xz", overwrite = TRUE)
