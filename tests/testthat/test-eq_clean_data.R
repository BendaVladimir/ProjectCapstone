test_that("check if file exists", {
  expect_true(file.exists( "earthquakes.tsv.gz"))
})

test_that("check 288 row", {
  dataframe <- readr::read_tsv("earthquakes.tsv.gz")
  out <- eq_clean_data(dataframe)
  expect_equal(out$date[288],as.Date("1007-09-17"))
})
