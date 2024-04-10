library(ggplot2)
library(dplyr)

png(filename = "Number of Successful Terrorist Attacks by Type.png", width = 1000, height = 1000)
data <- read.csv("terror_clean.csv") %>% filter(AttackType != "Unknown")

data_grouped <- data %>% group_by(Year, AttackType) %>% summarise(Successful_events = sum(Success), .groups = 'drop') %>% ungroup()
question3 <- ggplot(data = data_grouped, aes(x = Year, y = Successful_events, colour = AttackType)) + 
    geom_line() +
    geom_point() +
    labs(title = "Number of Successful Terrorist Attacks by Type",
         x = "Year",
         y = "Number of Successful Attacks") +
    theme_gray()

print(question3)
dev.off()
