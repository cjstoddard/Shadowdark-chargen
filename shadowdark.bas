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

DIM DICE(4)

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

Print "Choose your Class:"
Print " 1 Fighter"
Print " 2 Priest"
Print " 3 Rogue
Print " 4 Wizrd"
Input CHOICEC
If CHOICEC = 1 Then Gosub fighter
If CHOICEC = 2 Then Gosub priest
If CHOICEC = 3 Then Gosub rogue
If CHOICEC = 4 Then GoSub wizard

' Randomly assigns the characters background
Background:
  DICE(1) = Int(Rnd * 20) + 1 
    If DICE(1) = 1 Then Back$ = "Bounty Hunter"
    If DICE(1) = 2 Then Back$ = "Courtesan"
    If DICE(1) = 3 Then Back$ = "Duelist"
    If DICE(1) = 4 Then Back$ = "Executioner"
    If DICE(1) = 5 Then Back$ = "Farmer"
    If DICE(1) = 6 Then Back$ = "Grave Robber"
    If DICE(1) = 7 Then Back$ = "Leech Collector"
    If DICE(1) = 8 Then Back$ = "Mercenary"
    If DICE(1) = 9 Then Back$ = "Minor Noble"
    If DICE(1) = 10 Then Back$ = "Outlaw"
    If DICE(1) = 11 Then Back$ = "Performer"
    If DICE(1) = 12 Then Back$ = "Pit Fighter"
    If DICE(1) = 13 Then Back$ = "Pirate/Sailor"
    If DICE(1) = 14 Then Back$ = "Priest/nun/monk"
    If DICE(1) = 15 Then Back$ = "Rat Catcher"
    If DICE(1) = 16 Then Back$ = "Servant"
    If DICE(1) = 17 Then Back$ = "Student/Scholar"
    If DICE(1) = 18 Then Back$ = "Swineherd"
    If DICE(1) = 19 Then Back$ = "Soldier"
    If DICE(1) = 20 Then Back$ = "Urchin"

' Assigns a random misery to the character
RandomMisery:
  DICE(1) = Int(Rnd * 20) + 1 
    If DICE(1) = 1 Then Misery$ = "Abandoned at birth"
    If DICE(1) = 2  Then Misery$ = "Banished from home"
    If DICE(1) = 3  Then Misery$ = "Betrayed by a loved one"
    If DICE(1) = 4  Then Misery$ = "Cursed by vengeful witch"
    If DICE(1) = 5  Then Misery$ = "Disinherited or disowned"
    If DICE(1) = 6  Then Misery$ = "Escaped bondage or prison"
    If DICE(1) = 7  Then Misery$ = "Fled a scandal"
    If DICE(1) = 8  Then Misery$ = "Framed for a crime"
    If DICE(1) = 9  Then Misery$ = "Killed someone important"
    If DICE(1) = 10  Then Misery$ = "Left for dead"
    If DICE(1) = 11  Then Misery$ = "Locusts ate your crops"
    If DICE(1) = 12  Then Misery$ = "Owe someone money"
    If DICE(1) = 13  Then Misery$ = "Pursued by the law"
    If DICE(1) = 14  Then Misery$ = "Raised in the streets"
    If DICE(1) = 15  Then Misery$ = "Reduced to poverty"
    If DICE(1) = 16  Then Misery$ = "Rejected by society"
    If DICE(1) = 17  Then Misery$ = "Ruined by vice"
    If DICE(1) = 18  Then Misery$ = "Suffering from amnesia"
    If DICE(1) = 19  Then Misery$ = "Survived a massacre"
    If DICE(1) = 20  Then Misery$ = "Town ravaged by plague"

' Randomly rolls gold and rations
StartGear:
  GOLD$ = Str$ (Int(Rnd * 6) + 1)
  RATION$ = Str$ (Int(Rnd * 4) + 1)
  Gear$ = GOLD$ + " GP, " + RATION$ + " days of Rations, 1 Waterskin."

