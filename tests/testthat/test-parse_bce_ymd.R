testthat::test_that("Is date date", {
  testthat::expect_true(
    lubridate::is.Date(parse_bce_ymd("2022-05-05"))
  )
})

testthat::test_that("Is date date", {
  testthat::expect_lt(
    parse_bce_ymd("2022-05-05"),lubridate::as_date("2022-01-01")

  )
})
