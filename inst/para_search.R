para_search <- function(pattern){

testing <- at_depth(spell_description, 2, grep, pattern = pattern)

nam <- melt(testing[lapply(testing,length)>0])[,2]

return(nam)
}

