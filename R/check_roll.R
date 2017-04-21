#' Check Rolls for Skills
#' 
#' Will allow for the a skill check for a DnD character
#' @export
#' @param which.character The DnD character who is making the check
#' @param skill What skill is to be checked? Please no quotes.
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return the the check rolled including the proficiency bonus and character statistic modifier added properly.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @example
#' Blacksmith_Jamestown <- DnD(Josh, 4)
#' check_roll(Blacksmith_Jamestown, History)

check_roll <- function(which.character, skill, ...){
  skill <- deparse(substitute(skill))
    dice <- roll(...)
  result <- ifelse(class(dice) == "character",
    dice, (dice + sum(which.character$Skills == skill) * which.character$Proficiency.Bonus))
  return(result)
}
  