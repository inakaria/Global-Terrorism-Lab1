library(ggplot2)
library(dplyr)

png(filename = "Q3 - Number of Successful Terrorist Attacks by Type.png", 
    width = 2500, height = 2500, res = 300)
data <- read.csv("terror.csv")

data_grouped <- data %>% 
                filter(AttackType != "Unknown") %>%
                group_by(Year, AttackType) %>% 
                summarise(Successful_events = sum(Success), .groups = 'drop') %>% ungroup()
                
question3 <- ggplot(data = data_grouped, aes(x = Year, y = Successful_events, colour = AttackType)) + 
    geom_line() +
    geom_point() +
    labs(title = "Number of Successful Terrorist Attacks by Type",
         x = "Year",
         y = "Number of Successful Attacks") +
    theme_gray()

print(question3)
dev.off()
