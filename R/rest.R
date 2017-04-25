#' Current HP maximizer
#' 
#' Will allow for the DnD character's current HP to be automatically updated to the max HP the character has. No assignment is neccessary.
#' @export
#' @param which.character The DnD character who is being healed
#' @return Will return the character with the new health status


rest <- function(which.character){
  UseMethod('rest', which.character)
}



rest.DnD <- function(which.character){
  hope <- which.character
  hope$hp[2] <- which.character$hp[1]
  holding <-(which.character$hp[2])
  eval(parse(text = paste(substitute(which.character),"<<- hope", sep = "")))
}

rest.default <- function(which.character)
{
  print("Not a DnD Object")
}

