globalVariables(c("COUNTRY", "DAY", "LATITUDE", "LOCATION_NAME", "LONGITUDE", "MONTH", "YEAR" , "bce"))

#' Function is run to clean data from NOAA and transforms to prescribed form
#'
#' This function used to clean data from NOAA. File is loaded to dataframe from
#' TSV file in gz file. first part of function is used to create bce variable,
#' which is used to determine which function will be used to transform to data.
#' In case that there is a negative sign then parse_bce_ymd will be used to transform
#' date variable. YEAR, MONTH and DAY will be transformed to string character and padded
#' to have format YYYY MM DD. Creation of date is dependent on bce variable. If bce
#' variable is TRUE then parse_bce_ymd function will be used.
#' Final part of function is used to transform LATITUDE and LONGITUDE to numerical
#' format.
#'
#'
#' @param datataframe Dataframe of loaded NOAA data
#' @export
#' @examples
#' \dontrun{
#' filename<-system.file("data","earthquakes.tsv.gz",package="ProjectCapstone")
#' dataframe <- read_delim(filename)
#' eq_clean_data(dataframe)
#' }
#'
eq_clean_data <- function(dataframe) {
  dataframe %>%
    mutate(bce = grepl("-",as.character(YEAR)),
           YEAR = stringr::str_pad(as.character(stringr::str_replace(tidyr::replace_na(YEAR,0),"-","")),4, side = "left", pad = "0"),
           MONTH = stringr::str_pad(as.character(tidyr::replace_na(MONTH,1)),2, side = "left", pad = "0"),
           DAY = stringr::str_pad(as.character(tidyr::replace_na(DAY,1)),2, side = "left", pad = "0"),
           date = paste0(YEAR,"-", MONTH, "-", DAY),
           date = lubridate::as_date(ifelse(bce, parse_bce_ymd(date), as.Date(date))),
           LATITUDE = as.numeric(LATITUDE),
           LONGITUDE = as.numeric(LONGITUDE)

    )
}
