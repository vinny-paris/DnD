# 585 Project

## Title: 

Dungeons & Dragons Character Creator 

## Abstract: 

As a game, Dungeons & Dragons has an issue. Due to the players ability to get off course, the DM must improvise certain non-playable characters. This involves a bit of work and creates downtime in the game. This package seeks to help streamline that process. It will randomize the race, class, hit points, statistics, spell list (if applicable), and personality. All important features of a character will be included in the output. All the randomization will allow for a lower bound of 6.369611e+19 of unique characters inside the package. Also, there be will implement a small dice rolling function. This is a list heavy package. There are few good alternatives available; they either cost money or are slow/overly complicated/bare bone to fit this particular niche. 

## Description:

This package has three functions. It will create the character and produce an abbreviated character sheet as well as a small dice rolling function. The  functions are ```DnD(which.character, level, race, class)``` and ```roll(sides, num.of.dice, type)``` which is the character creator and the dice rolling function respectively. Once the DnD character has been created there are two types of special rolling that are available ```check_rolL(which.character, skill)``` and ```saving_throw(which.character, save)``` that will roll for a skill check or a saving throw for the DnD character. 