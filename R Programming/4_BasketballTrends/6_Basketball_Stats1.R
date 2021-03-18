
Games
rownames(Games)
colnames(Games)

Games["LeBronJames", "2012"]

FieldGoals
fg_per_game <- round(FieldGoals / Games, 1)
fg_per_game

minutes_played_per_game <- round(MinutesPlayed / Games)
minutes_played_per_game

shots_made <- FieldGoals
attempted <- FieldGoalAttempts
missed <- FieldGoalAttempts - FieldGoals

accuracy <- round(shots_made / attempted, 2)
accuracy
