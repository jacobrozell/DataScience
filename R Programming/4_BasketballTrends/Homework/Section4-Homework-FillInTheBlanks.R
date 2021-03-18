#Matrix for Free Throws
#Bind the given vectors to form the matrix
FreeThrows <- rind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
#Rename the columns
colnames(FreeThrows) <- Seasons
#Rename the rows
rownames(FreeThrows) <- Players

#Check the matrix
FreeThrows

#Matrix for Free Throw Attempts
#Bind the given vectors to form the matrix
FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
#Rename the columns
colnames(FreeThrowAttempts) <- Seasons
#Rename the rows
rownames(FreeThrowAttempts) <- Players

#Check the matrix
FreeThrowAttempts

#Re-create the plotting function
myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}

#Visualize the new matrices
myplot(FreeThrows)
myplot(FreeThrowAttempts)

#Part 1 - Free Throw Attempts Per Game 
#(You will need the Games matrix)
myplot(FreeThrowAttempts/Games)
#Notice how Chris Paul gets few attempts per game

#Part 2 - Free Throw Accuracy
myplot(FreeThrows/FreeThrowAttempts)
#And yet Chris Paul's accuracy is one of the highest
#Chances are his team would get more points if he had more FTA's
#Also notice that Dwight Howard's FT Accuracy is extremely poor
#compared to other players. If you recall, Dwight Howard's
#Field Goal Accuracy was exceptional:
myplot(FieldGoals/FieldGoalAttempts)
#How could this be? Why is there such a drastic difference?
#We will see just now...

#Part 3 - Player Style Patterns Excluding Free Throws
myplot((Points - FreeThorws)/FieldGoals)
#Because we have excluded free throws, this plot now shows us
#the true representation of player style change. We can verify
#that this is the case because all the marks without exception
#on this plot are between 2 and 3. That is because Field Goals
#can only be for either 2 points or 3 points.
#Insights:
#1. You can see how players' preference for 2 or 3 point shots
#   changes throughout their career. We can see that almost all
#   players in this dataset experiment with their style throughout
#   their careers. Perhaps, the most drastic change in style has
#   been experienced by Joe Johnson.
#2. There is one exception. You can see that one player has not
#   changed his style at all - almost always scoring only 2-pointers.
#   Who is this mystert player? It's Dwight Howard! 
#   Now that explains a lot. The reason that Dwight Howard's
#   Field Goal accuracy is so good is because he almost always
#   scores 2-pointers only. That means he can be close to the basket
#   or even in contact with it. Free throws, on the other hand require
#   the player to stand 15ft (4.57m) away from the hoop. That's 
#   probably why Dwight Howard's Free Throw Accuracy is poor.




