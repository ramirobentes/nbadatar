#' Data dictionary
#'
#' Descriptions of every column in the `pbp`, `possessions` and
#' `lineup_stats` tables.
#'
#' @format A tibble with one row per column:
#' \describe{
#'   \item{table}{Table the column belongs to.}
#'   \item{column}{Column name.}
#'   \item{type}{R type.}
#'   \item{description}{What the column holds.}
#'   \item{seasons}{Seasons the column is available for.}
#' }
"dictionary"

#' Action type codes
#'
#' Meanings of the `msg_type` and `act_type` code pairs used in the
#' play-by-play data.
#'
#' @format A tibble with one row per code pair:
#' \describe{
#'   \item{msg_type}{Event type code.}
#'   \item{act_type}{Sub-type code within that event type.}
#'   \item{description}{What the code means.}
#' }
#'
#' @examples
#' \dontrun{
#' load_pbp(2025) |>
#'   dplyr::left_join(act_type_codes, by = c("msg_type", "act_type"))
#' }
"act_type_codes"
