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
    Print "-------------------------------------------------------"
    Print "Legal Statement:"
    Print "This Shadowdark Character Generator is an independent"
    Print "product published under the Shadowdark RPG Third-Party"
    Print "License and is not affiliated with The Arcane Library,"
    Print "LLC. Shadowdark RPG © 2023 The Arcane Library, LLC."
    Print "-------------------------------------------------------"
    Print
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
    Print "--Core--"
    Print " 1 Fighter"
    Print " 2 Priest"
    Print " 3 Thief"
    Print " 4 Wizard"
    Print " 5 Zero Level"
    Print "--Kickstarter--"
    Print " 6 Ranger"
    Print " 7 Bard"
    Input CHOICEC
        If CHOICEC < 1 Then GoTo ClassChoice
        If CHOICEC = 1 Then GoSub Fighter
        If CHOICEC = 2 Then GoSub Priest
        If CHOICEC = 3 Then GoSub Thief
        If CHOICEC = 4 Then GoSub Wizard
        If CHOICEC = 5 Then GoSub ZeroLevel
        If CHOICEC = 6 Then GoSub Ranger
        If CHOICEC = 7 Then GoSub Bard
        If CHOICEC > 7 Then GoTo ClassChoice

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
    Print "Character Class: "; CLASSTYPE$
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
    Print Tab(5); ClassFeature4$
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
    Print #1, "Character Class: "; CLASSTYPE$
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
    Print #1, Tab(5); ClassFeature4$
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

' Assigns Ancestry features
Dwarf:
    Ancestry$ = "Dwarf"
    Lanuage$ = "Common and Dwarvish"
    AncestryFeature$ = "Stout. +2 HP at 1st level, each level there after, roll hit points with advantage."
Return

Elf:
    Ancestry$ = "Elf"
    Lanuage$ = "Common, Elvish, and Sylvan"
    AncestryFeature$ = "Farsight. Choose; +1 bonus to ranged weapon attacks or +1 bonus to spellcasting checks."
Return

Goblin:
    Ancestry$ = "Goblin"
    Lanuage$ = "Common and Goblin"
    AncestryFeature$ = "Keen Senses. Character cannot be surprised."
Return

HalfOrc:
    Ancestry$ = "Half-Orc"
    Lanuage$ = "Common and Orcish"
    AncestryFeature$ = "Mighty. +1 bonus to hit and damage with melee weapons."
Return

Halfling:
    Ancestry$ = "Halfling"
    Lanuage$ = "Common"
    AncestryFeature$ = "Stealthy. You become invisible for 3 rounds, use this ability once per day"
Return

Human:
    Ancestry$ = "Human"
    Lanuage$ = "Common and one additional common language."
    AncestryFeature$ = "Ambitious. Roll one additional on the talent table at 1st level."
Return

' Assigns class features
Fighter:
    CLASSTYPE$ = "Fighter"
    HITPOINTS = Int(Rnd * 8) + 1
    GoSub FixHP
    Weapon$ = "Weapons: All weapons"
    Armor$ = "Armor: All armor and shields"
    ClassFeature1$ = "Hauler. You gain additional gear slots equal to you Constitution modifier, if positive."
    ClassFeature2$ = "Weapon Mastery. With one type of weapon, you gain +1 to attack and damage with that weapon type. Also, add half your level to attack and damage rolls (round down)."
    ClassFeature3$ = "Grit. Choose Strength or Dexterity. You have advantage on checks based on that attribute."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Gain Weapon Mastery with another weapon type"
        If Talent$ = "3-6" Then ClassTalent$ = "+1 bonus to melee and ranged attacks"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 bonus to Strength, Dexterity, or Constitution attribute"
        If Talent$ = "10-11" Then ClassTalent$ = "Choose one type of armor. You get +1 your AC when wearing that armor"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to attributes"
Return

Priest:
    CLASSTYPE$ = "Priest"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Club, crossbow, dagger, mace, longsword, staff, warhammer"
    Armor$ = "Armor: All armor and shields"
    Language$ = Language$ +  " and you know either Celestial, Diabolic, or Primordial."
    ClassFeature1$ = "Turn Undead. You know the turn undead spell, this does not count toward your number of known spells."
    ClassFeature2$ = "Spellcasting. You can cast priest spells you have prepared."
    ClassFeature3$ = " "
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Gain advantage with one spell you know, when roll to cast."
        If Talent$ = "3-6" Then ClassTalent$ = "+1 bonus to melee or ranged attacks"
        If Talent$ = "7-9" Then ClassTalent$ = "+1 bonus to priest spellcasting checks"
        If Talent$ = "10-11" Then ClassTalent$ = "+2 to Strength or Wisdom attribute"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to attributes"
Return

