students = data.frame(
  name = c('john', 'sara', 'alex'),
  score = c(44, 88, 90)
)
print(students)

write.csv(students, 'students.csv', row.names = FALSE)
