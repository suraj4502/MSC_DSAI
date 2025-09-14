library(dplyr)

data <- data.frame(
  name = c("A", "B", "C"),
  Age = c(20, 25, 30),
  Score = c(85, 90, 95)
)

filtered <- data %>%
  filter(Age > 21) %>%
  select(Name, Score)

print(filtered)