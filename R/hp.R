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
   HP <- c(total.hp, total.hp, hit.dice)
   names(HP) <- c("Max HP", "Current HP", "Hit Dice")
   return(HP)
 }
}

Damage <- function(Character = Character, damage = damage){
  Character$hp[2] <<- (Character$hp[2] - damage)
   return(Character)
}

Heal <- function(Character = Character, heal = heal) {
  Character$hp[2] <- (Character$hp[2] + heal)
   name<- deparse(substitute(Character)) 
  assign(name, Character, env=globalenv())
   return(Character$hp)
}


Rest <- function(Character = Character) {
  Character$hp[2] <- Character$hp[1] 
   return(Character$hp)
}

