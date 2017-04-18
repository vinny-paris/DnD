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
        
