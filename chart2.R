options(dplyr.summarise.inform = FALSE)
library(dplyr)
library(ggplot2)

checkouts <- read.csv("checkouts.csv")

book_type_checkouts <- checkouts %>%
  filter(UsageClass %in% c("Physical", "Digital")) %>%
  group_by(CheckoutYear, UsageClass) %>%
  summarise(total_checkouts = sum(Checkouts))

chart2 <- ggplot(book_type_checkouts, aes(x=CheckoutYear, y=total_checkouts, fill=UsageClass)) +
  geom_bar(stat='identity') +
  labs(title = "Number of Physical vs Digital Book Checkouts over the Years", 
       x="Year (2017-2023)", y="Checkouts", fill="Book Type") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(hjust = 1))
