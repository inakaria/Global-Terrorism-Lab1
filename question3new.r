library(ggplot2)
library(dplyr)
library(cowplot)

png(filename = "NEWQ3 - Number of Terrorist Attacks by Type.png", 
    width = 5000, height = 2000, res = 300)
data <- read.csv("terror.csv")

data_succ <- data %>% 
                filter(AttackType != "Unknown") %>%
                group_by(Year, AttackType) %>% 
                summarise(Successful_events = sum(Success), .groups = 'drop') %>% ungroup()

data_notsucc <- data %>% 
                filter(AttackType != "Unknown") %>%
                group_by(Year, AttackType) %>% 
                summarise(Total_events = n()-sum(Success), .groups = 'drop') %>% ungroup()
                
question31 <- ggplot(data = data_succ, aes(x = Year, y = Successful_events, colour = AttackType)) + 
    geom_line() +
    geom_point() +
    labs(title = "Number of Successful Terrorist Attacks by Type",
         x = "Year",
         y = "Number of Successful Attacks") +
    theme_gray()

question32 <- ggplot(data = data_notsucc, aes(x = Year, y = Total_events, colour = AttackType)) + 
    geom_line() +
    geom_point() +
    labs(title = "Number of Terrorist Attacks by Type",
         x = "Year",
         y = "Number of Unsuccessful Attacks") +
    theme_gray()

combined_plot <- plot_grid(question31, question32, ncol=2) 
print(combined_plot)
dev.off()
