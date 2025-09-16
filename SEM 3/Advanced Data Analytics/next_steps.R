#View(iris)
#head(iris)
tail(iris)
table(iris$Sepal.Length)
min(iris$Sepal.Length)
range(iris$Petal.Width)


print(iris$Sepal.Length[1])

if (iris$Sepal.Length[1] > 4){
  print("MORE THAN 4")
}else{
  print("LESS THAN 4")
}


## LOOPS

vec1 <- 1:9
print(vec1)

for (i in vec1){
  print(i + 2)
}




i = 1
while (i<=10){
  print (3 * i)
  i = i + 1
}
  

print("")

# user defined functions

guess_my_bday <- function(x){
  if(x == '4may2002'){
    print("You guessed it correct!")
  }else{
    print("abe jana")
  }
}
  
  
  
guess_my_bday('dafs')  
guess_my_bday(('4may2002'))
  
  
  
  
  