# fucntions

hello_function <- function(){
  print("HELLO SURAJ!!")
}

hello_function()

# function w argument

add_number <- function(a, b){
  sum <- a+ b
  return(sum)
}

print(add_number(55, 55))


# fucntion w default args

power_func <- function(x, power = 2){
  return(x^power)
} 
print(power_func(4))
print(power_func(4,3))


# function w multiple variables return
math_func = function(a, b){
  return(c(a+b, a-b, a*b, a/b))
}

print(math_func(4,5))


# Anonymous (inline) functions
op = sapply(1:5, function(x) x^2)
print(op)


# fucntion with variable arguments

f1 = function(...){
  return(sum(...))
}

print(f1(1,2,3,4))