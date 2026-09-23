test_that("season_type is validated", {
  expect_error(load_pbp(2025, "foo"))
})

test_that("out-of-range seasons are rejected", {
  expect_error(load_pbp(1990), "1997")
  expect_error(load_pbp(2100), "1997")
})

test_that("non-integer seasons are rejected", {
  expect_error(load_pbp(2025.5), "whole numbers")
  expect_error(load_pbp("2025"), "whole numbers")
})