' Prints out the finished character to the screen
Print: Print "What is your Name"
  Input NAME$
  Print
  Print "Deathbringer Character Sheet 1.0"
  Print "------------------------------"
  Print "Character Name: "; NAME$
  Print "Character Class: "; CLASS$
  Print "Background: "; Back$
  Print "Random Misery: "; Misery$
  Print "------------------------------"
  Print
  Print "STR: "; STRENGTH$
  Print "DEX: "; DEXTERITY$
  Print "CON: "; CONSTITUTION$
  Print "INT: "; INTELLIGENCE$
  Print "WIS: "; WISDOM$
  Print "CHR: "; CHARISMA$
  Print
  Print "Hit Points: "; HITPOINTS
  Print
  Print "------------------------------"
  Print Feature1$
  Print Feature2$
  Print Feature3$
  Print Feature4$
  Print Feature5$
  Print "------------------------------"
  Print "EQUIPMENT:"
  Print Gear$
  Print Starting$

  Print: Print "Save Character?"
  GoSub YesNo
  If YN = 2 GoTo FinishUp

 ' Outputs the finished character to a text file
  Open NAME$ + ".txt" For OUTPUT As #1
  Print #1,
  Print #1, "Deathbringer Character Sheet 1.0"
  Print #1, "------------------------------"
  Print #1, "Character Name: "; NAME$
  Print #1, "Character Class: "; CLASS$
  Print #1, "Background: "; Back$
  Print #1, "Random Misery: "; Misery$
  Print #1, "------------------------------"
  Print #1,
  Print #1, "STR: "; STRENGTH$
  Print #1, "DEX: "; DEXTERITY$
  Print #1, "CON: "; CONSTITUTION$
  Print #1, "INT: "; INTELLIGENCE$
  Print #1, "WIS: "; WISDOM$
  Print #1, "CHR: "; CHARISMA$
  Print #1,
  Print #1, "Hit Points: "; HITPOINTS
  Print #1,
  Print #1, "------------------------------"
  Print #1, Feature1$
  Print #1, Feature2$
  Print #1, Feature3$
  Print #1, Feature4$
  Print #1, Feature5$
  Print #1, "------------------------------"
  Print #1, "EQUIPMENT:"
  Print #1,  Gear$
  Print #1,  Starting$
  
  Close #1
  GoTo FinishUp

' Rolls 3d6 and puts them in an array
Roll3d6:
  DICE(1) = Int(Rnd * 6) + 1
  DICE(2) = Int(Rnd * 6) + 1
  DICE(3) = Int(Rnd * 6) + 1
  TOTAL = DICE(1) + DICE(2) + DICE(3)

' Assigns a die roll modifier based on the 4d6 rolls, based on the standard D&D Modifier table.
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

' Assigns class features
DEATHBRINGER:
  CLASS$ = "Deathbringer"
  HITPOINTS = 10
  Feature1$ = "Hit Dice: d10. Use any armor or weapons."
  Feature2$ = "Spend a Deathbringer Die to make one extra attack."
  Feature3$ = "Second attack at 5th level."
  Feature4$ = ""
  Feature5$ = ""
  Starting$ = " doublet, shield, 2 weapons"
Return

GRIMSCRIBE:
  CLASS$ = "Grimscribe"
  HITPOINTS = 6
  Feature1$ = "Hit Dice: d6. Cannot wear armor, simple weapons."
  Feature2$ = "No spell slots. Roll to cast, DC 10."
  Feature3$ = "On a roll of Natural 1 gain 1 Corruption and roll on the Miscast Table."
  Feature4$ = "Gains spells by finding scrolls, spell books, or by having a friendly higher-level magic user teach them to you."
  Feature5$ = "You are a living grimoire, must tattoo all spells on your skin."
  Starting$ = " four cantrips, two first-level spells, dagger"
Return

SCOUNDREL:
  CLASS$ = "Scoundrel"
  HITPOINTS = 8
  Feature1$ = "Hit Dice: d8. Light armor only, simple weapons."
  Feature2$ = "Advantage when attempting stealth, climbing, listening, lockpicking, searching, etc."
  Feature3$ = "+4 to hit and double damage from behind."
  Feature4$ = ""
  Feature5$ = ""
  Starting$ = " leather jacket, club or dagger, thieves' tools, rope, grappling hook, lucky charm."
Return

WITCH_HUNTER:
  CLASS$ = "Witch Hunter"
  HITPOINTS = 8
  Feature1$ = "Hit Dice: d8. Light armor, martial and simple weapons."
  Feature2$ = "Cast Detect Evil and Protection from Evil 1x per day"
  Feature3$ = "Turn Undead at will."
  Feature4$ = ""
  Feature5$ = ""
  Starting$ = " leather coat, club, crossbow, holy symbol, 6 torches."
Return

PLAGUE_DOCTOR:
  CLASS$ = "Plague Doctor"
  HITPOINTS = 6
  Feature1$ = "Hit Dice: d6. Leather armor only, simple weapons."
  Feature2$ = "Cure Wounds once per patient per day, Cure Disease & Cure Poison 1x per day."
  Feature3$ = "Create 1d4 potions a day (1) acid splash (2) sleep (3) poison spray (4) bomb [d10] (5) healing [d6] (6) hallucinations"
  Feature4$ = ""
  Feature5$ = ""
  Starting$ = "Leather beak mask and coat, meat cleaver, medical kit, very suspicious diploma"
Return

' Ends the program
FinishUp:
End