Thief:
    CLASSTYPE$ = "Thief"
    HITPOINTS = Int(Rnd * 4) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Club, crossbow, dagger, shortbow, shortsword"
    Armor$ = "Armor: Leather armor, mithral chainmail"
    ClassFeature1$ = "Backstab. On successful attack roll, If the target is unaware of your attack, you deal an extra die of damage and an additional die of damage equal to half your level (round down)."
    ClassFeature2$ = "Thievery. You are trained thieving skills and have can carry the necessary tools at no equipment slot cost."
    ClassFeature3$ = "You are adept in the skills associated with thievery, you have advantage on any associated checks"
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "You have advantage on initiative rolls (reroll if duplicate)"
        If Talent$ = "3-6" Then ClassTalent$ = "Your Backstab deals +1 die of damage"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 bonus to Strength, Dexterity, or Charisma attribute"
        If Talent$ = "10-11" Then ClassTalent$ = "+1 bonus to melee and ranged attacks"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to atributes"
Return

Wizard:
    CLASSTYPE$ = "Wizard"
    HITPOINTS = Int(Rnd * 4) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Dagger, staff"
    Armor$ = "Armor: None"
    Language$ = Language$ + " and you know two additional common languages and two rare languages"
    ClassFeature1$ = "Learning Spells. You can learn new wizard spells from a scroll by studying it for a day and succeeding on a DC 15 INT check."
    ClassFeature2$ = "Spellcasting. You can cast wizard spells you have prepared."
    ClassFeature3$ = " "
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Make a single random magic item of a type you choose"
        If Talent$ = "3-6" Then ClassTalent$ = "+2 to Intelligence attribute or +1 bonus to wizard spellcasting checks"
        If Talent$ = "7-9" Then ClassTalent$ = "Gain advantage on casting a single spell you know"
        If Talent$ = "10-11" Then ClassTalent$ = "Learn one additional wizard spell of any tier you know"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to attribute"
Return

ZeroLevel:
    CLASSTYPE$ = "Zero Level"
    HITPOINTS = 0
    GoSub FixHP
    Weapon$ = "Weapons: All weapons until 1st level"
    Armor$ = "Armor: All armor and shields until 1st level"
    ClassFeature1$ = "Beginner's luck, you can wield any and all equipment until 1st level."
    ClassFeature2$ = " "
    ClassFeature3$ = " "
    ClassFeature4$ = " "
    ClassTalent$ = " "
Return

Ranger:
    CLASSTYPE$ = "Ranger"
    HITPOINTS = Int(Rnd * 8) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Dagger, longbow, longsword, shortbow, shortsword, spear, staff"
    Armor$ = "Armor: Leather armor, chainmail"
    ClassFeature1$ = "Wayfinder. You are adept in the skills associated with Rangers, you have advantage on any associated checks"
    ClassFeature2$ = "Herbalism. Make an INT check to find an herb you choose. If you fail the check, you cannot try to find that herb again until you have completed a rest. Herbs not used loose thier effect after 3 rounds."
    ClassFeature3$ = " "
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "You deal d12 damage with one weapon type of your choice."
        If Talent$ = "3-6" Then ClassTalent$ = "+1 bonus to melee or ranged attacks and damage"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 Strength, Dexterity, or Intellegence attribute"
        If Talent$ = "10-11" Then ClassTalent$ = "You have advantage on Herbalism checks for the herb of your choice."
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to attributes"
Return

Bard:
    CLASSTYPE$ = "Bard"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Crossbow, dagger, mace, shortbow, shortsword, spear, staff"
    Armor$ = "Armor: Leather armor, chainmail, shields"
    Lanuage$ =  Lanuage$ + " and You know four additional common languages and one rare language."
    ClassFeature1$ = "Bardic Arts. You are adept in the skills associated with Bards, you have advantage on any associated checks"
    ClassFeature2$ = "Magical Dabbler. You can use any spell scroll or wand using Charisma as your spellcasting attribute."
    ClassFeature3$ = "Perform. Make a Charisma roll use either Inspire (DC 12) or Fascinate (DC 15) abilities"
    ClassFeature4$ = "Prolific. Add 1d6 to your learning and group carousing rolls."
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "You recieve a random priest or wizard wand, you choose which."
        If Talent$ = "3-6" Then ClassTalent$ = "+1 bonus to melee and ranged attacks or +1 to Magic Dabbler rolls."
        If Talent$ = "7-9" Then ClassTalent$ = "+2 points to distribute to any attribute"
        If Talent$ = "10-11" Then ClassTalent$ = "Perfom DC is lowered by 3 for Inspire (DC 9) and Fascinate (DC 12), reroll if rolled a 2nd time."
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent"
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
' This add 2 Hit Points if character is a Dwarf
    If Ancestry$ = "Dwarf" Then HITPOINTS = HITPOINTS + 2
    If Ancestry$ = "Dwarf" Then Print "+2 HP have been added for being a Dwarf"
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

'Asks a yes or no question
YesNo:
    Print "1 Yes"
    Print "2 No"
    Input YN
        If YN < 1 Then GoTo YesNo
        If YN > 2 Then GoTo YesNo
Return

' Ends the program
FinishUp:
    End
