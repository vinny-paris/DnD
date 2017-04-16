#' Spell Descriptions  
#'
#' This is a list arranged from cantrip (0 level spell) up until 9th level. Inside each element of a spell level is another list made up of the major characteristics of that spell
#' @format A three layered list in the order of Levels -> Spells -> Characteristics of the Spell
#' \describe{
#'   \item{Levels}{Cantrips for the first element, all the rest are the spell levels + 1}
#'   \item{Spells}{Given by name in alphabetical ordering}
#'   \item{Characteristics of the Spell}{A list of the major parts of the spell including Range, Targets, School, ect..}
#'   ...
#' }
#' @source \url{Dungeon and Dragons Fifth Edition Player's Hand Book}

"spell_description"