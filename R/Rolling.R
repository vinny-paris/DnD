#' Dice Rolling Function
#' 
#' Allows for dice rolling simulation for any natural number of dice with any natural number of dice.
#' @export
#' @param sides How many sides should be used to run the simulation? Defaults to 20
#' @param num.of.dice How many dice should be "rolled"? Defaults to 1
#' @param type Do you want to roll with advantage ("adv"), disadvantage ("dis"), or regular ("reg"). Defaults to regular.
#' @return Will return the sum of the dice after taking into account adv/dis. There is also messages for a 20 or a 1 on a single 20 sided dice.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @examples
#' roll()
#' roll(sides = 4)
#' roll(type = "adv")

roll <- function(sides = 20, num.of.dice = 1, type = "reg"){
 
  base <- function() sum(ceiling(runif(num.of.dice, min = 0, max = sides)))
  
  holding <- ifelse( type == "reg", base() , 
             ifelse( type == "adv", max(c(base(), base())), 
             ifelse( type == "dis", min(c(base(), base())), paste("Not a valid roll type. Choose adv, reg, or dis"))))
  
  return(ifelse(sides == 20 & holding == 20 & num.of.dice == 1, paste("Congrats! It's a natural 20, keep up the good work."), 
                ifelse(sides == 20 & holding == 1 & num.of.dice == 1, paste("Natural 1, your character is a failure!"), 
                       holding)))
}
