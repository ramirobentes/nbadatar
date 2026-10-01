# Action type codes

Meanings of the `msg_type` and `act_type` code pairs used in the
play-by-play data.

## Usage

``` r
act_type_codes
```

## Format

A tibble with one row per code pair:

- msg_type:

  Event type code.

- act_type:

  Sub-type code within that event type.

- description:

  What the code means.

## Examples

``` r
if (FALSE) { # \dontrun{
load_pbp(2025) |>
  dplyr::left_join(act_type_codes, by = c("msg_type", "act_type"))
} # }
```
