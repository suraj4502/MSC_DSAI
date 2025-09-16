library(dplyr)

# factorial
n <- 5
fact <- 1
for(i in 1:n){
  fact<- fact*i
}

#print(fact)

i = 1
n = 5
fact <- 1
while(i < 6){
  fact <- fact *i
  i = i +1
}

print(fact)

inputs <- c(3,7, 10, 11, 12)
i <- 1
repeat{
  num <- inputs[i]
  print(paste("CURRENT NUM", num))
  if(num <= 10){
    print("chota hai ")
  }else{
    print("BADA HAI")
    break
  }
i = i +1
}




rows = 4
for (i in 1:rows){
  line = rep("*", i)
  cat(paste(line, collapse = " "), "\n")
  }




df_loop = data.frame(
  'name' = c("SURAJ", "ZAYN", "CHARLIE"),
  'marks' = c(45, 55, 88)
)


for(i in 1:nrow(df_loop)){
  print(i)
  if(df_loop$marks[i]<50){
    print(df_loop$name[i])
  }
}










