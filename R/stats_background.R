DnD <- function(which.person = which.person, which.level = which.level, ...){
  


#Background and Stats
{
      background <- function() {
                rad <- c(ceiling(runif(1, min = 0, max = 151)), ceiling(runif(1, min = 0, max = 9)), ceiling(runif(1, min = 0, max = 12)), ceiling(runif(1, min = 0, max = 784)))
                background <- str_c(Stories[[1]][rad[1],], Stories[[2]][rad[2],], Stories[[3]][rad[3],], Stories[[4]][rad[4],], sep = " ")
                return(background)
              }
    back <- background()
}



#Collect Race and Class
which.class <- unlist(str_split(back, " "))[3]
which.race <- unlist(str_split(back, " "))[2]
which.personality <- unlist(str_split(back, " "))[1]




    stats <- stat.roll(...)
    
    stats <- stats[,match(colnames(stats), row.names(race.table))]
    stats[1,] <- stats[1,]  + t(race.table[,(paste(which.race))])

#Make my character already
 Player.1 <- list(
                Gamer = deparse(substitute(which.person)),
                Race = which.race,
                Level = which.level,
                Class = which.class,
                Proficiency.Bonus = prof[which.level],
                Saves = class.table[which.class==types.of.classes],
                Skills = row.names(Skills_by_Class)[as.logical(Skills_by_Class[,which.class])],
                hp = hp.calculator(paste(which.class), which.level) + which.level*stats[2, "con"],
                stats,
                back
       )

        class(Player.1) <- append(class(Player.1),"DnD")
        return(Player.1)
}

prod(9,151, 784, 12)
DnD(Vinny, 20)

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

rad <- c(ceiling(runif(1, min = 0, max = 154)), ceiling(runif(1, min = 0, max = 12)), ceiling(runif(1, min = 0, max = 17)), ceiling(runif(1, min = 0, max = 233)), ceiling(runif(1, min = 0, max = 261)))
background <- str_c(Personality[rad[1],], Race[rad[2],], Class[rad[3],], From[rad[4],], "who", Motivation[rad[5],], sep = " ")
background <- function() {
setwd('../Downloads')
  system('../Downloads/phantomjs scrape_techstars.js')
html <- read_html("techstars.html")
Holding <- html %>% html_nodes("dl, dd") %>% html_text %>% .[2] %>% capitalize
return(Holding)}
