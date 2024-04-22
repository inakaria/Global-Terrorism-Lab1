library(ggplot2)
library(dplyr)

png(filename = "NEWQ1 - Number of Successful Terrorist Attacks by Year.png", 
    width = 5500, height = 2000, res = 300)
data <- read.csv("terror.csv")

data$Success <- factor(data$Success, levels = c(0, 1), labels = c("Not Successful", "Successful"))

question0 <- ggplot(data, aes(x = Year, fill = Success)) +
            geom_bar(position = "stack") +
            labs(title = "Number of Attacks by Year",
                    x = "Year",
                    y = "Number of Attacks") +
            scale_fill_manual(values = c("#87eba7", "skyblue")) 

print(question0)
dev.off()
