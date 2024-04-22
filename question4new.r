library(ggplot2)
library(dplyr)
library(treemap)

png(filename = "NEWQ4 - TOP-50 Terrorist Groups by Number of Terrorist Attacks.png", 
    width = 2500, height = 2500, res = 300)
data <- read.csv("terror.csv")

data_grouped <- data %>% 
                filter(Group != "Unknown") %>%
                group_by(Group) %>% 
                summarise(Total_events = n(), .groups = 'drop') %>% ungroup() %>%
                top_n(n = 50)

question4 <- treemap(data_grouped, 
        index=c("Group"), 
        vSize = "Total_events",  
        palette = "Blues", 
        title="TOP-50 Terrorist Groups by Number of Terrorist Attacks", 
        fontsize.title = 14 
)

print(question4)
dev.off()
