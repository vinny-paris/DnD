DnD <- function(which.person = which.person, which.level = which.level, ...){
  
background <- function() {
  system("../Downloads/phantomjs scrape_techstars.js")
html <- read_html("techstars.html")
Holding <- html %>% html_nodes("dl, dd") %>% html_text %>% .[2] %>% capitalize
return(Holding)}


#Background and Stats
{
    stats <- stat.roll(...)
    back <- background()
}



#Collect Race and Class
which.class <- unlist(str_split(back, " "))[3]
which.race <- unlist(str_split(back, " "))[2]
which.personality <- unlist(str_split(back, " "))[1]




#Make my character already
 Player.1 <- list(
                Gamer = deparse(substitute(which.person)),
                Race = which.race,
                Level = which.level,
                Class = which.class,
                Personality = which.personality,
                hp = hp.calculator(paste(which.class), which.level) + stats[2, "con"],
                stats,
                back
       )

        class(Player.1) <- append(class(Player.1),"DnD")
        return(Player.1)
}


}


