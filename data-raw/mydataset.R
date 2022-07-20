## code to prepare `mydataset` dataset goes here

library(readr)

dataframe <- read_delim("data-raw/earthquakes.tsv.gz")

usethis::use_data(mydataset, overwrite = TRUE)
