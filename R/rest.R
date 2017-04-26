#' Current HP maximizer
#' 
#' Will allow for the DnD character's current HP to be automatically updated to the max HP the character has. No assignment is neccessary. This is a generic method function with two subsidiary functions, one for DnD class objects and one for non-DnD class objects.
#' @export
#' @seealso \code{\link{rest.DnD}}
#' @seealso \code{\link{rest.default}}
#' @param which.character The DnD character who is being healed
#' @return Will return the character with the new health status


rest <- function(which.character){
  UseMethod('rest', which.character)
}

#' Current HP maximizer
#' 
#' Will allow for the DnD character's current HP to be automatically updated to the max HP the character has. No assignment is neccessary. 
#' 
#' @seealso \code{\link{rest.default}}
#' @param which.character The DnD character who is being healed
#' @return Will return the character with the new health status



rest.DnD <- function(which.character){
  hope <- which.character
  hope$hp[2] <- which.character$hp[1]
  holding <-(which.character$hp[2])
  eval(parse(text = paste(substitute(which.character),"<<- hope", sep = "")))
}


#' Current HP maximizer
#' 
#' The default function for rest() in which a warning message will be returned if a non-DnD object is passed to it.  
#' @export
#' @seealso \code{\link{rest.DnD}}
#' @param which.character The DnD character who is being healed
#' @return Will return the character with the new health status


rest.default <- function(which.character)
{
  print("Not a DnD Object")
}

