' ************************************
' ** Shadowsdark.bas 1.0            **
' ** By Chris Stoddard, May 2023    **
' ** Based on the Shadowdark RPG    **
' ** by Kelsey Dionne and           **
' ** Arcane Library                 **
' ************************************

' Use this if compiling with FreeBasic
Randomize (Timer, 3)
' Use this if compiling with qb64 or using QBasic
' Randomize Timer

Dim DICE(3)

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

' Choose the ancestry of the character
Ancestry:
Print "Choose your Ancestry:"
Print " 1 Dwarf"
Print " 2 Elf"
Print " 3 Goblin"
Print " 4 Half-Orc"
Print " 5 Halfling"
Print " 6 Human"
Input CHOICER
If CHOICER < 1 Then GoTo Ancestry
If CHOICER = 1 Then GoSub Dwarf
If CHOICER = 2 Then GoSub Elf
If CHOICER = 3 Then GoSub Goblin
If CHOICER = 4 Then GoSub HalfOrc
If CHOICER = 5 Then GoSub Halfling
If CHOICER = 6 Then GoSub Human
If CHOICER > 6 Then GoTo Ancestry

'Choose the class of the character
ClassChoice:
Print "Choose your Class:"
Print " 1 Fighter"
Print " 2 Priest"
Print " 3 Thief"
Print " 4 Wizard"
Print " 5 Zero Level"
Input CHOICEC
If CHOICEC < 1 Then GoTo ClassChoice
If CHOICEC = 1 Then GoSub Fighter
If CHOICEC = 2 Then GoSub Priest
If CHOICEC = 3 Then GoSub Thief
If CHOICEC = 4 Then GoSub Wizard
If CHOICEC = 5 Then GoSub ZeroLevel
If CHOICEC > 5 Then GoTo ClassChoice

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

' Prints out the finished character to the screen
Print: Print "What is your Name"
Input NAME$
Print
Print "Shadowdark Character Sheet 1.0"
Print "------------------------------"
Print "Character Name: "; NAME$
Print "Ancestry "; Ancestry$
Print "Background: "; Back$
Print "Character Class: "; CLASS$
Print "XP:    _____"
Print "Level: _____"
Print "------------------------------"
Print
Print "STR: "; STRENGTH; "/"; STRENGTH$
Print "DEX: "; DEXTERITY; "/"; DEXTERITY$
Print "CON: "; CONSTITUTION; "/"; CONSTITUTION$
Print "INT: "; INTELLIGENCE; "/"; INTELLIGENCE$
Print "WIS: "; WISDOM; "/"; WISDOM$
Print "CHR: "; CHARISMA; "/"; CHARISMA$
Print
Print "Hit Points: "; HITPOINTS
Print
Print "------------------------------"
Print "Ancestry Feature: "; AncestryFeature$
Print "Languages: "; Lanuage$
Print "Class Features:"
Print Tab(5); Weapon$
Print Tab(5); Armor$
Print Tab(5); ClassFeature1$
Print Tab(5); ClassFeature2$
Print Tab(5); ClassFeature3$
Print "Class Talent: "; ClassTalent$
Print "------------------------------"
Print "EQUIPMENT:"

Print: Print "Save Character?"
GoSub YesNo
If YN = 2 GoTo FinishUp

' Outputs the finished character to a text file
Open NAME$ + ".txt" For Output As #1
Print #1,
Print #1, "Shadowdark Character Sheet 1.0"
Print #1, "------------------------------"
Print #1, "Character Name: "; NAME$
Print #1, "Ancestry "; Ancestry$
Print #1, "Background: "; Back$
Print #1, "Character Class: "; CLASS$
Print #1, "XP:    _____"
Print #1, "Level: _____"
Print #1, "------------------------------"
Print #1,
Print #1, "STR: "; STRENGTH; "/"; STRENGTH$
Print #1, "DEX: "; DEXTERITY; "/"; DEXTERITY$
Print #1, "CON: "; CONSTITUTION; "/"; CONSTITUTION$
Print #1, "INT: "; INTELLIGENCE; "/"; INTELLIGENCE$
Print #1, "WIS: "; WISDOM; "/"; WISDOM$
Print #1, "CHR: "; CHARISMA; "/"; CHARISMA$
Print #1,
Print #1, "Hit Points: "; HITPOINTS
Print #1,
Print #1, "------------------------------"
Print #1, "Ancestry Feature:"; AncestryFeature$
Print #1, "Languages:"; Lanuage$
Print #1, "Class Features:"
Print #1, Tab(5); Weapon$
Print #1, Tab(5); Armor$
Print #1, Tab(5); ClassFeature1$
Print #1, Tab(5); ClassFeature2$
Print #1, Tab(5); ClassFeature3$
Print #1, "Class Talent: "; ClassTalent$
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
Print "STR: "; STRENGTH; "/"; STRENGTH$
Print "DEX: "; DEXTERITY; "/"; DEXTERITY$
Print "CON: "; CONSTITUTION; "/"; CONSTITUTION$
Print "INT: "; INTELLIGENCE; "/"; INTELLIGENCE$
Print "WIS: "; WISDOM; "/"; WISDOM$
Print "CHR: "; CHARISMA; "/"; CHARISMA$
Print
Return

'Asks a yes or no question
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

