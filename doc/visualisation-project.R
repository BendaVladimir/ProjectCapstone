## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ProjectCapstone)

## ----clean_data_example-------------------------------------------------------
filename<-system.file("extdata","earthquakes.tsv.gz",package="ProjectCapstone")
dataframe <- readr::read_delim(filename)
data_test <- eq_clean_data(dataframe)
print(head(data_test))

## ----chart_display------------------------------------------------------------

filename<-system.file("extdata","earthquakes.tsv.gz",package="ProjectCapstone")
dataframe <- readr::read_delim(filename)

dataframe %>%
  eq_clean_data() %>%
  eq_location_clean() %>%
  dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(date) >= 1980) %>%
  eq_map(annot_col = "popup_text")


