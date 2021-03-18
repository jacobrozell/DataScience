
### Ways to make a matrix
##matrix() 
?matrix

# Create seq
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
A

# Find 10
A[2,3]

# With byrow param
B <- matrix(my.data, 4, 5, byrow = T)
B

# Find 10
B[2,5]

##rbind()
r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1,2,3)
R <- rbind(r1,r2,r3)
R

##cbind()
c1 <- c("I", "am", "happy")
c2 <- c("What", "a", "day")
c3 <- c(1,2,3)
C <- cbind(c1,c2,c3)
C

