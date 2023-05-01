' ************************************
' ** Shadowsdark.bas 1.0            **
' ** By Chris Stoddard, May 2023    **
' ** Based on the Shadowdark RPG    **
' ** by Kelsey Dionne               **
' ************************************

' Use this if compiling with FreeBasic
Randomize (Timer, 3)
' Use this if compiling with qb64 or using QBasic
'Randomize Timer

DIM DICE(3)

' Main routine for generating the character
Main:
  Cls
  GoSub Roll3d6
  STRENGTH = TOTAL
  STRENGTH$ = TOTAL$
  GoSub Roll3d6
  DEXTERITY = TOTAL
  DEXTERITY$ = TOTAL$
  GoSub Roll3d6
  CONSTITUTION = TOTAL
  CONSTITUTION$ = TOTAL$
  GoSub Roll3d6
  INTELLIGENCE = TOTAL
  INTELLIGENCE$ = TOTAL$
  GoSub Roll3d6
  WISDOM = TOTAL
  WISDOM$ = TOTAL$
  GoSub Roll3d6
  CHARISMA = TOTAL
  CHARISMA$ = TOTAL$

  GoSub ShowStat
  Print "Do you wish to keep these stats?"
  GoSub YesNo
  If YN = 2 Then GoTo FinishUp

Ancestry:
  Print "Choose your Ancestry:"
  Print " 1 Dwarf"
  Print " 2 Elf"
  Print " 3 Goblin"
  Print " 4 Half-Orc"
  Print " 5 Halfling"
  Print " 6 Human"
  Input CHOICER
    If CHOICER < 1 Then Goto Ancestry
    If CHOICER = 1 Then Gosub Dwarf
    If CHOICER = 2 Then Gosub Elf
    If CHOICER = 3 Then Gosub Goblin
    If CHOICER = 4 Then GoSub Half-Orc
    If CHOICER = 5 Then Gosub Halfling
    If CHOICER = 6 Then GoSub Human
    If CHOICER > 6 Then Goto Ancestry

ClassChoice:
  Print "Choose your Class:"
  Print " 1 Fighter"
  Print " 2 Priest"
  Print " 3 Thief"
  Print " 4 Wizard"
  Print " 5 Zero Level"
  Input CHOICEC
    If CHOICEC < 1 Then Goto ClassChoice
    If CHOICEC = 1 Then Gosub Fighter
    If CHOICEC = 2 Then Gosub Priest
    If CHOICEC = 3 Then Gosub Thief
    If CHOICEC = 4 Then GoSub Wizard
    If CHOICEC = 5 Then GoSub Zero-Level
    If CHOICEC > 5 Then Goto ClassChoice

' Randomly assigns the characters background
Background:
  DICE(1) = Int(Rnd * 20) + 1 
    If DICE(1) = 1 Then Back$ = "Urchin"
    If DICE(1) = 2 Then Back$ = "Wanted"
    If DICE(1) = 3 Then Back$ = "Cult Initiate"
    If DICE(1) = 4 Then Back$ = "Thieves' Guild"
    If DICE(1) = 5 Then Back$ = "Banished"
    If DICE(1) = 6 Then Back$ = "Orphaned"
    If DICE(1) = 7 Then Back$ = "Wizard's Apprentice"
    If DICE(1) = 8 Then Back$ = "Jeweler"
    If DICE(1) = 9 Then Back$ = "Herbalist"
    If DICE(1) = 10 Then Back$ = "Barbarian"
    If DICE(1) = 11 Then Back$ = "Mercenary"
    If DICE(1) = 12 Then Back$ = "Sailor"
    If DICE(1) = 13 Then Back$ = "Acolyte"
    If DICE(1) = 14 Then Back$ = "Soldier"
    If DICE(1) = 15 Then Back$ = "Ranger"
    If DICE(1) = 16 Then Back$ = "Scout"
    If DICE(1) = 17 Then Back$ = "Minstrel"
    If DICE(1) = 18 Then Back$ = "Scholar"
    If DICE(1) = 19 Then Back$ = "Noble"
    If DICE(1) = 20 Then Back$ = "Chirurgeon"

' Randomly rolls gold and rations
StartGear:
  GOLD$ = Str$ (Int(Rnd * 6) + 1)
  RATION$ = Str$ (Int(Rnd * 4) + 1)
  Gear$ = GOLD$ + " GP, " + RATION$ + " days of Rations, 1 Waterskin."

