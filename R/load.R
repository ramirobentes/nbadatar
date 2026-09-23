#' Load NBA play-by-play data
#'
#' @param seasons Integer vector of seasons, labelled by the year the season
#'   ends (e.g. 2025 for 2024-25).
#' @param season_type Either "regular" or "playoffs".
#'
#' @return A data frame of play-by-play events.
#' @export
#'
#' @examples
#' \dontrun{
#' load_pbp(2025)
#' load_pbp(2023:2025, season_type = "playoffs")
#' }
load_pbp <- function(seasons, season_type = c("regular", "playoffs")) {
  load_table("pbp", seasons, season_type)
}

#' @rdname load_pbp
#' @export
load_possessions <- function(seasons, season_type = c("regular", "playoffs")) {
  load_table("possessions", seasons, season_type)
}

#' @rdname load_pbp
#' @export
load_lineup_stats <- function(seasons, season_type = c("regular", "playoffs")) {
  load_table("lineup_stats", seasons, season_type)
}

load_table <- function(table, seasons, season_type) {
  season_type <- match.arg(season_type, c("regular", "playoffs"))

  urls <- sprintf(
    "https://github.com/ramirobentes/nba_data/releases/download/%s/%s_%s_%d.parquet",
    table, table, season_type, seasons
  )

  dfs <- lapply(urls, arrow::read_parquet)
  do.call(rbind, dfs)
}
