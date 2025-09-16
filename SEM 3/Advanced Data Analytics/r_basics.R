a = 1
b = 4

print(paste(a, b))

add = a + b
print(add)

print(a-b)

print(a * b)

print(a/b)


# vectors - homogenous

v = c(4, 5,6, 6,6)
print(v)
print(class(v))

# list - heterogenous
l1 = list(1, "a", TRUE)
print(l1)


# matrix - 2d homogenous
m1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = T)

print(m1)
print(m1[1,2])

# array - more than 2d vectors homogenous
v1 <- c(1, 2,2,3,4,4)
v2 <- c(5,6,7,8,9,0)

a1 <- array(c(v1, v2), dim = c(2,3,2))
print(a1)
print(class(a1))


# factors
colors1 = c("blue", "red", "pink")
as.factor(colors1) -> colors1

print(colors1)


# dataframe --> 2D heterogenous

data.frame(fruit_name = c('mango', 'guava', 'apple', 'chiku'),
           fruit_cost = c(10, 20, 30, 40)) -> fruits

print(fruits)
print(fruits$fruit_name)


