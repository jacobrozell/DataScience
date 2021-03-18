
# Law of large numbers check homework
n <- 1000000
total <- 0
for (num in rnorm(n)) {
  if (num < 1 & num > -1) {
    total <- total + 1
  }
}
answer <- total / n
answer