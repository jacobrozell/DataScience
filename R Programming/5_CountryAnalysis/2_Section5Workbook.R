
?read.csv()

# Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

# Method 2: Set WD and read data
setwd("/Users/jrozell/Desktop/R Programming/5_CountryAnalysis")
getwd()
stats <- read.csv("P2-Demographic-Data.csv")
stats

#-------------------------------- Exploring Data
stats
nrow(stats) # 195
ncol(stats) # 5
head(stats, n=10) # Gives top 10 rows
tail(stats, n=10) # Gives bottom 10 rows
str(stats) # Displays `internal structure` of an object
# str(stats) <- Structure / Not STRING
summary(stats) # Gives a statistical summary of the object

#-------------------------------- Using the $ sign
stats
head(stats)
stats[3, 5]
stats[3, "Birth.rate"]
stats$Internet.users # <- abstracts the column into a vector of values
stats$Internet.users[2]
stats[,"Internet.users"]  # same as `stats$Internet.users`
?levels

#-------------------------------- Basic Operations with a DF
# Subsetting refresh
stats[1:10,]
stats[3:9,]
stats[c(4,100),]

# Row
stats[1,] # <- 1 entry result doesn't change type into a vector
is.data.frame(stats[1,]) # <- TRUE

# However, columns do change to vector...
is.data.frame(stats[,1]) # <- FALSE
is.data.frame(stats[,1,drop=F]) # <- TRUE

# DataFrame Operations
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
head(stats)

stats$xyz <- 1:5 # New column will be recycled into 1,2,3,4,5,1,2,3,4....
head(stats)

# remove col
stats$xyz <- NULL
stats

#-------------------------------- Filtering DataFrames
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "United States",]

#-------------------------------- Intro to  qplot()
library(ggplot2)
?qplot

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))  # Look into why you need this I()
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), color="blue") # Makes color red
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), color=I("blue")) # Makes color blue
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

#-------------------------------- Visualizing Challenge
qplot(data=stats, x=Internet.users, y=Birth.rate, color=Income.Group, size=I(3))

#-------------------------------- Creating Data Frame
# Normal Create Data Frame
df <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(df)

# Change col names to make more readable
colnames(df) <- c('Country', "Code", "Region")
head(df)
rm(df)

# Create Data Frame with names in init
df <- data.frame(
    Country=Countries_2012_Dataset, 
    Code=Codes_2012_Dataset, 
    Region=Regions_2012_Dataset
)
head(df)
tail(df)
summary(df)

#-------------------------------- Merging Data Frames
head(df)
head(stats)
?merge()

# Merge by a column that is present in both Data Frames
merged <- merge(stats, df, by.x="Country.Code", by.y="Code")
head(merged) # oh no we have two country columns
merged$Country <- NULL
str(merged)
tail(merged)

#-------------------------------- Visualizing with `Merged` Data Frame
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(3))

# 1. Shapes : Google `R Shapes`
qplot(
    data=merged, 
    x=Internet.users, 
    y=Birth.rate, 
    color=Region, 
    size=I(3), 
    shape=I(21)
)

# 2. Transparency
qplot(
    data=merged, 
    x=Internet.users, 
    y=Birth.rate, 
    color=Region, 
    size=I(3), 
    shape=I(19),
    alpha=I(0.7)
)

# 3. Title
qplot(
    data=merged, 
    x=Internet.users, 
    y=Birth.rate, 
    color=Region, 
    size=I(3), 
    shape=I(19),
    alpha=I(0.7),
    main="Birth Rate vs Internet Users"
)