HalfOrc:
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
GoSub FixHP
Weapon$ = "Weapons: All weapons"
Armor$ = "Armor: All armor and shields"
ClassFeature1$ = "Hauler. Add your Constitution modifier, if positive, to your gear slots."
ClassFeature2$ = "Weapon Mastery. Choose one type of weapon, such as longswords. You gain +1 to attack and damage with that weapon type. In addition, add half your level to these rolls (round down)."
ClassFeature3$ = "Grit. Choose Strength or Dexterity. You have advantage on checks of that type to overcome an opposing force,such as kicking open a stuck door (Strength) or slipping free of rusty chains (Dexterity)."
GoSub GetTalent
If Talent$ = "2" Then ClassTalent$ = "Gain Weapon Mastery with one additional weapon"
If Talent$ = "3-6" Then ClassTalent$ = "+1 to melee and ranged attacks"
If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength, Dexterity, or Constitution stat"
If Talent$ = "10-11" Then ClassTalent$ = "Choose one kind of armor. You get +1 AC from that armor"
If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

Priest:
  CLASS$ = "Priest"
  HITPOINTS = Int(Rnd * 6) + 1
  GoSub FixHP
  Weapon$ = "Weapons: Club, crossbow, dagger, mace, longsword, staff, warhammer"
  Armor$ = "Armor: All armor and shields"
  ClassFeature1$ = "You know either Celestial, Diabolic, or Primordial."
  ClassFeature2$ = "Turn Undead. You know the turn undead spell. It doesn’t count toward your number of known spells."
  ClassFeature3$ = "Spellcasting. You can cast priest spells you know."
  Gosub GetTalent
  If Talent$ = "2" Then ClassTalent$ = "Gain advantage on casting one spell you know"
  If Talent$ = "3-6" Then ClassTalent$ = "+1 to melee or ranged attacks"
  If Talent$ = "7-9" Then ClassTalent$ = "+1 to priest spellcasting checks"
  If Talent$ = "10-11" Then ClassTalent$ = "+2 to Strength or Wisdom stat"
  If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

Thief:
CLASS$ = "Thief"
HITPOINTS = Int(Rnd * 4) + 1
GoSub FixHP
Weapon$ = "Weapons: Club, crossbow, dagger, shortbow, shortsword"
Armor$ = "Armor: Leather armor, mithral chainmail"
ClassFeature1$ = "Backstab. If you hit a creature who is unaware of your attack, you deal an extra weapon die of damage. Add additional weapon dice of damage equal to half your level (round down)."
ClassFeature2$ = "Thievery. You are adept at thieving skills and have the necessary tools of the trade secreted on your person (they take up no gear slots)."
ClassFeature3$ = "You are trained in the thievery tasks and have advantage on any associated checks"
GoSub GetTalent
If Talent$ = "2" Then ClassTalent$ = "Gain advantage on initiative rolls (reroll if duplicate)"
If Talent$ = "3-6" Then ClassTalent$ = "Your Backstab deals +1 dice of damage"
If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength, Dexterity, or Charisma stat"
If Talent$ = "10-11" Then ClassTalent$ = "+1 to melee and ranged attacks"
If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

Wizard:
CLASS$ = "Wizard"
HITPOINTS = Int(Rnd * 4) + 1
GoSub FixHP
Weapon$ = "Weapons: Dagger, staff"
Armor$ = "Armor: None"
ClassFeature1$ = "You know two additional common languages and two rare languages"
ClassFeature2$ = "Learning Spells. You can permanently learn a wizard spell from a spell scroll by studying it for a day and succeeding on a DC 15 Intelligence check."
ClassFeature3$ = "Spellcasting. You can cast wizard spells you know."
GoSub GetTalent
If Talent$ = "2" Then ClassTalent$ = "Make 1 random magic item of a type you choose"
If Talent$ = "3-6" Then ClassTalent$ = "+2 to Intelligence stat or +1 to wizard spellcasting checks"
If Talent$ = "7-9" Then ClassTalent$ = "Gain advantage on casting one spell you know"
If Talent$ = "10-11" Then ClassTalent$ = "Learn one additional wizard spell of any tier you know"
If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

ZeroLevel:
CLASS$ = "Zero Level"
HITPOINTS = 0
GoSub FixHP
Weapon$ = "Weapons: All weapons until 1st level"
Armor$ = "Armor: All armor and shields until 1st level"
ClassFeature1$ = "Beginner's luck, you can wield all gear until 1st level."
ClassFeature2$ = " "
ClassFeature3$ = " "
ClassTalent$ = " "
Return

'Adds Con bonus to Hit Points
FixHP:
If CONSTITUTION$ = "-1" Then HITPOINTS = HITPOINTS - 1
If CONSTITUTION$ = "-2" Then HITPOINTS = HITPOINTS - 2
If CONSTITUTION$ = "-3" Then HITPOINTS = HITPOINTS - 3
If CONSTITUTION$ = "-4" Then HITPOINTS = HITPOINTS - 4
If CONSTITUTION$ = "+1" Then HITPOINTS = HITPOINTS + 1
If CONSTITUTION$ = "+2" Then HITPOINTS = HITPOINTS + 2
If CONSTITUTION$ = "+3" Then HITPOINTS = HITPOINTS + 3
If CONSTITUTION$ = "+4" Then HITPOINTS = HITPOINTS + 4
If HITPOINTS < 1 Then HITPOINTS = 1
Return

'Rolls a random number to get the class talent
GetTalent:
DICE(1) = Int(Rnd * 6) + 1
DICE(2) = Int(Rnd * 6) + 1
DICE(3) = DICE(1) + DICE(2)
If DICE(3) = 2 Then Talent$ = "2"
If DICE(3) = 3 Or DICE(3) = 4 Or DICE(3) = 4 Or DICE(3) = 5 Or DICE(3) = 6 Then Talent$ = "3-6"
If DICE(3) = 7 Or DICE(3) = 7 Or DICE(3) = 8 Or DICE(3) = 9 Then Talent$ = "7-9"
If DICE(3) = 10 Or DICE(3) = 11 Then Talent$ = "10-11"
If DICE(3) = 12 Then Talent$ = "12"
Return

' Ends the program
FinishUp:
End
