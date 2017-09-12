#' Search Spells for a given pattern
#' 
#' This will search the spell list for both names of the spells proper and the body of the spell text.
#' @export
#' @param pattern The character string to search for in both names and and body of the paragraphs. No quotations and no spaces please.
#' @param names.only This will return only the names and of the spells where the matches exist. If false, then all the information of the spell is presented.
#' @param quick.return If the match fits only one spell then the entire info of the spell is returned. This is dependent of the names.only parameter to be true.  
#' @return Will return a list. The first element is the matching names of spells. If the match is perfect with one name it will return a list of lists for all spell info presented. The second item is the list of names of spells where the match is in the body of the test.







search_spells <- function(pattern, names.only = T, quick.return = T){

  
pattern <- deparse(substitute(pattern))  

  
testing <- spell_description %>% map(names) %>% map(grep, pattern = pattern, ignore.case = T)
testing


f <- ifelse(length(unlist(testing)) == 0 & length(DnD:::para_search(pattern)) == 0, paste("No Matches. Sorry but check spelling maybe?  :/   "), {

names.only <- ifelse(sum(pattern == unlist(Spell_List)) == 1 & length(unlist(testing)) == 1 & quick.return == T, F, names.only)


f <- ifelse(length(unlist(testing)) == 0, assign("In Body of Text", only_para_search(pattern)), {
    

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
done <- list(findings, DnD:::para_search(pattern))
names(done) <- c('Spell Names', 'In Body of Text')
done[[2]] <- unique(done[[2]])
return(done)  
})
ifelse(length(f) == 1, names(f) <- c("In Body of Text"), f)
return(f)

})



}



