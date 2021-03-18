#Named Vectors
charlie <- 1:5
charlie

#give names
names(charlie) <- c("a", "b","c","d","e")

charlie

charlie['d']

names(charlie)

#clear names
names(charlie) <- NULL
charlie

#naming matrix conventions

temp.vec <- rep(c('a', 'b', 'c'), times=3)
temp.vec

temp.vec <- rep(c('a', 'b', 'c'), each=3)
temp.vec

?matrix()
bravo <- matrix(temp.vec, nrow=3, ncol=3)
bravo

# named rows
rownames(bravo) <- c("How", "are", "you?")
bravo

#named columns
colnames(bravo) <- c("X","Y","Z")
bravo

# Accessing named rows/columns
bravo['are', 'Y'] <- 0
bravo

rownames(bravo) <- NULL
rownames(bravo)

bravo

