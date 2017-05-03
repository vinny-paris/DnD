#' Initiative Rolls
#' 
#' Will allow for the a initiative roll for a DnD character
#' @export
#' @param which.character The DnD character who is making the check
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return the the check rolled including the proficiency bonus and character statistic modifier added properly.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.

initiative <- function(which.character){
  UseMethod('initiative', which.character)
}

#' Initiative Roller
#' 
#' Will allow for the DnD character to roll an intiative roll to be simulated. No assignment is neccessary. 
#' 
#' @seealso \code{\link{initiative.DnD}}
#' @param which.character The DnD character who is making the initiative roll
#' @return Will return the the simulated roll
#' @export
#' @param ... Additional arguments to be passed to the roll() function.




initiative.DnD <- function(which.character,...){
    dice <- roll(...)
  result <- ifelse(class(dice) == "character",
    dice, dice + which.character$Statistics[2,"dex"] )
  return(result)
}



#' Initiative Roller
#' 
#' Will allow for the DnD character to roll an intiative roll to be simulated. No assignment is neccessary. 
#' 
#' @seealso \code{\link{initiative.default}}
#' @export
#' @param ... Additional arguments to be passed to the roll() function.
#' @param which.character The DnD character who is making the initiative roll
#' @return Will return a warning message about being passed a DnD object.

initiative.default <- function(which.character)
        {
                print("Not a DnD Object")
        }
  