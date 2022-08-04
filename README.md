Main goal of this package is to demonstrate process of cleaning data and custom graphical display of earthquake data.

## Cleaning data

Cleaning data in this project consists of following steps:

1.	A date column created by uniting the year, month, day and converting it to the Date class
2.	LATITUDE and LONGITUDE columns converted to numeric class
3.	In addition, write a function eq_location_clean() that cleans the LOCATION_NAME column by stripping out the country name (including the colon) and converts names to title case (as opposed to all caps). This will be needed later for annotating visualizations. This function should be applied to the raw data to produce a cleaned-up version of the LOCATION_NAME column. 

Part 1was problematic because date values contained negative values and lubridate function didn’t interpreted data correctly. Additional function was used to transform data to BCE and CE format. Cleaning data with function eq_location_clean, was stringr package was used to clean-up string.

## Display of earthquake data on map

Previous part of package was used to clean data that would be used to present them on map. 
Before displaying data on map and two custom geom from ggplo2 had to be created:

1.	geom_timeline() for plotting a time line of earthquakes ranging from xmin to xmaxdates with a point for each earthquake. Optional aesthetics include color, size, and alpha (for transparency). The xaesthetic is a date and an optional y aesthetic is a factor indicating some stratification in which case multiple time lines will be plotted for each level of the factor (e.g. country).

2.	geom_timeline_label() for adding annotations to the earthquake data. This geom adds a vertical line to each data point with a text annotation (e.g. the location of the earthquake) attached to each line. There should be an option to subset to n_max number of earthquakes, where we take the n_max largest (by magnitude) earthquakes. Aesthetics are x, which is the date of the earthquake and label which takes the column name from which annotations will be obtained.

Final part of visualization part is done by function eq_map, which takes an argument data containing the filtered data frame with earthquakes to visualize. The function maps the epicenters (LATITUDE/LONGITUDE) and annotates each point with in pop up window containing annotation data stored in a column of the data frame. The user should be able to choose which column is used for the annotation in the pop-up with a function argument named annot_col. Each earthquake should be shown with a circle, and the radius of the circle should be proportional to the earthquake's magnitude (EQ_PRIMARY).
