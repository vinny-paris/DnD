
background <- function() {
rad <- c(ceiling(runif(1, min = 0, max = 151)), ceiling(runif(1, min = 0, max = 9)), ceiling(runif(1, min = 0, max = 12)), ceiling(runif(1, min = 0, max = 784)))
background <- str_c(Stories[[1]][rad[1],], Stories[[2]][rad[2],], Stories[[3]][rad[3],], Stories[[4]][rad[4],], sep = " ")
return(background)
}



jk <- replicate(200, background())
read.1 <- as.character(unlist(read.csv("Background1")[,2]))
read.2 <- as.character(read.csv("Background2")[,2])
read.3 <- as.character(read.csv("Background3")[,2])
read.4 <- as.character(read.csv("Background4")[,2])
back <- c(read.1, read.2, read.3, read.4)
forward <- back[!(personality[1] == "Absent"| personality[1] == "Pretty")]
forward <- forward[-554]







library(reshape2)
personalit <- colsplit(forward," ",c("Personality","Race"))
holding <- apply(personalit[2], 2, as.character)
race <- colsplit(holding, " ", c("Race", "Background"))
holding.2 <- apply(race[2], 2, as.character)
class <- colsplit(holding.2, " ", c("Class", "Background"))

Personality <- unique(personalit[1], rm.na=T)
Race <- unique(race[1], rm.na=T)
Class <- unique(class[1], rm.na=T)
Motivation <- unique(class[2], rm.na=T)

Stories <- list(Personality, Race, Class, Motivation)
write.csv(Stories, "Stories.csv")

