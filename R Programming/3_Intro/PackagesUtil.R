
# Query a func
?rnorm()

install.packages("ggplot2")

# Must import ggplot with library() func
library(ggplot2)
qplot()
ggplot()
diamonds

qplot(data=diamonds, carat, price, colour=clarity, facets=.~clarity)

