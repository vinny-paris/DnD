#' Current HP damage modifier
#' 
#' Will allow for the DnD character's current HP to be automatically updated. No assignment is neccessary. This is a generic method with two functions, one for a DnD class object and one for a non-DnD class object.
#' @export
#' @param which.character The DnD character who being hurt
#' @param damage The amount the character's health is to decrease by
#' @return Will return the character with the new health status
#' @seealso \code{\link{damage.DnD}}
#' @seealso \code{\link{damage.default}}




damage <- function(which.character, damage){
  UseMethod('damage', which.character)
}

#' Current HP damage modifier
#' 
#' Will allow for the DnD character's current HP to be automatically updated. No assignment is neccessary. This is a generic method with two functions, one for a DnD class object and one for a non-DnD class object.
#' @export
#' @param which.character The DnD character who being hurt
#' @param damage The amount the character's health is to decrease by
#' @return Will return the character with the new health status
#' @seealso \code{\link{damage.default}}
#' @examples
#' DnD(Blacksmith_Jamestown, 4)
#' damage(Blacksmith_Jamestown, 20)
#' Blacksmith_Jamestown$hp


damage.DnD <- function(which.character, damage){
  hope <- which.character
  hope$hp[2] <- which.character$hp["Current HP"] - damage
  holding <-(which.character$hp["Current HP"])
  eval(parse(text = paste(substitute(which.character),"<<- hope", sep = "")))
}

#' Current HP damage modifier
#' 
#' Will allow for the DnD character's current HP to be automatically updated. No assignment is neccessary. This is a generic method with two functions, one for a DnD class object and one for a non-DnD class object.
#' @export
#' @param which.character The DnD character who being hurt
#' @param damage The amount the character's health is to decrease by
#' @return Will return the character with the new health status
#' @seealso \code{\link{damage.default}}

damage.default <- function(which.character, damage)
{
  print("Not a DnD Object")
}


