
v1 <- c(1,2,3,4)
v2 <- c(1,2,3,4)

v1 + v2
v1 - v2
v1 / v2
v2 / v1

# Recycles smaller vector and adds it to larger 
v3 <- c(1,2,3,4)
v4 <- c(1,2)

v3 + v4 # -> 2 4 4 6 