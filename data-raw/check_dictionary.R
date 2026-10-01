## Compares the dictionary against the live data. Run occasionally,
## especially after the data source changes.

library(nbadatar)

actual <- purrr::list_rbind(list(
  tibble::tibble(table = "pbp",          column = names(load_pbp(2025))),
  tibble::tibble(table = "possessions",  column = names(load_possessions(2025))),
  tibble::tibble(table = "lineup_stats", column = names(load_lineup_stats(2025)))
))

dplyr::anti_join(actual, dictionary, by = c("table", "column"))   # undocumented
dplyr::anti_join(dictionary, actual, by = c("table", "column"))   # no longer in the data