' Prints out the finished character to the screen
Print: Print "What is your Name"
  Input NAME$
  Print
  Print "Shadowdark Character Sheet 1.0"
  Print "------------------------------"
  Print "Character Name: "; NAME$
  Print "Ancestry" ; Ancestry$
  Print "Background: "; Back$
  Print "Character Class: "; CLASS$
  Print "------------------------------"
  Print
  Print "STR: "; STRENGTH ; "/" ; STRENGTH$
  Print "DEX: "; DEXTERITY ; "/" ; DEXTERITY$
  Print "CON: "; CONSTITUTION ; "/" ; CONSTITUTION$
  Print "INT: "; INTELLIGENCE ; "/" ; INTELLIGENCE$
  Print "WIS: "; WISDOM ; "/" ; WISDOM$
  Print "CHR: "; CHARISMA ; "/" ; CHARISMA$
  Print
  Print "Hit Points: "; HITPOINTS
  Print
  Print "------------------------------"
  Print "Ancestry Feature:" ; AncestryFeature$
  Print "Languages:" ; Language$
  Print "Class Features:"
  Print Weapon$
  print Armor$
  Print ClassFeature1$
  Print ClassFeature2$
  Print ClassFeature3$
  Print "------------------------------"
  Print "EQUIPMENT:"

  Print: Print "Save Character?"
  GoSub YesNo
  If YN = 2 GoTo FinishUp

 ' Outputs the finished character to a text file
  Open NAME$ + ".txt" For OUTPUT As #1
  Print #1,
  Print #1, "Shadowdark Character Sheet 1.0"
  Print #1, "------------------------------"
  Print #1, "Character Name: "; NAME$
  Print #1, "Ancestry" ; Ancestry$
  Print #1, "Background: "; Back$
  Print #1, "Character Class: "; CLASS$
  Print #1, "------------------------------"
  Print #1,
  Print #1, "STR: "; STRENGTH ; "/" ; STRENGTH$
  Print #1, "DEX: "; DEXTERITY ; "/" ; DEXTERITY$
  Print #1, "CON: "; CONSTITUTION ; "/" ; CONSTITUTION$
  Print #1, "INT: "; INTELLIGENCE ; "/" ; INTELLIGENCE$
  Print #1, "WIS: "; WISDOM ; "/" ; WISDOM$
  Print #1, "CHR: "; CHARISMA ; "/" ; CHARISMA$
  Print #1, 
  Print #1, "Hit Points: "; HITPOINTS
  Print #1, 
  Print #1, "------------------------------"
  Print #1, "Ancestry Feature:" ; AncestryFeature$
  Print #1, "Languages:" ; Language$
  Print #1, "Class Features:"
  Print #1, Weapon$
  Print #1, Armor$
  Print #1, ClassFeature1$
  Print #1, ClassFeature2$
  Print #1, ClassFeature3$
  Print #1, "------------------------------"
  Print #1, "EQUIPMENT:"

  Close #1
  GoTo FinishUp

' Rolls 3d6 and puts them in an array
Roll3d6:
  DICE(1) = Int(Rnd * 6) + 1
  DICE(2) = Int(Rnd * 6) + 1
  DICE(3) = Int(Rnd * 6) + 1
  TOTAL = DICE(1) + DICE(2) + DICE(3)

' Assigns a die roll modifier based on the 3d6 rolls, based on the standard Modifier table.
  If TOTAL = 3 Then TOTAL$ = "-4"
  If TOTAL = 4 Then TOTAL$ = "-3"
  If TOTAL = 5 Then TOTAL$ = "-3"
  If TOTAL = 6 Then TOTAL$ = "-2"
  If TOTAL = 7 Then TOTAL$ = "-2"
  If TOTAL = 8 Then TOTAL$ = "-1"
  If TOTAL = 9 Then TOTAL$ = "-1"
  If TOTAL = 10 Then TOTAL$ = "+0"
  If TOTAL = 11 Then TOTAL$ = "+0"
  If TOTAL = 12 Then TOTAL$ = "+1"
  If TOTAL = 13 Then TOTAL$ = "+1"
  If TOTAL = 14 Then TOTAL$ = "+2"
  If TOTAL = 15 Then TOTAL$ = "+2"
  If TOTAL = 16 Then TOTAL$ = "+3"
  If TOTAL = 17 Then TOTAL$ = "+3"
  If TOTAL = 18 Then TOTAL$ = "+4"

Return

' Displays rolled attributes and die modifiers
ShowStat:
  Print "STR: "; STRENGTH ; "/" ; STRENGTH$
  Print "DEX: "; DEXTERITY ; "/" ; DEXTERITY$
  Print "CON: "; CONSTITUTION ; "/" ; CONSTITUTION$
  Print "INT: "; INTELLIGENCE ; "/" ; INTELLIGENCE$
  Print "WIS: "; WISDOM ; "/" ; WISDOM$
  Print "CHR: "; CHARISMA ; "/" ; CHARISMA$
  Print
  Return

