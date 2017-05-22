
search_spells <- function(pattern, names.only = T, quick.return = T){

  
pattern <- deparse(substitute(pattern))  

  
testing <- spell_description %>% map(names) %>% map(grep, pattern = pattern)
testing

f <- ifelse(length(unlist(testing)) == 0 & length(para_search(pattern)) == 0, paste("No Matches. Sorry but check spelling maybe?  :/   "), {

names.only <- ifelse(sum(pattern == unlist(Spell_List)) == 1 & length(unlist(testing)) == 1 & quick.return == T, F, names.only)




nam <- melt(testing[lapply(testing,length)>0])[,2]
nam


unit.num <- unlist(testing)
unit.num

hope <- cbind(unit.num, nam)

holding <- NULL
for(i in 1:dim(hope)[1]){
lis <- list( spell_description[[hope[i,2]]][[as.numeric(hope[i,1])]])
notice <- capitalize(gsub('\\.', ' ', hope[i,2]))
notice <- ifelse(notice == 'Cantrip', 'Level 0', notice)
names(lis) <- list(Spell_List[[notice]][[as.numeric(hope[i,1])]])
holding <- c(holding, lis)
}
spell_nams <- (names(holding))
findings <- if(names.only == T){spell_nams} else{holding}
done <- list(findings, para_search(pattern))
names(done) <- c('Spell Names', 'In Body of Text')
return(done)

})
return(f)
}

search_spells(skin)
search_spells(fire)
search_spells(Heal, names.only = T)
search_spells(Stoneskin)
search_spells(skin, names.only = F)
search_spells(Stoneskin, quick.return = F)
search_spells(fare)
