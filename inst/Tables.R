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


skills <- c("Acrobatics",
"Animal Handling",
"Arcana",
"Athletics",
"Deception",
"History",
"Insight",
"Intimidation",
"Investigation",
"Medicine",
"Nature",
"Perception",
"Performance",
"Persuasion",
"Religion",
"Sleight of Hand",
"Stealth",
"Survival")

Barbarian.skills <- c("Animal Handling", "Athletics",
"Intimidation", "Nature", "Perception",  "Survival")
Bard.skills <- c("Preformance", "Persuasion", "Perception", "Arcana", "Insight", "History")
Cleric.skills <- c("History", "Insight", "Medicine",
"Persuasion", "Religion")
Druid.skills <- c("Arcana", "Animal Handling", "Insight", "Medicine", "Nature", "Perception", "Religion", "Survival")
Fighter.skills <- c("Acrobatics", "Animal Handling", "Athletics", "History", "Insight", "Intimidation", "Perception",  "Survival")
Monk.skills <- c("Acrobatics", "Athletics", "History",
"Insight", "Religion",  "Stealth")
Paladin.skills <- c("Athletics", "Insight", "Intimidation",
"Medicine", "Persuasion",  "Religion")
Ranger.skills <- c("Animal Handling",
"Athletics", "Insight", "Investigation", "Nature", "Perception", "Stealth",  "Survival")
Rogue.skills <- c("Athletics",
"Deception", "Insight", "Intimidation", "Investigation", "Perception", "Performance", "Persuasion", "Sleight of Hand",  "Stealth")
Socerer.skills <- c("Arcana", "Deception", "Insight",
"Intimidation", "Persuasion",  "Religion")
Warlock.skills <- c("Arcana",
"Deception", "History", "Intimidation", "Investigation", "Nature",  "Religion")
Wizard.skills <- c("Arcana", "History", "Insight",
"Investigation", "Medicine",  "Religion")

hold <- sapply(list(Barbarian.skills = Barbarian.skills, Bard.skills = Bard.skills, Cleric.skills = Cleric.skills, Druid.skills = Druid.skills, Fighter.skills = Fighter.skills, Monk.skills = Monk.skills, Paladin.skills = Paladin.skills, Ranger.skills = Ranger.skills, Rogue.skills = Rogue.skills, Socerer.skills = Socerer.skills, Warlock.skills = Warlock.skills, Wizard.skills = Wizard.skills), function(u) as.numeric(skills %in% u))
hold <- data.frame(hold)
row.names(hold) <- skills
colnames(hold) <- types.of.classes
Skills_by_Class <- hold
Save(Skills_by_Class, "Skills_by_Class.rda")





