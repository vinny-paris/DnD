#Run this file and it should create two lists
#First list will have details of the ones that use spells

#Second List will have details of characters that dont use spells

library(rvest)
library(dplyr)


url<- list()
spell.char<- list()
url[1] <- "http://www.5esrd.com/classes/bard/"
url[2] <- "http://www.5esrd.com/classes/ranger/"
url[3] <- "http://www.5esrd.com/classes/paladin/"
url[4] <- "http://www.5esrd.com/classes/wizard/"
url[5] <- "http://www.5esrd.com/classes/sorcerer/"
url[6] <- "http://www.5esrd.com/classes/cleric/"
url[7] <- "http://www.5esrd.com/classes/druid/"


for(i in 1:7)
{
  html <- read_html(url[i][[1]])
  tables <- html %>% html_table(fill=TRUE)
  #tables %>% purrr::map(glimpse)
  
  df<- tables[[2]]
  df<- as.data.frame(df)
  colnames(df)<- df[1,]
  df<- df[-1,]
  
  
  spell.char[[i]]<- df
  rm(df,html,tables)
  
}
names(spell.char)<- c("bard", "ranger", "paladin","wizard","sorcerer","cleric","druid")

nospell.char<- list()
urlnospell<- list()
urlnospell[1]<- "http://www.5esrd.com/classes/barbarian/"
urlnospell[2]<- "http://www.5esrd.com/classes/warlock/"
urlnospell[3]<- "http://www.5esrd.com/classes/fighter/"
urlnospell[4]<- "http://www.5esrd.com/classes/rogue/"
urlnospell[5]<- "http://www.5esrd.com/classes/monk/"
for(i in 1:2)
{
  html <- read_html(urlnospell[i][[1]])
  tables <- html %>% html_table(fill=TRUE)
  df<- tables[[1]]
  df<- as.data.frame(df)
  nospell.char[[i]]<- df
  rm(df,html,tables)
  
}

for(i in 3:5)
{
  html <- read_html(urlnospell[i][[1]])
  tables <- html %>% html_table(fill=TRUE)
  df<- tables[[2]]
  df<- as.data.frame(df)
  nospell.char[[i]]<- df
  rm(df,html,tables)
  
}
names(nospell.char)<- c("barbarian","warlock","fighter","rogue","monk")
nospell.char
spell.char[[1]][7,]

spell.char
