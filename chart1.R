library(dplyr)
library(ggplot2)

checkouts <- read.csv("checkouts.csv")

checkouts$date <- as.Date(paste(checkouts$CheckoutYear, checkouts$CheckoutMonth, "01", sep = "-"))

# Summarize checkouts by year and month
monthly_audiobook_checkouts <- checkouts %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  group_by(date) %>%
  summarize(total_checkouts = sum(Checkouts))

monthly_ebook_checkouts <- checkouts %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(date) %>%
  summarize(total_checkouts = sum(Checkouts))

monthly_book_checkouts <- checkouts %>%
  filter(MaterialType == "BOOK") %>%
  group_by(date) %>%
  summarize(total_checkouts = sum(Checkouts))

# Create line plot of monthly ebook, audiobook, and book checkouts
chart1 <- ggplot(data = NULL) +
  geom_point(data =monthly_audiobook_checkouts, aes(x=date, y=total_checkouts, color = 'Audiobook')) +
  geom_point(data = monthly_ebook_checkouts, aes(x=date, y=total_checkouts, color = 'Ebook')) +
  geom_point(data =monthly_book_checkouts, aes(x=date, y=total_checkouts, color = 'Book')) +
  labs(x = "Date (2017-2023)", y = "Total Checkouts", 
       title = "Monthly Audiobook, Ebook, and Book Checkouts", color = "Material Type") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(hjust = 1)) 
