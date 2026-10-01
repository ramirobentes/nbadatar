## Builds the package datasets from the CSVs in data-raw/.
## Edit the CSVs, then source this file, then run devtools::document().

dictionary <- readr::read_csv("data-raw/dictionary.csv", show_col_types = FALSE)

stopifnot(
  !any(is.na(dictionary$description)),
  !any(dictionary$description == ""),
  !any(duplicated(dictionary[c("table", "column")]))
)

usethis::use_data(dictionary, overwrite = TRUE)

act_type_codes <- readr::read_csv("data-raw/act_type_codes.csv", show_col_types = FALSE)
usethis::use_data(act_type_codes, overwrite = TRUE)
