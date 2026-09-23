
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nbadatar

nbadatar loads NBA play-by-play, possession and lineup data covering 30
seasons (1996-97 through 2025-26), for both the regular season and the
playoffs. The current season is updated daily.

The data is hosted as Parquet files at
[ramirobentes/nba_data](https://github.com/ramirobentes/nba_data), which
also documents the tables and their columns.

## Installation

``` r
# install.packages("pak")
pak::pak("ramirobentes/nbadatar")
```

## Usage

``` r
library(nbadatar)

pbp <- load_pbp(2025)
dim(pbp)
#> [1] 592259     61
```

Seasons are labelled by the year they end, so `2025` is the 2024-25
season. Pass a vector to load several at once, and use `season_type` for
the playoffs:

``` r
playoffs <- load_pbp(2023:2025, season_type = "playoffs")
dim(playoffs)
#> [1] 117355     61
```

The same arguments work for the other two tables:

``` r
load_possessions(2025)
load_lineup_stats(2025)
```

## Caching

Downloads are cached for the rest of your R session, so loading the same
season again is instant. Call `clear_cache()` to force a fresh download,
which matters during the season when the current season’s files change
daily.

## Notes on coverage

The NBA’s feeds changed over the years, so some columns only exist for
part of the range. Every file has every column, with `NA` where the
source didn’t provide one. See the [nba_data
README](https://github.com/ramirobentes/nba_data#important-notes-on-coverage)
for the details.
