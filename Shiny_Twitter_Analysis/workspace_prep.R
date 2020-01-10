# clean up the memory of current R session:
rm(list = ls(all = TRUE))

# prefer less than 5 decimal places
options(digits = 4)

#suppress scientific notation: i.e. 2.4e5 instead of 2,400,367
options(scipen = 999)

#loading the required library packages
library(data.table)
library(sqldf)
library(bit64)
library(plyr)
library(sqldf)
library(heatmaply)
library(plotly)
library(htmltools)
library(ggvis)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(ggthemes)
library(ztable)
library(maps)
library(leaflet)
library(wordcloud)
library(qdap)
library(tm)
library(stringr)
library(httpuv)
library(httr)
library(openssl)
library(shiny)

