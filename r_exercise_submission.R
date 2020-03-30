library(dplyr)
library(lubridate)
library(tidyr)

# question 1
least.sales <- function(sales){
  return (sales %>% group_by(Item) %>% summarise(Min_Sale_Amt = min(Sale_amt)))
}

# question 2
sales.year.region <- function(sales){
  return (sales %>% group_by(Year = year(OrderDate), Region)
                %>% summarise(Total_Sales = sum(Sale_amt)))
}

# question 3
days.diff <- function(sales) {
  days.elapsed <- as.integer(Sys.time() - sales$OrderDate)
  return (sales %>% mutate(days_diff = days.elapsed))
}

# question 4
mgr.slsmn <- function(sales) {
  return (sales %>% group_by(Manager) 
                %>% summarise(
                  list_of_salesman = paste(unique(SalesMan), collapse = " "))
          )
}

# question 5
slsmn.units <- function(sales) {
  return (sales %>% group_by(Region) 
                %>% summarise(salesmen_count = length(unique(SalesMan)), 
                              total_sales = sum(Sale_amt))
          )
}

# question 6
sales.pct <- function(sales) {
  total_sales <- sum(sales$Sale_amt)
  return (sales %>% group_by(Manager) 
                %>% summarise(percent_sales = sum(Sale_amt) / total_sales * 100)
          )
}

# question 7
fifth.movie <- function(imdb) {
  return (imdb$imdbRating[5])
}

# question 8
movies <- function(imdb) {
  return (c(toString(imdb$title[which.max(imdb$duration)]), 
            toString(imdb$title[which.min(imdb$duration)])
            )
          )
}

# question 9
sort.df <- function(imdb) {
  return (arrange(imdb, year, desc(imdbRating)))
}

# question 10
subset.df <- function(imdb) {
  return (NA)
}

# question 11
dupl.rows <- function(diamonds) {
  return (nrow(diamonds) - nrow(unique(diamonds)))
}

# question 12
drop.row <- function(diamonds) {
  return (diamonds %>% drop_na(carat, cut))
}

# question 13
sub.numeric <- function(diamonds) {
  return (diamonds %>% select_if(is.numeric))
}

# question 14
volume <- function(diamonds) {
  return (if_else(diamonds$depth > 60, diamonds$x * diamonds$y * diamonds$z, 8))
}

# question 15
impute <- function(diamonds) {
  return (diamonds %>% replace_na(list(price = mean(diamonds$price, na.rm = T))))
}


