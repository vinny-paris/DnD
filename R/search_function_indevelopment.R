
jack <- spell_description %>% map(names) %>% map(grep, pattern = "fire")
jack


nam <- names(unlist(jack))
nam


unit.num <- unlist(jack)
unit.num



list(nam, spell_description[[nam]][[unit.num]])


