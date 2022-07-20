#' Function creates dates before new era
#'
#' There is a problem with transforming negative dates to BCE calendar with as_date
#' function. This function creates date before BCE when string is passed to function.
#'
#' @param str Input string of date that will be transformed to BCE
#' @export
#' @examples
#' parse_bce_ymd("1991-01-01")
#' 
parse_bce_ymd <- function(str) {
  regex <- "(\\d{4})(-\\d{2}-\\d{2})"
  match <- stringr::str_match(str, regex)
  years_n <- readr::parse_number(match[, 2]) # Beware the -1 here
  right_side <- match[, 3]
  date <- lubridate::ymd(paste0("0000-",right_side)) - lubridate::years(years_n)
  return(date)
}