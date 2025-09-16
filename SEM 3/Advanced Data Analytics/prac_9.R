data("iris")
head(iris)

str(iris)

summary(iris)


pie(table(iris$Species), 
    col = c('red', 'yellow', 'green'),
    main = "species Distribution.")

#histogram of sepal Lenght
hist(iris$Sepal.Length, col = 'pink',
     main = "histogram of sepal length",
     xlab = "speal length")


# box plot
boxplot(iris$Petal.Width, col = 'cyan',
        main = "histogram of petal width")

boxplot(Petal.Width~Species, data = iris , col = c('cyan', 'red', 'yellow'),
        main = "histogram of petal width by species")

# frequecny table of species

print(table(iris$Species))


# scatter plot
plot(iris$Sepal.Length, iris$Petal.Width,
     col =  iris$Species, pch = 22,
     main = "length vs width",
     xlab = "sepal Length",
     ylab = "peral width")


# corr
print(cor(iris[,1:4])
)

# pairplot
pairs(iris[, 1:4], col = iris$Species, 
      main = 'pairplot')


#Principal Component Analysis (PCA) 

pca <- prcomp(iris[, 1:4], scale. = TRUE)
biplot(pca, col = c('gray', 'yellow'))

print(summary(pca))