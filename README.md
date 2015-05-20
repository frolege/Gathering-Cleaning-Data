# Gathering-Cleaning-Data
This repository contains R code for tidying up data for further analysis 


##Running the analysis
run_analysis.R is responsible for gathering, cleaning, and analyzing the data. It expects the data to be under ./Session3. It depends on 2 packages: reshape2 and dplyr. After running the analysis, a tidy dataset is written out to tidy_data.txt.

###Steps to run the analysis
  1. fork and clone this repository
  2. in the R terminal, set your current working directory to the project root
  3. ```install.packages("reshape2")``` if you have not already installed ```reshape2```
  4. ```install.packages("plyr")``` if you have not already installed ```plyr```
  4. source('./run_analysis.R')
