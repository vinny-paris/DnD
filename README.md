# 585 Project

## Title: 

Dungeons & Dragons Character Creator 

## Abstract: 

As a game, Dungeons & Dragons has an issue. Due to the players ability to get off course, the Game Master must improvise certain non-playable characters. This involves a bit of work and creates downtime in the game. This package seeks to help streamline that process. It will randomize the race, class, hit points, statistics, spell list (if applicable), weapons and personality. All important features of a character will be included in the output. All the randomization will allow for a lower bound of 6.369611e+19 of unique characters inside the package. Auxillary to the main character creating function certain other functions that replicate common game experiences (lowering/increasing hit points, making a knowledge check, etc....) There are few good alternatives available; they either cost money or are slow/overly complicated/bare bone to fit this particular niche. 

## Description:

This package has a few functions. It will create the character and produce an abbreviated character sheet, produce a small dice rolling function, allow for both checks and saves on a character, and allow for a damage/heal/rest ability. The  functions are ```DnD(which.character, level, race, class)``` and ```roll(sides, num.of.dice, type)``` which is the character creator and the dice rolling function respectively. Once the DnD character has been created there are two types of special rolling that are available ```check_rolL(which.character, skill)``` and ```saving_throw(which.character, save)``` that will roll for a skill check or a saving throw for the DnD character. ```heal(which.character, health)```, ```damage(which.character, damage)```, and ```rest(which.character)``` will allow for the current hit points to be increased, decreased or returned to full. The final function is ```initiative(which.character)``` which will allow for a simulated initiative roll for the character. 