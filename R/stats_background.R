
DnD <- function(which.person = which.person, which.level = which.level, ...){
  
background <- function() {
  system(".Downloads/phantomjs scrape_techstars.js")
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



background <- function() {
  system("./phantomjs scrape_techstars.js")
html <- read_html("techstars.html")
Holding <- html %>% html_nodes("dl, dd") %>% html_text %>% .[2] %>% capitalize
return(Holding)}

Base.Method <- function(Stats= c("str", "con", "dex", "int", "wis", "char")){
  Holding <- NULL
  for (i in 1:length(Stats))
    {
  j <- runif(3, min = 0, max = 6)
  Holding[i] <- sum(ceiling(j))
  }
    
  Finale <- Holding[sort.list(Holding, decreasing = TRUE)]
  names(Finale) <- Stats
  mod <- floor((Finale - 10)/2)
  Finale <- cbind(Finale, mod)
  colnames(Finale) <- c("Stats", "mod")
    return(Finale)
}




my.function <- funtion(url) {
        s <- read_html(paste(url))
        html %>% html("#info .poptip") %>% html_text()
        table <- html %>% html_table()
        
        
