#' Dice Rolling Function
#' 
#' Allows for dice rolling simulation for any natural number of dice with any natural number of dice.
#' @export
#' @param sides How many sides should be used to run the simulation? Defaults to 20
#' @param num.of.dice How many dice should be "rolled"? Defaults to 1
#' @param type Do you want to roll with advantage (adv), disadvantage (dis), or regular (reg). Defaults to regular. Please no quotation marks
#' @return Will return the sum of the dice after taking into account adv/dis. There is also messages for a 20 or a 1 on a single 20 sided dice.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @examples
#' roll()
#' roll(sides = 4)
#' roll(type = "adv")

roll <- function(sides = 20, num.of.dice = 1, type = reg){
  is.natural <- function(x)
  {
    x>0 && identical(round(x), x)
  }
  sides.tester <- suppressWarnings(as.numeric(deparse(substitute(sides))))
  num.of.dice.tester <- suppressWarnings(as.numeric(deparse(substitute(num.of.dice))))
  ifelse(sum(is.na(c(sides.tester, num.of.dice.tester))) != 0, return(paste("Please make sure you specify adv, dis, or reg as 'type = adv'. Thank you!")), { 
  ifelse(sum(is.natural(c(sides, num.of.dice)) == FALSE) == 1, return(paste("Please only use positive natual numbers.")),{
  type <- deparse(substitute(type))
 
  base <- function() sum(ceiling(runif(num.of.dice, min = 0, max = sides)))
  
  holding <- ifelse( type == "reg", base() , 
             ifelse( type == "adv", max(c(base(), base())), 
             ifelse( type == "dis", min(c(base(), base())), paste("Not a valid roll type. Choose adv, reg, or dis"))))
  
  success <- c("Congrats! It's a natural 20, keep up the good work.", "Nat 20! You show them Orcs.", "20 naturally, MVP right here!", "Natrual 20! Do a little dance!", "Somedays you can't get anything right, but today is not that day! Natural 20!", "Critical Success, ain't nothing standing in your way", "Natural 20! Everyone stand back, you'll do it yourself", "Natural 20, Celebrate!", "Natural 20! Success and you barely had to lift a finger.") 
  failure <- c("Natrual 1, hope that wasn't an important roll...", "Natural 1, your character is a failure!", "Natural 1, well there are more important things than winning.", "Natural 1, do you like failing?","Natural 1, we cannot keep lowering the bar for you!",  "Natural 1, what's a game without the threat of losing?", "Natural 1, way to let the team down", "Natural 1, some character was distracted....", "Natural 1. Don't worry, lot's of peole have no talent!", "Naturual 1, your as useless as rubber lips on a woodpecker.", "Natural 1. Don't feel bad. A lot of people have no talent!", "Natural 1, the gods of the dice are displeased by you","Natural 1. Wow, just....wow", "Natural 1, were you trained by goblins?")
  
  
  return(ifelse(sides == 20 & holding == 20 & num.of.dice == 1, paste(sample(success, 1)), 
                ifelse(sides == 20 & holding == 1 & num.of.dice == 1, paste(sample(failure, 1)), 
                       holding)))
  })
})
  }
