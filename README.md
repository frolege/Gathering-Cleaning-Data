# Gathering-Cleaning-Data
This repository contains R code for tidying up data for further analysis 


##Running the analysis
run_analysis.R is responsible for gathering, cleaning, and analyzing the data. It expects the data to be under ./Session3. It depends on 2 packages: reshape2 and dplyr.

After running the analysis, a tidy dataset is written out to tidy_data.txt.

###Steps to run the analysis
  1. fork and clone this repository
  2. in the R terminal, set your current working directory to the project root
  3. ```install.packages("reshape2")``` if you have not already installed ```reshape2```
  4. ```install.packages("plyr")``` if you have not already installed ```plyr```
  4. source('./run_analysis.R')
  
### Script that you can paste into R to view my tidy data (in a more readable format)
address <- "https://s3.amazonaws.com/coursera-uploads/user-6dc492427c4f7756214a4c9f/973501/asst-3/81f8a110ff0211e48d52fb914190465f.txt"

address <- sub("^https", "http", address)

data <- read.table(url(address), header = TRUE)

View(data)
