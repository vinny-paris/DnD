html <- read_html("http://thebombzen.github.io/grimoire/tags/bard.html")

#works well for spell info
Para <- html %>% html_nodes(".post-link") %>% html_text
Bard.spells <- Para

html <- read_html("http://thebombzen.github.io/grimoire/tags/cleric.html")
Para <- html %>% html_nodes(".post-link") %>% html_text
Cleric.spells <- Para


html <- read_html("http://thebombzen.github.io/grimoire/tags/druid.html")
Para <- html %>% html_nodes(".post-link") %>% html_text
Druid.spells <- Para

html <- read_html("http://thebombzen.github.io/grimoire/tags/paladin.html")
Para <- html %>% html_nodes(".post-link") %>% html_text
Paladin.spells <- Para

html <- read_html("http://thebombzen.github.io/grimoire/tags/ranger.html")
Para <- html %>% html_nodes(".post-link") %>% html_text
Ranger.spells <- Para

html <- read_html("http://thebombzen.github.io/grimoire/tags/sorcerer.html")
Para <- html %>% html_nodes(".post-link") %>% html_text
Socerer.spells <- Para

html <- read_html("http://thebombzen.github.io/grimoire/tags/warlock.html")
Para <- html %>% html_nodes(".post-link") %>% html_text
Warlock.spells <- Para

html <- read_html("http://thebombzen.github.io/grimoire/tags/wizard.html")
Para <- html %>% html_nodes(".post-link") %>% html_text
Wizard.spells <- Para



res <- sapply(list(Wizard.spells = Wizard.spells, Warlock.spells = Warlock.spells, Soceror.spells = Soceror.spells, Ranger.spells = Ranger.spells, Paladin.spells = Paladin.spells, Druid.spells = Druid.spells, Cleric.spells = Cleric.spells, Bard.spells = Bard.spells), function(u) as.numeric(unlist(Spell_List) %in% u))
row.names(res) <- unlist(Spell_List)
Spells_by_Class <- res
Save(Spells_by_Class, "Spells_by_Class")