YesNo:
  Print "1 Yes"
  Print "2 No"
  Input YN
  Return

' Assigns Ancestry features

Dwarf:
  Ancestry$ = "Dwarf"
  Lanuage$ = "Common and Dwarvish"
  AncestryFeature$ = "Stout. Start with +2 HP. Roll hit points per level with advantage."
Return

Elf:
  Ancestry$ = "Elf"
  Lanuage$ = "Common, Elvish, and Sylvan"
  AncestryFeature$ = "Farsight. You get a +1 bonus to attack rolls with ranged weapons or a +1 bonus to spellcasting checks."
Return

Goblin:
  Ancestry$ = "Goblin"
  Lanuage$ = "Common and Goblin"
  AncestryFeature$ = "Keen Senses. You can't be surprised."
Return

Half-Orc:
  Ancestry$ = "Half-Orc"
  Lanuage$ = "Common and Orcish"
  AncestryFeature$ = "Mighty. You have a +1 bonus to attack and damage rolls with melee weapons."
Return

Halfling:
  Ancestry$ = "Halfling"
  Lanuage$ = "Common" 
  AncestryFeature$ = "Stealthy. Once per day, you can become invisible for 3 rounds."
Return

Human:
  Ancestry$ = "Human"
  Lanuage$ = "Common and one additional common language."
  AncestryFeature$ = "Ambitious. You gain one additional talent roll at 1st level."
Return

' Assigns class features
Fighter:
  CLASS$ = "Fighter"
  HITPOINTS = Int(Rnd * 8) + 1
  Weapon$ = "Weapons: All weapons"
  Armor$ = "Armor: All armor and shields"
  ClassFeature1$ = "Hauler. Add your Constitution modifier, if positive, to your gear slots."
  ClassFeature2$ = "Weapon Mastery. Choose one type of weapon, such as longswords. You gain +1 to attack and damage with that weapon type. In addition, add half your level to these rolls (round down)."
  ClassFeature3$ = "Grit. Choose Strength or Dexterity. You have advantage on checks of that type to overcome an opposing force,such as kicking open a stuck door (Strength) or slipping free of rusty chains (Dexterity)."
Return

Priest:
  CLASS$ = "Priest"
  HITPOINTS = Int(Rnd * 6) + 1
  Weapon$ = "Weapons: Club, crossbow, dagger, mace, longsword, staff, warhammer"
  Armor$ = "Armor: All armor and shields"
  ClassFeature1$ = "You know either Celestial, Diabolic, or Primordial."
  ClassFeature2$ = "Turn Undead. You know the turn undead spell. It doesn’t count toward your number of known spells."
  ClassFeature3$ = "Deity. Choose a god to serve who matches your alignment. You have a holy symbol for your god (it takes up no gear slots)."
Return

Thief:
  CLASS$ = "Thief"
  HITPOINTS = Int(Rnd * 4) + 1
  Weapon$ = "Weapons: Club, crossbow, dagger, shortbow, shortsword"
  Armor$ = "Armor: Leather armor, mithral chainmail"
  ClassFeature1$ = "Backstab. If you hit a creature who is unaware of your attack, you deal an extra weapon die of damage. Add additional weapon dice of damage equal to half your level (round down)."
  ClassFeature2$ = "Thievery. You are adept at thieving skills and have the necessary tools of the trade secreted on your person (they take up no gear slots)."
  ClassFeature3$ = "You are trained in the thievery tasks and have advantage on any associated checks"
Return

Wizard:
  CLASS$ = "Wizard"
  HITPOINTS = Int(Rnd * 4) + 1
  Weapon$ = "Weapons: Dagger, staff"
  Armor$ = "Armor: None"
  ClassFeature1$ = "You know two additional common languages and two rare languages"
  ClassFeature2$ = "Learning Spells. You can permanently learn a wizard spell from a spell scroll by studying it for a day and succeeding on a DC 15 Intelligence check."
  ClassFeature3$ = "Spellcasting. You can cast wizard spells you know."
Return

Zero-Level:
  CLASS$ = "Zero Level"
  HITPOINTS = 1
  Weapon$ = "Weapons: All weapons until 1st level"
  Armor$ = "Armor: All armor and shields until 1st level"
  ClassFeature1$ = "Beginner's luck, you can wield all gear until 1st level."
  ClassFeature2$ = " "
  ClassFeature3$ = " "
Return

' Ends the program
FinishUp:
End
