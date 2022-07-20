test_that("multiplication works", {
  expect_true(file.exists(folder <- system.file("data-raw", "earthquakes.tsv.gz", package = "ProjectCapstone")))
})
