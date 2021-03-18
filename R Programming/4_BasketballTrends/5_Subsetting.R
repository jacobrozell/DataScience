
Games
Games[1:3, 6:10]
Games[c(1,10),]
Games[,c("2008", "2009")]

#Returns a vector instead of a matrix
Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])

# Add `drop` to keep it as matrix type
Games[1,,drop=F]

# Without drop to keep Data as matrix
Data <- MinutesPlayed[1,]
matplot(t(Data), type='b', pch=15:18, col=c(1:4, 6))
legend('bottomleft', inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)

# With drop to keep Data as matrix
Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type='b', pch=15:18, col=c(1:4, 6))
legend('bottomleft', inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)


