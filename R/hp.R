#' Hit Points Calculator
#' 
#' Issues max and current hit points for a character based on level and class
#' @export
#' @param which.level The level of the character used to properly scale the character's health.
#' @param which.class The class of the character will establish what the hit dice will be issued to that character. It is deterministic with the assigned hit dice being from the section of each class in the player's hand book.
#' @return Will return a data frame of 2 with the first being the calcualted Max Hit Points and the second being Current Hit Points.
#' @note The implementation of this function will allow only for half-round up method of calculating HP for each level above 1, i.e. we will not allow for a roll that occurs on the lower half of the dice but instead will move those to the lowest acceptable face.
#' @note The max and current hp produced will always be the same, this is simply to allow for easier use inside the DnD function.
#' @example
#' hp.calculator("Bard", 10)



hp.calculator <- function(which.class = which.class, which.level = which.level){
  x <- which.class
  
  hit.dice <- ifelse(which.class == "Barbarian", 12, 
              ifelse(which.class == "Bard", 8,
                     ifelse(which.class == "Cleric", 8, 
                            ifelse(which.class == "Druid", 8, 
                                   ifelse(which.class == "Fighter", 10,
                                          ifelse(which.class == "Monk", 8,
                                              ifelse(which.class == "Paladin", 10,
                                                 ifelse(which.class == "Ranger", 10,
                                                        ifelse(which.class == "Rogue", 8,
                                                               ifelse(which.class == "Sorcerer", 6, 
                                                                      ifelse(which.class == "Warlock", 8,
                                                                             ifelse(which.class == "Wizard", 6, 
                                                                                    paste("Not a known Class")))))))))))))
        

general.roller <- function(hit.dice, which.level = which.level){
   min.hp <- ceiling((hit.dice+1)/2)
   k <- runif(which.level-1, min=0, max=hit.dice) %>% ceiling()
   k <- ifelse(k <min.hp, min.hp, k)
   return(sum(k) + hit.dice)
}

   
   holding <- general.roller(hit.dice, which.level)
   
   total.hp <- holding 
   HP <- c(total.hp, total.hp)
   names(HP) <- c("Max HP", "Current HP")
   return(HP)
 }

