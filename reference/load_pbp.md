# Load NBA play-by-play data

Load NBA play-by-play data

## Usage

``` r
load_pbp(
  seasons = most_recent_season(),
  season_type = c("regular", "playoffs")
)

load_possessions(
  seasons = most_recent_season(),
  season_type = c("regular", "playoffs")
)

load_lineup_stats(
  seasons = most_recent_season(),
  season_type = c("regular", "playoffs")
)
```

## Arguments

- seasons:

  Integer vector of seasons, labelled by the year the season ends (e.g.
  2025 for 2024-25).

- season_type:

  Either "regular" or "playoffs".

## Value

A data frame of play-by-play events.

## Examples

``` r
if (FALSE) { # \dontrun{
load_pbp(2025)
load_pbp(2023:2025, season_type = "playoffs")
} # }
```
