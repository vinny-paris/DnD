#' Statistics Creator
#' 
#' Create statistics and modifiers for a DnD character using various methods
#' @param method The method used to roll the dice. Options include Commoner.Method, Base.Method, Pilsfer.Method, Heroic.Method, and Ferguson.Method. 
#' @note Commoner.Method works by rolling 3 6-sided dice for each category. 
#' @note Base.Method does the same as Commoner.Method but it allows you to assign the highest rolls to the most important statistic. 
#' @note Heroic.Method works similarlly to Base.Method except one dice is removed from each roll and a 6 is assigned in it's place; this too assigns rolls according to importance of stats. 
#' @note Pilsfer.Method rolls Commoner.Method three times, chooses whatever set has the highest total and then assigns highest rolls to the most important stats. 
#' @note Ferguson.Method takes in a vector of length 6 (Dice.Number) as well as the Stats parameter and will roll the number of dice associated with that element on the Dice.Number vector. Ferguson.Method will then pick the top three dice rolled in each category to assign the rolls. 
#' @param ... Stats = this is the ordering of the statistics used in assinging the highest level rolls, second highest, ect... The default is c("str", "dex", "con", "int", "wis", "char").   Dice.Number = This is used only for the Ferguson.Method. It takes a numeric vector of length 6 and each element in this vector will be the number of dice rolled for each statistic category. The author suggestes that 24 dice be assinged in any way the player sees fit. The default is c(4,4,4,4,4,4)
#' @return Will return a data frame of 2 x 6 with statistics as the column labels, rolls as the first row, and modifiers as the second row.




stat.roll <- function(method = Commoner.Method, ...) {
 

   is.natural <- function(x)
  {
    x>0 && identical(round(x), x)
   }
   
Ferguson.Method <- function(Dice.Number = c(4,4,4,4,4,4), Stats = c("str", "con", "dex", "int", "wis", "char")){
  x <- Dice.Number
  ifelse(is.numeric(x) == 0, return(paste('Please only pass numeric arguments to Dice.Number parameter')), {
  ifelse(is.natural(x) & length(x) == 6,{ 
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
}, return(unlist(paste("For Ferguson.Method please enter a length 6 postitive natural number vector"))))})}



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
                            ifelse(x == "Commoner.Method", 5, return(paste("Can be one of these: Ferguson.Method, Heroic.Method, Pilsfer.Method, Base.Method, Commoner.Method  Also note that the default setting for the ordering of stats is built in for a given class. Otherwise it defaults to str, con, dex, int, wis, char.")))))))


k <- if(j==1){t(Ferguson.Method(...))} 
         else{if(j == 3){Heroic.Method(...)} 
            else{if(j==2){t(Pilsfer.Method(...))} 
                else{if(j==4){t(Base.Method(...))} 
                  else{if(j == 5) {t(Commoner.Method(...))} else{j}}}}}
return(k)
}




