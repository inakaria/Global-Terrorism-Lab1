library(ggplot2)
library(dplyr)

png(filename = "NEWQ2 - TOP-10 Countries by Number of Successful Terrorist Attacks.png", 
    width = 2500, height = 2500, res = 300)
data <- read.csv("terror.csv")

all_attacks <- aggregate(Success ~ Country, data = data, FUN = length)
succ_attacks <- aggregate(Success ~ Country, data = data, FUN = sum)
data_grouped <- merge(all_attacks, succ_attacks, by = "Country", suffixes = c("_Total", "_")) %>%
                arrange(desc(Success_)) %>%  
                head(10)

names(data_grouped)[names(data_grouped) == "Success_"] <- "Successful"
names(data_grouped)[names(data_grouped) == "Success_Total"] <- "Total"

reshaped_data <- pivot_longer(data_grouped, cols = c(Total, Successful), names_to = "Attacks", values_to = "Value")

question2 <- ggplot(reshaped_data, aes(x = reorder(Country, Value), y = Value, fill = Attacks)) + 
    geom_bar(stat = "identity", position = "dodge") +
    coord_flip() +
    labs(title = "TOP-10 Countries by Number of Successful Terrorist Attacks",
         x = "Country",
         y = "Number of Terrorist Attacks") +
    scale_fill_manual(values = c("skyblue", "#87eba7")) 

print(question2)
dev.off()
