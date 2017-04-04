Ferguson.Method <- function(Stats = c("str", "con", "dex", "int", "wis", "char"), Dice.Number){
  x <- Dice.Number
  result <- NULL
  for (i in x){
    rolls <- ceiling(runif(i, min = 0, max =6))
    best_rolls <- head(sort(rolls, decreasing = TRUE), n=3)
    total <- sum(best_rolls)
    result <- rbind(result, total)
  }
  rownames(result) <- Stats
    return(result)
}

Heroic.Method <- function(Stats = c) {
{
  Holding <- NULL
  for (i in 1:6)
    {
  j <- runif(2, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))+6
  }
  Holding <- Holding[sort.list(Holding, decreasing = TRUE)]
  names(Holding) <- c
    return(Holding)
  }}


Pilsfer.Method <- function(Stats = Stats) {
  test <- NULL
  Holding <- NULL
  for (k in 1:3){
  for (i in 1:6)
    {
  j <- runif(3, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))
  }
    test <- cbind(test, Holding)
  }
    Finale <- test[,which.max(apply(test, MARGIN=2, sum))]
    
  Finale <- Finale[sort.list(Finale, decreasing = TRUE)]
  names(Finale) <- Stats
    return(Finale)
}



Base.Method <- function(Stats= c("str", "con", "dex", "int", "wis", "char")){
  Holding <- NULL
  for (i in 1:6)
    {
  j <- runif(3, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))
  }
    
  Finale <- Holding[sort.list(Holding, decreasing = TRUE)]
  names(Finale) <- Stats
    return(Finale)
}





c <- c("str", "con", "dex", "int", "wis", "char")
    
    
    

