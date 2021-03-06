#' Current HP health modifier
#' 
#' Will allow for the DnD character's current HP to be automatically updated. No assignment is neccessary.
#' @export
#' @param which.character The DnD character who is being healed
#' @param health The amount the character's health is to increase by
#' @return Will return the character with the new health status



heal <- function(which.character, health){
  UseMethod('heal', which.character)
}




#' Heal a DnD Character
#' 
#' Will allow for the DnD character to heal for some predetermined amount. No assignment is neccessary. 
#' 
#' @seealso \code{\link{heal.DnD}}
#' @export
#' @param which.character The DnD character who is being healed.
#' @param health The amount the character should be healed.
#' @return Will return the the simulated roll


heal.DnD <- function(which.character, health){
  connector <- suppressWarnings(is.na(as.numeric(deparse(substitute(health)))))
  ifelse(connector == TRUE, return(paste("Please give a single numeric value")), {
    hope <- which.character
    hope$hp[2] <- which.character$hp["Current HP"] + health
    holding <-(which.character$hp["Current HP"])
    eval(parse(text = paste(substitute(which.character),"<<- hope", sep = "")))
    return(paste("Updated!"))
  })}



#' Heal a DnD Character
#' 
#' Will allow for the DnD character to heal for some predetermined amount. No assignment is neccessary. 
#' 
#' @seealso \code{\link{heal.default}}
#' @param which.character The DnD character who is being healed.
#' @export
#' @param health The amount the character should be healed.
#' @return Will return a warning message about being passed a DnD object.


heal.default <- function(which.character, health)
{
  print("Not a DnD Object")
}



