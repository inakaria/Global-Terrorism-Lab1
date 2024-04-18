library(ggplot2)

png(filename = "Missing Data.png", 
    width = 2500, height = 2500, res = 300)
data <- read.csv("terror.csv")

data <- data[, c("Year", "Country", "AttackType", "Killed", "Success", "Group", "WeaponType", "Target")]
data[data == "Unknown"] <- NA

percent_unknown <- colSums(is.na(data)) / nrow(data) * 100
data_new <- data.frame(Column = names(percent_unknown), Percent_Unknown = percent_unknown)

unknwn <- ggplot(data_new, aes(x = Column, y = Percent_Unknown)) +
  geom_bar(stat = "identity", fill = "#a50f15") +
  labs(title = "Percentage of Missing Values in Columns", x = "Column", y = "") +
  geom_text(aes(label = paste0(round(Percent_Unknown, 2), "%")), vjust = -0.9)

print(unknwn)
dev.off()
