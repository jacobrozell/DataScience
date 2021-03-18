# Layers to a visualization 
# Data - Aesthetics - Geometries - Statistics - Facets - Coordinates - Theme

#-------------------------------------------------------- Data
getwd()
setwd("/Users/jrozell/Desktop/R Programming/6_AdvancedVisualization")

movies <- read.csv("Data/Movie-Ratings.csv") # stringsAsFactors=T
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

# We want Year/Genre to be a categorical variable instead of a numeric
# Convert non-factor to factor
movies$Year <- factor(movies$Year)
str(movies)

movies$Genre <- factor(movies$Genre)
str(movies)

#-------------------------------------------------------- Aesthetics
library(ggplot2)

# aes = Aesthetics
ggplot( data=movies, aes(x=CriticRating, y=AudienceRating)) 

# add geometry
ggplot( data=movies, aes(x=CriticRating, y=AudienceRating)) + 
    geom_point()

# add color
ggplot(
    data=movies, 
    aes(
        x=CriticRating, 
        y=AudienceRating,
        color=Genre
    )) + 
    geom_point() 

# add size
ggplot(
    data=movies, 
    aes(
        x=CriticRating, 
        y=AudienceRating,
        color=Genre,
        size=BudgetMillions
    )) + 
    geom_point() 

# >>> This is our 1/5 visualizations we need (come back later to improve before exporting)

#-------------------------------------------------------- Plotting with layers
a <- ggplot(
    data=movies, 
    aes(
        x=CriticRating, 
        y=AudienceRating,
        color=Genre,
        size=BudgetMillions
    ))

# point
a + geom_point()

# lines
a + geom_line()

# multiple layers
a + geom_line() + geom_point()

#-------------------------------------------------------- Overriding Aesthetics

b <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

# add geom layer
b + geom_point()

# overriding aes
# q will remain the same unless re-saved back into q
## ex1
b + geom_point(aes(size=CriticRating))

##ex2
b + geom_point(aes(color=BudgetMillions))

#ex3
# still has old x axis label even though we updated it
# add xlab(<name>) to update x-axis
b + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")
# ^^^ second chart in deliverable 

#ex4
b + geom_line(size=1) + geom_point()
# ^^^ no aes(line=1)... hmmm

#-------------------------------------------------------- Mapping vs. Setting
c <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
c + geom_point()

# -Add color
# 1. Mapping (what we've done so far)
c + geom_point(aes(color=Genre))

# 2. Setting
c + geom_point(color="DarkGreen")

#ERROR
# c + geom_point(aes(color="DarkGreen")) 
# not mapping a variable to color

# -Add size
# 1. Mapping
c + geom_point(aes(size=BudgetMillions))

# 2. Setting
c + geom_point(size=10)

#ERROR
# c + geom_point(aes(size=10))  
# not size 10

#-------------------------------------------------------- Starting Layer Tips

d <- ggplot(data=movies, aes(x=AudienceRating)) 
d + geom_histogram(binwidth = 10, fill="White", color="Blue")

# another way to achieve same results 
d <- ggplot(data=movies) # doesn't add aesthetic layer here
d + geom_histogram(binwidth = 10, aes(x=AudienceRating), fill="White", color="Blue")
# >>> 4th chart (make better later)

e <- ggplot(data=movies)
e + geom_histogram(binwidth = 10, aes(x=CriticRating), fill="White", color="Blue")
# >>> 5th chart

#-------------------------------------------------- Statistical Transformations
?geom_smooth()

f <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
f + geom_point() + geom_smooth(fill=NA)

# BoxPlots
f <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
f + geom_boxplot()
f + geom_boxplot(size=1.2)

f + geom_boxplot(size=1.2) + geom_jitter()  # jitter = random dots that help explain the data's trends
f + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
# >>> chart #6

# Challenge to find same chart but for CriticRating
g <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
g + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
# >>> challenge chart

#----------------------------------------------------------------- Using Facets
h <- ggplot(data=movies, aes(x=BudgetMillions))
h + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

# facets - make multiple charts!
h + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") + 
    facet_grid(Genre~., scale="free")

# Scatter Plots
i <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
i + geom_point(size=3) +
    facet_grid(Genre~.)

i + geom_point(size=3) +
    facet_grid(.~Year)

i + geom_point(size=3) +
    facet_grid(Genre~Year)
    
i + geom_point(size=3) +
    geom_smooth() +
    facet_grid(Genre~Year)
   
i + geom_point(aes(size=BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre~Year)
# >>> #1 again (but can still improve)
    
   
#----------------------------------------------------------------- Coordinates
#Today
#limits
#zoom

j <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, color=Genre))
    
j + geom_point()

j + geom_point() +
    xlim(50, 100) +
    ylim(50, 100)
    
#doesn't always work well
k <- ggplot(data=movies, aes(x=BudgetMillions))
k + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") +
    ylim(0, 50)
# not what we want at all. it cut off the tops of the data under 50
k + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") +
    coord_cartesian(ylim=c(0,50))

#improve old chart
i + geom_point(aes(size=BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre~Year) +
    coord_cartesian(ylim=c(0, 100))
# >>> 1st chart done!

#----------------------------------------------------------------- Theme
l <- ggplot(data=movies, aes(x=BudgetMillions)) 
m <- l + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

#axes labels
m + xlab("Money Axis") + 
    ylab("Number of Movies") + 
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y = element_text(color="Red", size=30))

#tick mark formatting
m + xlab("Money Axis") + 
    ylab("Number of Movies") + 
    theme(axis.title.x=element_text(color="DarkGreen", size=30),
          axis.title.y = element_text(color="Red", size=30),
          axis.text.x = element_text(size=20),
          axis.text.y = element_text(size=20))

#legend formatting
m + xlab("Money Axis") + 
    ylab("Number of Movies") + 
    ggtitle("Movie Budget Distribution") + 
    theme(axis.title.x = element_text(color="DarkGreen", size=30),
          axis.title.y = element_text(color="Red", size=30),
          axis.text.x = element_text(size=20),
          axis.text.y = element_text(size=20),
          legend.title = element_text(size=30),
          legend.text = element_text(size=20),
          legend.position = c(1,1), # where it goes
          legend.justification = c(1,1), # which side is constrained
          plot.title = element_text(color="DarkBlue", size=40, family="Courier"))
