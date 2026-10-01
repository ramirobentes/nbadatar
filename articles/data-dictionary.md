# Data dictionary

Every column in the three tables, with what it holds and which seasons
it covers. Use the search box to filter, or click a column header to
sort.

## Columns

## Action type codes

The `msg_type` and `act_type` columns in the play-by-play data are
numeric codes. Join this table to get their meanings:

``` r

load_pbp(2025) |>
  dplyr::left_join(act_type_codes, by = c("msg_type", "act_type"))
```
