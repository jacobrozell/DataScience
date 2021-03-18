
getwd()
setwd("/Users/jrozell/Desktop/R Programming/6_AdvancedVisualization/Homework")

movies <- read.csv("Section6-Homework-Data.csv")
head(movies)

plot <- ggplot(data=movies, aes(x=Genre, y=Gross % US))
chart <- plot + geom_point(size=3) + facet_grid(Genre~Gross...US)
chart
