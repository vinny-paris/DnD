
my.spells <- function(which.level, which.class){
  
bard.spells.rando <- function(which.level){
j <- character_tables$bard[which.level,4:14]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Bard))]
known.cantrips <- cantrips[ceiling(runif(j[1], min=0, max = length(cantrips)))]

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Bard
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
  randos <- ceiling(runif(j[i+2], min=0, max = length(holding)))
sub.holding <- holding[randos]
my.list[[i]] <- unname(sub.holding)
}
known.cantrips <- list(known.cantrips)
fav <- c(my.list, known.cantrips)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Cantrips")
return(fav)
}




cleric.spells.rando <- function(which.level){
j <- character_tables$cleric[which.level,4:13]
j <- as.numeric(as.character(j))
j[is.na(j)]<- 0
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Cleric))]
known.cantrips <- cantrips[ceiling(runif(j[1], min=0, max = length(cantrips)))]

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Cleric
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
  randos <- ceiling(runif(j[i+1], min=0, max = length(holding)))
sub.holding <- holding[randos]
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
known.cantrips <- cantrips[ceiling(runif(j[1], min=0, max = length(cantrips)))]

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Druid
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
  randos <- ceiling(runif(j[i+1], min=0, max = length(holding)))
sub.holding <- holding[randos]
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
cantrips <- unlist(Spell_List$`Level 0`)[as.logical(as.numeric(Spell_List$`Level 0` %in% Class_Spells$Bard))]
known.cantrips <- cantrips[ceiling(runif(j[7], min=0, max = length(cantrips)))]

my.list <- vector("list", 5)
for(i in 1:5){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Ranger
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
  randos <- ceiling(runif(j[i], min=0, max = length(holding)))
sub.holding <- holding[randos]
my.list[[i]] <- unname(sub.holding)
}
known.cantrips <- list(known.cantrips)
fav <- c(my.list, known.cantrips)
names(fav)<- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Cantrips")
return(fav)
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
  randos <- ceiling(runif(j[i], min=0, max = length(holding)))
sub.holding <- holding[randos]
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
known.cantrips <- cantrips[ceiling(runif(j[1], min=0, max = length(cantrips)))]

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Wizard
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
  randos <- ceiling(runif(j[i+1], min=0, max = length(holding)))
sub.holding <- holding[randos]
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
known.cantrips <- cantrips[ceiling(runif(j[1], min=0, max = length(cantrips)))]

my.list <- vector("list", 9)
for(i in 1:9){
  SL <- Spell_List[[i+1]]
  CS <- Class_Spells$Sorcerer
  holding <- unlist(Spell_List[i+1])[as.logical(as.numeric(SL %in% CS))]
  randos <- ceiling(runif(j[i+2], min=0, max = length(holding)))
sub.holding <- holding[randos]
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
known.cantrips <- cantrips[ceiling(runif(j[1], min=0, max = length(cantrips)))]

my.list <- vector("list", 9)
for(i in 1:5){
  asd <- sub("st", "", character_tables$warlock[,7])
 asd <- sub("nd", "", asd)
 asd <- sub("rd", "", asd)
 asd <- sub("th", "", asd)
  SL <- unlist(Spell_List[1:asd[which.level]])
  CS <- Class_Spells$Warlock
  holding <- unlist(Spell_List[1:asd[which.level]])[as.logical(as.numeric(SL %in% CS))]
  randos <- ceiling(runif(j[2], min=0, max = length(holding)))
  
sub.holding <- holding[randos]
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
  
return(spells)
}
