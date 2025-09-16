# Create first data frame
df1 <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Alice", "Bob", "Charlie")
)

# Create second data frame
df2 <- data.frame(
  Age = c(25, 30, 22),
  City = c("New York", "Los Angeles", "Chicago")
)

# Display both
print(df1)
print(df2)


cols_joined = cbind(df1, df2)
print(cols_joined)


df3 <- data.frame(
  ID = c(4, 5),
  Name = c("David", "Eva")
)


rows_joined = rbind(df1, df3)
print(rows_joined)