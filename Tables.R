prof <- c(2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6)

Saves <- c("Strength", "Dexterity", "Consititution", "Intelligence", "Wisdom", "Charisma")
Barbarian <- c(1, 0,1,0,0,0)
Bard <- c(0,1,0,0,0,1)
Cleric <- c(0,0,0,0,1,1)
Druid <- c(0,0,0,1,1,0)
Fighter <- c(1,0,1,0,0,0) 
Monk <- c(1,1,0,0,0,0)
Paladin <- c(0,0,0,0,1,1)
Ranger <- c(1,1,0,0,0,0)
Rogue <- c(0,1,0,1,0,0)
Sorceror <-c(0,0,1,0,0,1)
Warlock <-c(0,0,0,0,1,1)
Wizard <- c(0,0,0,1,1,0)

class.table <- as.data.frame(cbind(Barbarian, Bard, Cleric, Druid, Fighter, Monk, Paladin, Rogue, Sorceror, Warlock, Wizard))
row.names(class.table) <- Saves

types.of.classes <- c("Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorceror", "Warlock", "Wizard")



nam <- c("str", "dex", "con", "int", "wis", "char")
Elf <- c(0,2,0,0,1,0)
Halfing <- c(0,2,1,0,0,0)
Human <- c(1,1,1,1,1,1)
Dragonborn <- c(2,0,0,0,0,1)
Gnome <- c(0,0,1,2,0,0)
HE<- c(0,0,1,1,0,2)
HO <- c(2,0,1,0,0,0)
Tiefling <- c(0,0,0,1,0,2)
race.table <- data.frame(Elf, Halfing, Human, Dragonborn, Gnome, HE, HO, Tiefling)
row.names(race.table) <- nam
names(race.table) <- c("Elf", "Halfing", "Human", "Dragonborn", "Gnome", "Half-elf", "Half-orc", "Tiefling")
