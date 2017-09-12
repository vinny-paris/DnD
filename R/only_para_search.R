#' Finds the pattern matches in paragraphs of spells but with some naming witchcraft
#' 
#' We searched the text of the spells for a matching character string and returned the names of the spells they were in.
#' @param pattern The pattern to be searched for
#' @return Names of spells with paragraph matches as well as an entry saying no named spells where found



only_para_search <- function(pattern){
  solution <- list(para_search(pattern),"Sorry No Matches, try spelling maybe :( ")
  names(solution) <- c("In Body of Text","Spell Names")
  return(solution)
}
