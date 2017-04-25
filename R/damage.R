#' Current HP damage modifier
#' 
#' Will allow for the DnD character's current HP to be automatically updated. No assignment is neccessary.
#' @export
#' @param which.character The DnD character who is making the check
#' @param damage The amount the character's health is to decrease by
#' @return Will return the character with the new health status
#' @examples
#' Blacksmith_Jamestown <- DnD(Josh, 4)
#' damage(Blacksmith_Jamestown, 20)
#' Blacksmith_Jamestown$hp



damage <- function(which.character, damage){
  UseMethod('damage', which.character)
}



damage.DnD <- function(which.character, damage){
  hope <- which.character
  hope$hp[2] <- which.character$hp["Current HP"] - damage
  holding <-(which.character$hp["Current HP"])
  eval(parse(text = paste(substitute(which.character),"<<- hope", sep = "")))
}

damage.default <- function(which.character, damage)
{
  print("Not a DnD Object")
}


