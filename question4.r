library(ggplot2)
library(dplyr)
library(treemap)

png(filename = "TOP-50 Terrorist Groups by Number of Successful Terrorist Attacks.png", width = 1000, height = 1000)
data <- read.csv("terror.csv")

data_grouped <- data %>% 
                filter(Group != "Unknown") %>%
                group_by(Group) %>% 
                summarise(Successful_events = sum(Success), .groups = 'drop') %>% ungroup() %>%
                top_n(n = 50)

question4 <- treemap(data_grouped, 
        index=c("Group"), 
        vSize = "Successful_events",  
        palette = "Reds", 
        title="TOP-50 Terrorist Groups by Number of Successful Terrorist Attacks", 
        fontsize.title = 14 
)

print(question4)
dev.off()
