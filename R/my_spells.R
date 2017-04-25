#' Spell Creator
#' 
#' Create a spell list for a character based on class and level
#' @export
#' @param which.level The level will determine how many spells of each level (if any) a character will know
#' @param which.class The class of the character will establish what spell list we need to work out of for this to generate properly. If a non-casting class is chosen a warning message will appear.
#' @return Will return a list of 10 with spell levels 1-9 making up the first part and the tenth being Cantrips. 
#' @note Warlocks wil be given "Known Spells", "Cantrips", and "Spell Slots" given the uniquness of their class.
#' @note We are taking great liberties on known spells vs prepared spells inorder to stream line the process. More or less you will know and have prepared the exact number of spells you can cast at that level.
#' @examples
#' my.spells(10, "Warlock")
#' my.spells(20, "Bard")
#' my.spells(3, "Wizard")
#' my.spells(10, "Barbarian")






my.spells <- function(which.level, which.class){
  
bard.spells.rando <- function(which.level){
j <- character_tables$bard[which.level,4:14]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Bard))]
kc <- sample(cantrips, j[1])

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Bard
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
sub.holding <- sample(holding, j[i+2])
my.list[[i]] <- unname(sub.holding)
}
kc <- list(kc)
fav <- c(my.list, kc)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Cantrips")
return(fav)
}




cleric.spells.rando <- function(which.level){
j <- character_tables$cleric[which.level,4:13]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Cleric))]
known.cantrips <- sample(cantrips,j[1])

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Cleric
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]

sub.holding <- sample(holding, j[i+1])
my.list[[i]] <- unname(sub.holding)
}
known.cantrips <- list(known.cantrips)
fav <- c(my.list, known.cantrips)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Cantrips")
return(fav)
}




druid.spells.rando <- function(which.level){
j <- character_tables$druid[which.level,4:13]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Druid))]
known.cantrips <- sample(cantrips, j[1])

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Druid
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
sub.holding <- sample(holding, j[i+1])
my.list[[i]] <- unname(sub.holding)
}
known.cantrips <- list(known.cantrips)
fav <- c(my.list, known.cantrips)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Cantrips")
return(fav)
}



ranger.spells.rando <- function(which.level){
j <- character_tables$ranger[which.level,3:9]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0

my.list <- vector("list", 5)
for(i in 1:5){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Ranger
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
sub.holding <- sample(holding, j[i])
my.list[[i]] <- unname(sub.holding)
}
names(my.list)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5")
return(my.list)
}



paladin.spells.rando <- function(which.level){
j <- character_tables$paladin[which.level,4:8]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0

my.list <- vector("list", 5)
for(i in 1:5){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Paladin
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
sub.holding <- sample(holding, j[i])
my.list[[i]] <- unname(sub.holding)
}
fav <- c(my.list)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5")
return(fav)
}



wizard.spells.rando <- function(which.level){
j <- character_tables$wizard[which.level,4:13]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Wizard))]
known.cantrips <- sample(cantrips, j[1])

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Wizard
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
sub.holding <- sample(holding, j[i+1])
my.list[[i]] <- unname(sub.holding)
}
known.cantrips <- list(known.cantrips)
fav <- c(my.list, known.cantrips)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Cantrips")
return(fav)
}
    

sorcerer.spells.rando <- function(which.level){
j <- character_tables$sorcerer[which.level,5:15]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Sorcerer))]
known.cantrips <- sample(cantrips, j[1])

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Sorcerer
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
sub.holding <- sample(holding, j[i+2])
my.list[[i]] <- unname(sub.holding)
}
known.cantrips <- list(known.cantrips)
fav <- c(my.list, known.cantrips)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Cantrips")
return(fav)
}


warlock.spells.rando <- function(which.level){
j <- character_tables$warlock[which.level,4:7]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Warlock))]
known.cantrips <- sample(cantrips, j[1])

my.list <- vector("list", 9)
for(i in 1:5){
  asd <- sub("st", "", character_tables$warlock[,7])
 asd <- sub("nd", "", asd)
 asd <- sub("rd", "", asd)
 asd <- sub("th", "", asd)
  SL <- unlist(Spell_List[1:(as.numeric(asd[which.level])+1)])
  CS <- Class_Spells$Warlock
  holding <- unlist(Spell_List[2:(as.numeric(asd[which.level])+1)])[as.logical(as.numeric(SL %in% CS))]

sub.holding <- sample(holding, j[2])
sub.holding <- unname(sub.holding)
}

fav <- list(sub.holding, known.cantrips, j[3])
names(fav)<- c("Known Spells", "Cantrips", "Spell Slots")
return(fav)
}

ifelse(which.class == "Bard", spells <- bard.spells.rando(which.level),
     ifelse(which.class == "Cleric", spells <- cleric.spells.rando(which.level),
            ifelse(which.class == "Druid", spells <- druid.spells.rando(which.level),
                   ifelse(which.class == "Paladin", spells <- paladin.spells.rando(which.level),
                          ifelse(which.class == "Ranger", spells <- ranger.spells.rando(which.level),
                                 ifelse(which.class == "Sorcerer", spells <- sorcerer.spells.rando(which.level),
                                        ifelse(which.class == "Warlock", spells <- warlock.spells.rando(which.level),
                                               ifelse(which.class == "Wizard", spells <- wizard.spells.rando(which.level),
                                                      spells <- paste("Non-casting Class")))))))))
  spells <- spells[lapply(spells,length)>0]
return(spells)
}

