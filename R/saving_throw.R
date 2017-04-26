#' Saving Throws
#' 
#' Will allow for the a save throw for a DnD character. This *is* a generic function and will return a a warning message fro a non-DnD class object.
#' @export
#' @param which.character The DnD character who is making the saving throw
#' @param save What save is to be checked? Please no quotes.
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return the the saving throw including the proficiency bonus and character statistic modifier added properly.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @seealso \code{\link{saving_throw.DnD}}
#' @seealso \code{\link{saving_throw.default}}
#' @examples
#' Blacksmith_Jamestown <- DnD(Josh, 4)
#' saving_throw(Blacksmith_Jamestown, str)


saving_throw <- function(which.character, save, ...){
  UseMethod('saving_throw', which.character)
}



#' Saving Throws
#' 
#' Will allow for a saving throw for a DnD character. 
#' @export
#' @param which.character The DnD character who is making the saving throw
#' @param save What save is to be checked? Please no quotes.
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return the the saving throw including the proficiency bonus and character statistic modifier added properly.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @examples
#' Blacksmith_Jamestown <- DnD(Josh, 4)
#' saving_throw(Blacksmith_Jamestown, str)


saving_throw.DnD <- function(which.character, save,...){
  save <- deparse(substitute(save))
  dice <- roll(...)
  result <- ifelse(class(dice) == "character",
    dice, (dice + which.character$Saves[save,1] * which.character$Proficiency.Bonus))
  return(result)
}



#' Saving Throws
#' 
#' Will allow for the a save throw for a DnD character. This *is* a generic function and will return a a warning message fro a non-DnD class object.
#' @export
#' @param which.character The DnD character who is making the saving throw
#' @param save What save is to be checked? Please no quotes.
#' @param ... Additional arguments to be passed to the roll() function.
#' @return Will return the the saving throw including the proficiency bonus and character statistic modifier added properly.
#' @note There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
#' @example
#' saving_throw("apple", str)

saving_throw.default <- function(which.character,save,...)
        {
                print("Not a DnD Object")
        }





