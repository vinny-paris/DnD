#' Armor Class Creator
#' 
#' Issues a type of armor and calculates an armor class for a DnD character
#' @export
#' @param stats The calculated statistics used in stat.roll function. See it's help page for more. 
#' @param which.class The class of the character will establish what armor will be issued to that character. It is deterministic with the assigned armor being from the equipment section of each class.
#' @return Will return a data frame of 2 with the first being the calcualted Armor Class and the second being the type of armor worn.
#' @seealso Stats will come in a form produced by \code{\link{stat.roll}}




armor.class <- function(which.class, stats){
  Armor <-   ifelse(which.class == "Barbarian", c(stats[2,"con"] + 10 + stats[2,"dex"]),
              ifelse(which.class == "Bard", c(11+ stats[2,"dex"]),
                     ifelse(which.class == "Cleric",c(14 + ifelse(stats[2,"dex"]<2, stats[2,"dex"], 2)), 
                            ifelse(which.class == "Druid", c(11 + stats[2,"dex"]), 
                                   ifelse(which.class == "Fighter", c(16),
                                          ifelse(which.class == "Monk", c(10 + stats[2,"dex"] + stats[2, "wis"]),
                                              ifelse(which.class == "Paladin", c(16),
                                                 ifelse(which.class == "Ranger", c(14 + ifelse(stats[2,"dex"]<2, stats[2,"dex"], 2)),
                                                        ifelse(which.class == "Rogue", c(11 + stats[2, "dex"]),
                                                               ifelse(which.class == "Sorcerer", c(10 + stats[2,"dex"]), 
                                                                      ifelse(which.class == "Warlock", c(10 + stats[2, "dex"]),
                                                                             ifelse(which.class == "Wizard", c(10 + stats[2,"dex"]), 
                                                                                    paste("Not a known Class")))))))))))))
                                                                                    
      Type.of.armor <- ifelse(which.class == "Barbarian", "Unarmored", 
              ifelse(which.class == "Bard", "Leather",
                     ifelse(which.class == "Cleric", "Scale mail", 
                            ifelse(which.class == "Druid", "Leather", 
                                   ifelse(which.class == "Fighter", "Chain mail",
                                          ifelse(which.class == "Monk", "Unarmored",
                                              ifelse(which.class == "Paladin", "Chain mail",
                                                 ifelse(which.class == "Ranger", "Scale mail",
                                                        ifelse(which.class == "Rogue", "Leather",
                                                               ifelse(which.class == "Sorcerer", "Unarmored", 
                                                                      ifelse(which.class == "Warlock", "Leather",
                                                                             ifelse(which.class == "Wizard", "Unarmored", 
                                                                                    paste("Not a known Class. Sorry")))))))))))))
        
        
 Armor_Class <- c(Armor, Type.of.armor)                                                                        
                                                                                                                                                        
  return(Armor_Class)
}
        
