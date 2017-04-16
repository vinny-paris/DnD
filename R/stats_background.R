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
    
    stats <- stats[,match(colnames(stats), row.names(race_table))]
    stats[1,] <- stats[1,]  + t(race_table[,paste(which.race)])

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









