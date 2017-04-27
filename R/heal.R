#' Current HP health modifier
#' 
#' Will allow for the DnD character's current HP to be automatically updated. No assignment is neccessary.
#' @export
#' @param which.character The DnD character who is being healed
#' @param health The amount the character's health is to increase by
#' @return Will return the character with the new health status
#' @examples
#' Blacksmith_Jamestown <- DnD(Josh, 4)
#' heal(Blacksmith_Jamestown, 20)
#' Blacksmith_Jamestown$hp



heal <- function(which.character, health){
  UseMethod('heal', which.character)
}



heal.DnD <- function(which.character, health){
  hope <- which.character
  hope$hp[2] <- which.character$hp["Current HP"] + health
  holding <-(which.character$hp["Current HP"])
   eval(parse(text = paste(substitute(which.character),"<<- hope", sep = "")))
}

heal.default <- function(which.character, health)
{
  print("Not a DnD Object")
}



