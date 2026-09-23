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
load_pbp <- function(seasons = most_recent_season(), season_type = c("regular", "playoffs")) {
  load_table("pbp", seasons, season_type)
}

#' @rdname load_pbp
#' @export
load_possessions <- function(seasons = most_recent_season(), season_type = c("regular", "playoffs")) {
  load_table("possessions", seasons, season_type)
}

#' @rdname load_pbp
#' @export
load_lineup_stats <- function(seasons = most_recent_season(), season_type = c("regular", "playoffs")) {
  load_table("lineup_stats", seasons, season_type)
}

load_table <- function(table, seasons, season_type) {
  season_type <- match.arg(season_type, c("regular", "playoffs"))

  if (!is.numeric(seasons) || any(seasons %% 1 != 0)) {
    cli::cli_abort("{.arg seasons} must be whole numbers, e.g. {.code 2025} or {.code 2023:2025}.")
  }
  bad <- seasons[seasons < 1997 | seasons > most_recent_season()]
  if (length(bad) > 0) {
    cli::cli_abort(c(
      "Data is available for seasons 1997 to {most_recent_season()}.",
      "x" = "Not available: {bad}."
    ))
  }

  dfs <- lapply(seasons, function(s) {
    url <- sprintf(
      "https://github.com/ramirobentes/nba_data/releases/download/%s/%s_%s_%d.parquet",
      table, table, season_type, s
    )
    tryCatch(
      arrow::read_parquet(url),
      error = function(e) {
        cli::cli_abort("Couldn't download {table} for {s} ({season_type}).", parent = e)
      }
    )
  })

  do.call(vctrs::vec_rbind, dfs)
}

#' Most recent season with data available
#'
#' @return An integer season, labelled by the year the season ends.
#' @export
most_recent_season <- function() {
  today <- Sys.Date()
  as.integer(format(today, "%Y")) + (as.integer(format(today, "%m")) >= 10L)
}
