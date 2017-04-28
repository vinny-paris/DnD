#' Check Rolls for Skills
#' 
#' Will allow for the a skill check for a DnD character
#' @export
#' @param which.character The DnD character who is making the check
#' @param skill What skill is to be checked? Please no quotes.
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return the the check rolled including the proficiency bonus and character statistic modifier added properly.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @seealso \code{\link{check_roll.DnD}}
#' @seealso \code{\link{check_roll.default}}

check_roll <- function(which.character, skill, ...){
  UseMethod('check_roll', which.character)
}



#' Check Rolls for Skills
#' 
#' Will allow for a skill check for a DnD character. 
#' @export
#' @seealso \code{\link{check_roll.default}}
#' @param which.character The DnD character who is making the skill check
#' @param skill What skill is to be checked? Please no quotes.
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return the the skill check including the proficiency bonus and character statistic modifier added properly.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @examples
#' Blacksmith_Jamestown <- DnD(Josh, 4)
#' saving_throw(Blacksmith_Jamestown, str)


check_roll.DnD <- function(which.character, skill, ...){
  skill <- deparse(substitute(skill))
  ifelse(sum(skill == rownames(Skills_by_Class)) == 0, return(paste("Please give a single skill which can be found on the Skills_by_Class table")), {
    
    dice <- roll(...)
  result <- ifelse(class(dice) == "character",
    dice, (dice + sum(which.character$Skills == skill) * which.character$Proficiency.Bonus))
  return(result)
})
}



#' Check Rolls for Skills Default
#' Will allow for a skill check for a DnD character. 
#' @export
#' @param which.character The DnD character who is making the skill check
#' @param skill What skill is to be checked? Please no quotes.
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return a warning message about being passed a non-DnD object
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.

check_roll.default <- function(which.character, skill, ...)
        {
                print("Not a DnD Object")
        }
  