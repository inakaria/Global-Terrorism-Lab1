library(ggplot2)
library(dplyr)

png(filename = "TOP-10 Countries by Number of Successful Terrorist Attacks.png", width = 1000, height = 1000)
data <- read.csv("terror.csv")

data_grouped <- aggregate(Success ~ Country, data = data, FUN = sum) %>% top_n(n=10)

question2 <- ggplot(data = data_grouped, aes(x = reorder(Country, Success), y = Success)) +
    geom_bar(stat = "identity", fill = "skyblue") +
    coord_flip() +
    labs(title = "TOP-10 Countries by Number of Successful Terrorist Attacks",
         x = "Country",
         y = "Number of Successful Terrorist Attacks")

print(question2)
dev.off()
