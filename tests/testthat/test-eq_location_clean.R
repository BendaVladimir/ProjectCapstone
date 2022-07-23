test_that("check if file exists", {
  expect_true(file.exists( "earthquakes.tsv.gz"))
})

test_that("check 287 row", {
  dataframe <- readr::read_tsv("earthquakes.tsv.gz")
  out <- eq_location_clean(dataframe)
  expect_equal(out$LOCATION_NAME[287],"Kars, Digor, Ani (Armenia)")
})
