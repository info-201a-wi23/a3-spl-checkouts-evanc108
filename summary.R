library(dplyr)
library(tidyr)
library("stringr")
  
checkouts <- read.csv("checkouts.csv", stringsAsFactors = FALSE)

#What is the month or year with the most/least checkouts for a book that you're interested in?

outside_yearly_checkout <- checkouts %>%
  filter(Title == "Outside") %>%
  group_by(CheckoutYear) %>%
  summarise(outside_checkouts = sum(Checkouts))

# Calculated Value 1
outside_most_yearly_checkouts <- outside_yearly_checkout %>%
  filter(outside_checkouts == max(outside_checkouts)) %>%
  pull(CheckoutYear)
  
# Calculated Value 2
outside_least_yearly_checkouts <- outside_yearly_checkout %>%
  filter(outside_checkouts == min(outside_checkouts)) %>%
  pull(CheckoutYear)

#What is the month or year with the most/least checkouts for ebooks?
ebook_yearly_checkouts <- checkouts %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(total_checkouts = sum(Checkouts))

# Calculated Value 3
ebook_most_yearly_checkouts <- ebook_yearly_checkouts %>%
  filter(total_checkouts == max(total_checkouts)) %>%
  pull(CheckoutYear)

# Calculated Value 4
ebook_least_yearly_checkouts <- ebook_yearly_checkouts %>%
  filter(total_checkouts == min(total_checkouts)) %>%
  pull(CheckoutYear)
  
#How has the number of print book checkouts changed over time?
# Calculated Value 5
book_type_checkouts <- checkouts %>%
  filter(UsageClass == "Physical") %>%
  group_by(CheckoutYear) %>%
  summarise(print_checkouts = sum(Checkouts))

print_checkout_difference <- book_type_checkouts$print_checkouts[book_type_checkouts$CheckoutYear == 2017] -
  book_type_checkouts$print_checkouts[book_type_checkouts$CheckoutYear == 2022]
 
