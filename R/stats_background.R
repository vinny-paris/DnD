#' DnD Character Generator
#' 
#' Creates a DnD 5th edition character that is roughly built according to the rules. An important point is that the object is automatically built inside the function, DO NOT USE ASSINGMENT. This is redundant.
#' @param ... The method used to roll the dice. Options include Commoner.Method (which is defaulted inside of DnD), Base.Method, Pilsfer.Method, Heroic.Method, and Ferguson.Method. 
#' @seealso Method and Stats are covered more in depth at \code{\link{stat.roll}}
#' @seealso Method for obtaining the spells for a character at \code{\link{my.spells}}
#' @seealso Method for obtaining the armor class for a character at \code{\link{armor.class}}
#' @seealso Method for obtaining the hit points for a character at \code{\link{hp.calculator}}
#' @export
#' @param which.person Who is this character? Any character string will work, don't need to use quotes.
#' @param which.level What level is the character? Please only choose numbers between 1 and 20.
#' @param class What class would you like the character to be? It will default to being randomly generated. Again, no quotes please.
#' @param race What race would you like the character to be? It will default to being randomly choosen. Again, no quotes please.
#' @note The characters produced here will have a class (as in R class) of "DnD"
#' @details  The following are all the pieces returned by the functon.
#' \itemize{
#' \item{Gamer:}{ which.person}
#' \item{Race:}{ The race of the character, one of 9 possible}
#' \item{Level:}{ which.level}
#' \item{Class:}{ The class of the character, one of 12 possible}
#' \item{Proficiency.Bonus:}{ The proficiency bonus modifier for known skills and saves}
#' \item{Saves:}{ Known saves of the class, 1 for known, 0 for unkown}
#' \item{Skills:}{ Known skills of the class}
#' \item{hp:}{ The maximum and current hit points of a character}
#' \item{Statistics:}{ The Stats and mod created for the character. Go to stat.roll help page for more indepth coverage. IMPORTANT: Stats are assigned according to the class inside the DnD function so do not try to pass this parameter in!}
#' \item{Weapons:}{ Three randomly assigned weapons regardless of proficiency or class}
#' \item{Armor.Class:}{ What armor is the character wearing and what is his AC?}
#' \item{Background:}{ Personality and motivation for the character}
#' \item{Spells:}{ The spells known/prepared for the character. See the help page for my.spells for more}
#' }






DnD <- function(which.person = which.person, which.level = which.level, class = 0, race = 0,  ...){

#Data tables for daaaayyysssss
  Stories <- DnD::Stories
  race_table <- DnD::race_table
  class_table <- DnD::class_table
  stats_table <- DnD::stats_table
  prof <- DnD::prof
  spell_description <- DnD::spell_description
  Spell_List <- DnD::Spell_List
  Spells_by_Class <- DnD::Spells_by_Class
  Skills_by_Class <- DnD::Skills_by_Class
  Weapons <- DnD::weapons
  character_tables <- DnD::character_tables

  
types.of.classes <- c("Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard")
types.of.races <- c("Elf", "Human", "Halfling", "Dwarf", "Half-orc", "Half-elf", "Gnome", "Tiefling", "Dragonborn")

race <- deparse(substitute(race))
class <- deparse(substitute(class))

#Background and Stats

                rad <- c(ceiling(runif(1, min = 0, max = 151)), ceiling(runif(1, min = 0, max = 9)), ceiling(runif(1, min = 0, max = 12)), ceiling(runif(1, min = 0, max = 784)))
                which.race <- ifelse(race == 0, Stories[[2]][rad[2],], race)
                which.class <- ifelse(class == 0, Stories[[3]][rad[3],], class)
                
    ifelse(sum(which.class == types.of.classes) == 0, return(paste('Not a reconginized class')), 
         ifelse(sum(which.race == types.of.races) == 0, return(paste('Note a reconginized race')), { 
           back <- str_c(Stories[[1]][rad[1],], which.race, which.class, Stories[[4]][rad[4],], sep = " ")
           
                         
#Spells, no one wants to see the warnings that are completely a neccessary byproduct of the function
    Spells <- suppressWarnings(my.spells(which.level, which.class))
    
#Making the Stats
    Stats <- stats_table[,paste(which.class)]
      stats <- stat.roll(Stats = Stats, ...)
      stats <- stats[,match(row.names(DnD::race_table), colnames(stats))]
      stats[1,] <- stats[1,]  + t(race_table[,paste(which.race)])
      stats[2,] <- floor((stats[1,] - 10)/2)

#Make my character already
 Player.1 <- list(
                Gamer             = deparse(substitute(which.person)),
                
                Race              = which.race,
                
                Level             = which.level,
                
                Class             = which.class,
                
                Proficiency.Bonus = prof[which.level],
                
                Saves             = class_table[which.class==types.of.classes],
                
                Skills            = row.names(Skills_by_Class)[as.logical(Skills_by_Class[,which.class])],
                
                hp                = hp.calculator(paste(which.class), which.level) + which.level*stats[2, "con"],
                
                Statistics        = stats,
                
                Weapons           = sample(Weapons, 3, replace = T),
                
                Armor.Class       = armor.class(which.class, stats),
                
                Background        = back,
                
                Spells            = Spells
                
       )

  class(Player.1) <- append(class(Player.1),"DnD")
  eval(parse(text = paste(substitute(which.person), "<<- Player.1")))
  
return(Player.1)
       }
))

}










