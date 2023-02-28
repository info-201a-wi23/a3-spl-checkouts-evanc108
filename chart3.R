library(dplyr)
library(ggplot2)

checkouts <- read.csv("checkouts.csv")

checkouts$date <- as.Date(paste(checkouts$CheckoutYear, checkouts$CheckoutMonth, "01", sep = "-"))

# Summarize checkouts by year and month
monthly_jk_checkouts <- checkouts %>%
  filter(Creator == "Rowling, J. K.") %>%
  group_by(date) %>%
  summarize(total_checkouts = sum(Checkouts))

monthly_seuss_checkouts <- checkouts %>%
  filter(Creator == "Seuss, Dr.") %>%
  group_by(date) %>%
  summarize(total_checkouts = sum(Checkouts))

# Create line plot of monthly ebook, audiobook, and book checkouts
chart3 <- ggplot(data = NULL) +
  geom_line(data =monthly_jk_checkouts, aes(x=date, y=total_checkouts, color = 'J.K. Rowling')) +
  geom_line(data = monthly_seuss_checkouts, aes(x=date, y=total_checkouts, color = 'Dr. Seuss')) +
  labs(x = "Date (2017-2023)", y = "Total Checkouts", 
       title = "Monthly Checkouts of J.K. Rowling and Dr. Seuss", color = "Author") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(hjust = 1)) 
