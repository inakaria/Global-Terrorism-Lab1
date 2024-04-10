library(ggplot2)

png(filename = "Number of Successful Terrorist Attacks by Year.png", width = 1600, height = 600)
data <- read.csv("terror_clean.csv")


sum_success <- aggregate(Success ~ Year, data = data, FUN = sum)

question1 <- ggplot(sum_success, aes(x = Year, y = Success)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Number of Successful Terrorist Attacks by Year",
       x = "Year",
       y = "Number of Successful Attacks") +
  geom_text(aes(label = Success), vjust = -0.3)

print(question1)
dev.off()
