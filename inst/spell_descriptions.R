html <- read_html("http://thebombzen.github.io/grimoire/spells/mass-heal")

#works well for spell info
Para <- html %>% html_nodes(".post-content") %>% html_text
head(Para)
listed <- strsplit(Para, "n\n")


listed <- list()
super.list <- list()
spelly <- 
  for(j in 1:10){
    listed <- NULL
    listed <- list()
for (i in Spell_List[[j]]){
  namey <- gsub("ge/", "ge-", trimws(i))
    namey <- gsub("ss/", "ss", trimws(namey))
        namey <- gsub("y/", "y-", trimws(namey))
  namey <- tolower(gsub(" ", "-", trimws(namey)))
    namey <-gsub("'", "", trimws(namey))
  ur <- paste("http://thebombzen.github.io/grimoire/spells", namey, sep='/')
  htm <- read_html(ur)
  Para <- htm %>% html_nodes(".post-content") %>% html_text
  listed[[i]] <- strsplit(Para, "\n")
  listed[[i]] <- unique(listed[[i]][[1]]) %>% trimws() %>% .[-2]
  
  
}
  super.list[[j]] <- listed
}
  
spell_description <- list(cantrip = super.list[[1]], level.1=super.list[[2]], level.2 = super.list[[3]], level.3 = super.list[[4]], level.4 = super.list[[5]], level.5 =super.list[[6]], level.6 = super.list[[7]], level.7 = super.list[[8]], level.8 = super.list[[9]], level.9=super.list[[10]])



