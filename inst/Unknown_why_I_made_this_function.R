my.function <- function(x) {
  total_scores <- NULL
  for (i in 1:6){
  single_score <- sum(ceiling(runif(x, min = 0, max = 6)))
  total_scores <- cbind(total_scores, single_score)
  }
  return(total_scores)
}

my.function.2 <- function(str = str, dex = dex, con = con, int = int, wis = wis, char= char) {
  holding <- NULL
  x <- c(str, dex, con, int, wis, char)
  for (i in x) {
    roll <- ceiling(runif(x, min=0, max = 6))
    high.rolls <- head(order(roll, decreasing = TRUE), n=3)
    holding <- rbind(holding, sum(high.rolls))
    result <- cbind(x, holding)
  }
  return(result)
}