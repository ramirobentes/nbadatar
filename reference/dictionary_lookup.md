# Look up column descriptions

Look up column descriptions

## Usage

``` r
dictionary_lookup(table = NULL, column = NULL)
```

## Arguments

- table:

  Optionally filter to one table.

- column:

  Optionally filter to columns matching this text.

## Value

A tibble of dictionary entries.

## Examples

``` r
dictionary_lookup("pbp", "shot")
#> # A tibble: 6 × 5
#>   table column             type      description                         seasons
#>   <chr> <chr>              <chr>     <chr>                               <chr>  
#> 1 pbp   shot_pts           numeric   Points scored on this event.        all    
#> 2 pbp   shot_pts_home      numeric   Points credited to the home team a… all    
#> 3 pbp   shot_pts_away      numeric   Same as shot_pts_home, for the awa… all    
#> 4 pbp   shot_result        character Whether the shot was made or misse… all    
#> 5 pbp   shot_action_number numeric   Event number for the shot that cau… all    
#> 6 pbp   shot_distance      numeric   Shot distance in feet.              all    
```
