#' Cleaning variable LOCATION_NAME from inclusion of COUNTRY
#'
#' Function will be used to transform column LOCATION_NAME to clean form.
#' First part of process is removing COUNTRY from LOCATION_NAME with function 
#' str_remove_all.
#' Secund part is transforming LOCATION_NAME to title caps.
#' Final part of function str_remove_all is used to replace : and ; 
#' in LOCATION_NAME to clean string.
#'
#' @param dataframe Dataframe to be transformed
#' @export
#' @examples
#' \dontrun{
#' filename<-system.file("data","earthquakes.tsv.gz",package="ProjectCapstone")
#' dataframe <- read_delim(filename)
#' dataframe <- eq_clean_data(dataframe)
#' eq_clean_data(dataframe)
#' }
#' 
eq_location_clean <- function(dataframe) {
  dataframe %>%
    mutate(LOCATION_NAME = stringr::str_replace_all(stringr::str_replace_all(stringr::str_to_title(stringr::str_replace_all(LOCATION_NAME, COUNTRY, "")),":"," "), "; ", ""),
           LOCATION_NAME = ifelse(LOCATION_NAME == "", paste("Only country is present:",stringr::str_to_title(COUNTRY)), LOCATION_NAME)
    )
}