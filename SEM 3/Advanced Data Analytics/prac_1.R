students <- data.frame(
  "name" = c("suraj", "suraj", "colby", "colby", "diego"),
  "subject" = c("Math", "Science", "Math", "English", "Science"),
  "Score" = c(90, 88, 45, 66, 99),
  "Age" = c(23,22,21, 20, 19)
)

#mean score by name
aggregate(Score ~ name, data =students, FUN = mean)
by(students$Score, students$subject, summary)


# Mean score by Subject and Name 
aggregate(Score ~ name+ subject, data =students, FUN = mean)
tapply(students$Score, list(students$name, students$subject), mean)


library('dplyr')
students %>%
  group_by(name) %>%
  summarise(Avg_Score = mean(Score, na.rm = TRUE))

students %>%
  group_by(name, subject) %>%
  summarise(avg_score= mean(Score, na.rm = TRUE))



#jsonlite
library(jsonlite)

studs <- data.frame(
  name = c("John", "Lisa", "Alex"),
  score = c(85, 90, 88)
)

#stud_json <- toJSON(studs, pretty = TRUE)
print(studs)

write.csv(studs, "STUDS.csv", row.names = FALSE)

