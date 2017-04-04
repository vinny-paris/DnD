DnD <- function(which.person = which.person , my.race = "Elf", which.level = level, which.class = class)
{

        Player.1 <- list(
                Gamer = which.person,
                Race = my.race,
                Level = which.level,
                Class = which.class
       )

        class(Player.1) <- append(class(Player.1),"DnD")
        return(Player.1)
}

Pathfinder <- function(which.person = which.person , my.race = "Elf", which.level = level, which.class = class)
{

        Player.1 <- list(
                Gamer = which.person,
                Race = my.race,
                Level = which.level,
                Class = which.class
       )

        class(Player.1) <- append(class(Player.1),"Pathfinder")
        return(Player.1)
}
#Pathfinder is an old DnD-esq game if you are wondering. Very similar look though. 


example <- DnD("Vinny", "Half-Elf", 5, "Cleric")
example
ex2 <- Pathfinder("Nick", "Human", 8, "Druid")
ex2


GamingCharacter <- function(x){
  UseMethod('GamingCharacter', x)
}

GamingCharacter.Pathfinder <- function(x) {
print("Pathfinder, update already")
}

GamingCharacter.DnD <- function(x){ 
  print("DnD object, Nerd!")
}

GamingCharacter.default <- function(x)
        {
                print("Not a DnD Object")
        }
        
GamingCharacter(ex2)
GamingCharacter(example)
```