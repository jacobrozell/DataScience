
# C = combine ; way to make vectors
x <- c(3,45,56,732)

# Vectors are indexed starting at 1
x[1]
x[2]
x[3]
x[-1] # No first
x[-3] # No middle
x[1:3] # Sequence
x[3:5]  # NA if no variable

# Check if the vector is full of numbers
is.numeric(x)

# Numbers default to doubles
is.double(x)

# How to make integer vector
y = c(1L,5L,9L)
is.integer(y)

# char vector
char <- c("a", "ABC", "Hello")
char

is.character(char)

# Auto converts numerics to characters
unmatch <- c("a", 1L)
unmatch  # Changes `1L` to "1"


seq() # sequence - like `:`
rep() # replicate 

seq(1, 15)
1:15

# Why use seq if you can use 1:5?
seq(1, 15, 2) # Steps by 2
# Answer: More flexibility

rep(3, 50)
d <- rep(3, 50)
d

h <- rep("a", 5)
h

# replicate vectors
x <- c("6", "9")
var <- rep(x, 10)
var

w <- c("a", "b", "c", "d", "e")
w


