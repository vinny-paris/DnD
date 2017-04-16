stat.roll <- function(method = Commoner.Method, ...) {
 

Ferguson.Method <- function(Dice.Number = c(4,4,4,4,4,4), Stats = c("str", "con", "dex", "int", "wis", "char")){
  x <- Dice.Number
  result <- NULL
  for (i in x){
    rolls <- ceiling(runif(i, min = 0, max =6))
    best_rolls <- head(sort(rolls, decreasing = TRUE), n=3)
    total <- sum(best_rolls)
    result <- rbind(result, total)
  }
  rownames(result) <- Stats
  mod <- floor((result - 10)/2)
  result <- cbind(result, mod)
  colnames(result) <- c("Stat", "mod")
  result <- as.data.frame(result)
  
    return(result)
}



Heroic.Method <- function(Stats = c("str", "dex", "con", "int", "wis", "char")) {
{
  Holding <- NULL
  for (i in 1:length(Stats))
    {
  j <- runif(2, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))+6
  }
  Holding <- Holding[sort.list(Holding, decreasing = TRUE)]
  names(Holding) <- Stats
  mod <- floor((Holding - 10)/2)
  Holding <- rbind(Holding, mod)
  rownames(Holding) <- c("Stat", "mod")
  return(Holding)
  }}





Pilsfer.Method <- function(Stats = c("str", "con", "dex", "int", "wis", "char")) {
  test <- NULL
  Holding <- NULL
  for (k in 1:3){
  for (i in 1:length(Stats))
    {
  j <- runif(3, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))
  }
    test <- cbind(test, Holding)
  }
    Finale <- test[,which.max(apply(test, MARGIN=2, sum))]
    
  Finale <- Finale[sort.list(Finale, decreasing = TRUE)]
    names(Finale) <- Stats
  mod <- floor((Finale - 10)/2)
  Finale <- cbind(Finale, mod)
  colnames(Finale) <- c("Stats", "mod")
    return(Finale)
}




Base.Method <- function(Stats= c("str", "con", "dex", "int", "wis", "char")){
  Holding <- NULL
  for (i in 1:length(Stats))
    {
  j <- runif(3, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))
  }
    
  Finale <- Holding[sort.list(Holding, decreasing = TRUE)]
  names(Finale) <- Stats
  mod <- floor((Finale - 10)/2)
  Finale <- cbind(Finale, mod)
  colnames(Finale) <- c("Stats", "mod")
    return(Finale)
}



Commoner.Method <- function(Stats= c("str", "dex", "con", "int", "wis", "char")){
  Holding <- NULL
  for (i in 1:length(Stats))
    {
  j <- runif(3, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))
  }
     
  Finale <- Holding
  names(Finale) <- Stats
  mod <- floor((Finale - 10)/2)
  Finale <- cbind(Finale, mod)
  colnames(Finale) <- c("Stats", "mod")
    return(Finale)
}


 x <- deparse(substitute(method))

j <- ifelse(x == "Ferguson.Method", 1, 
       ifelse(x == "Heroic.Method", 3, 
              ifelse(x == "Pilsfer.Method", 2, 
                     ifelse(x == "Base.Method", 4, 
                            ifelse(x == "Commoner.Method", 5, paste("Can be one of these: Ferguson.Method, Heroic.Method, Pilsfer.Method, Base.Method, Commoner.Method  Also note that the default setting for the ordering of stats is built in for a given class. Otherwise it defaults to str, con, dex, int, wis, char."))))))


k <- if(j==1){t(Ferguson.Method(...))} 
         else{if(j == 3){Heroic.Method(...)} 
            else{if(j==2){t(Pilsfer.Method(...))} 
                else{if(j==4){t(Base.Method(...))} 
                  else{if(j == 5) {t(Commoner.Method(...))} else{j}}}}}
return(k)
}




