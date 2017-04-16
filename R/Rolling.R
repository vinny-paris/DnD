roll <- function(sides = 20, num.of.dice = 1, type = "reg"){
 
  base <- function() sum(ceiling(runif(num.of.dice, min = 0, max = sides)))
  
  holding <- ifelse( type == "reg", base() , 
             ifelse( type == "adv", max(c(base(), base())), 
             ifelse( type == "dis", min(c(base(), base())), paste("Not a valid roll type. Choose adv, reg, or dis"))))
  
  return(ifelse(sides == 20 & holding == 20 & num.of.dice == 1, paste("Congrats! It's a natural 20, keep up the good work."), 
                ifelse(sides == 20 & holding == 1 & num.of.dice == 1, paste("Natural 1, your character is a failure!"), 
                       holding)))
}

