str1 <- 'suraj'
str2 <- 'random_string.yaar+kyu kar raha hu mai ye'

# concatinate
print(paste(str1, str2))

# uppercase
print(toupper(str1))
print(tolower(str1))

# substring
print(substr(str1, 3, 5))

# stringlength
print(nchar(str2))

# replace accourances
print(sub("s", "z", str1))

print(gsub('a' ,'z', str2))



# splitting
print(strsplit("apple,banana,grape", split = ","))


#trims
str3 <- "   spaced out   "
print(trimws(str3) )   # "spaced out"
