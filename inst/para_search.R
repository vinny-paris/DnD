#' Finds the pattern matches in paragraphs of spells
#' 
#' We searched the text of the spells for a matching character string and returned the names of the spells they were in.
#' @param pattern The pattern to be searched for
#' @return Names of spells with paragraph matches




para_search <- function(pattern){

testing <- at_depth(spell_description, 2, grep, pattern = pattern)

nam <- melt(testing[lapply(testing,length)>0])[,2]

return(nam)
}

