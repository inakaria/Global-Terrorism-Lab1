library(ggplot2)

png(filename = "Missing Data.png", width = 1000, height = 1000)
data <- read.csv("terror.csv")

data <- data[, c("Year", "Country", "AttackType", "Killed", "Success", "Group", "WeaponType", "Target")]
data[data == "Unknown"] <- NA
percent_unknown <- colMeans(is.na(subset_data), na.rm = TRUE) * 100
data_new <- data.frame(Column = names(percent_unknown), Percent_Unknown = percent_unknown)

unknwn <- ggplot(data_new, aes(x = Column, y = Percent_Unknown)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Percentage of Missing Values", x = "Column", y = "") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label = paste0(round(Percent_Unknown, 2), "%")), vjust = -0.5, size = 3)

print(unknwn)
dev.off()
