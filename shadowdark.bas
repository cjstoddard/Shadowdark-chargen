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
    Print "--Core--"
    Print " 1 Fighter"
    Print " 2 Priest"
    Print " 3 Thief"
    Print " 4 Wizard"
    Print " 5 Zero Level"
    Print "--Kickstarter--"
    Print " 6 Ranger"
    Print " 7 Bard"
    Print "--Cursed Scroll--"
    Print " 8 Knight of St. Ydris"
    Print " 9 Warlock"
    Print " 10 Witch"
    Print " 11 Desert Raider"
    Print " 12 Pit Fighter"
    Print " 13 Ras-Godai"
    Print " 14 Sea Wolf"
    Print " 15 Seer"
    Input CHOICEC
        If CHOICEC < 1 Then GoTo ClassChoice
        If CHOICEC = 1 Then GoSub Fighter
        If CHOICEC = 2 Then GoSub Priest
        If CHOICEC = 3 Then GoSub Thief
        If CHOICEC = 4 Then GoSub Wizard
        If CHOICEC = 5 Then GoSub ZeroLevel
        If CHOICEC = 6 Then GoSub Ranger
        If CHOICEC = 7 Then GoSub Bard
        If CHOICEC = 8 Then GoSub Knight
        If CHOICEC = 9 Then GoSub Warlock
        If CHOICEC = 10 Then GoSub Witch
        If CHOICEC = 11 Then GoSub DesertRaider
        If CHOICEC = 12 Then GoSub PitFighter
        If CHOICEC = 13 Then GoSub RasGodai
        If CHOICEC = 14 Then GoSub SeaWolf
        If CHOICEC = 15 Then GoSub Seer
        If CHOICEC > 15 Then GoTo ClassChoice

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
    CLASSTYPE$ = "Fighter"
    HITPOINTS = Int(Rnd * 8) + 1
    GoSub FixHP
    Weapon$ = "Weapons: All weapons"
    Armor$ = "Armor: All armor and shields"
    ClassFeature1$ = "Hauler. Add your Constitution modifier, if positive, to your gear slots."
    ClassFeature2$ = "Weapon Mastery. Choose one type of weapon, such as longswords. You gain +1 to attack and damage with that weapon type. In addition, add half your level to these rolls (round down)."
    ClassFeature3$ = "Grit. Choose Strength or Dexterity. You have advantage on checks of that type to overcome an opposing force,such as kicking open a stuck door (Strength) or slipping free of rusty chains (Dexterity)."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Gain Weapon Mastery with one additional weapon"
        If Talent$ = "3-6" Then ClassTalent$ = "+1 to melee and ranged attacks"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength, Dexterity, or Constitution stat"
        If Talent$ = "10-11" Then ClassTalent$ = "Choose one kind of armor. You get +1 AC from that armor"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

Priest:
    CLASSTYPE$ = "Priest"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Club, crossbow, dagger, mace, longsword, staff, warhammer"
    Armor$ = "Armor: All armor and shields"
    ClassFeature1$ = "You know either Celestial, Diabolic, or Primordial."
    ClassFeature2$ = "Turn Undead. You know the turn undead spell. It doesn’t count toward your number of known spells."
    ClassFeature3$ = "Spellcasting. You can cast priest spells you know."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Gain advantage on casting one spell you know"
        If Talent$ = "3-6" Then ClassTalent$ = "+1 to melee or ranged attacks"
        If Talent$ = "7-9" Then ClassTalent$ = "+1 to priest spellcasting checks"
        If Talent$ = "10-11" Then ClassTalent$ = "+2 to Strength or Wisdom stat"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

Thief:
    CLASSTYPE$ = "Thief"
    HITPOINTS = Int(Rnd * 4) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Club, crossbow, dagger, shortbow, shortsword"
    Armor$ = "Armor: Leather armor, mithral chainmail"
    ClassFeature1$ = "Backstab. If you hit a creature who is unaware of your attack, you deal an extra weapon die of damage. Add additional weapon dice of damage equal to half your level (round down)."
    ClassFeature2$ = "Thievery. You are adept at thieving skills and have the necessary tools of the trade secreted on your person (they take up no gear slots)."
    ClassFeature3$ = "You are trained in the thievery tasks and have advantage on any associated checks"
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Gain advantage on initiative rolls (reroll if duplicate)"
        If Talent$ = "3-6" Then ClassTalent$ = "Your Backstab deals +1 dice of damage"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength, Dexterity, or Charisma stat"
        If Talent$ = "10-11" Then ClassTalent$ = "+1 to melee and ranged attacks"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

Wizard:
    CLASSTYPE$ = "Wizard"
    HITPOINTS = Int(Rnd * 4) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Dagger, staff"
    Armor$ = "Armor: None"
    ClassFeature1$ = "You know two additional common languages and two rare languages"
    ClassFeature2$ = "Learning Spells. You can permanently learn a wizard spell from a spell scroll by studying it for a day and succeeding on a DC 15 Intelligence check."
    ClassFeature3$ = "Spellcasting. You can cast wizard spells you know."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Make 1 random magic item of a type you choose"
        If Talent$ = "3-6" Then ClassTalent$ = "+2 to Intelligence stat or +1 to wizard spellcasting checks"
        If Talent$ = "7-9" Then ClassTalent$ = "Gain advantage on casting one spell you know"
        If Talent$ = "10-11" Then ClassTalent$ = "Learn one additional wizard spell of any tier you know"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

ZeroLevel:
    CLASSTYPE$ = "Zero Level"
    HITPOINTS = 0
    GoSub FixHP
    Weapon$ = "Weapons: All weapons until 1st level"
    Armor$ = "Armor: All armor and shields until 1st level"
    ClassFeature1$ = "Beginner's luck, you can wield all gear until 1st level."
    ClassFeature2$ = " "
    ClassFeature3$ = " "
    ClassTalent$ = " "
    ClassFeature4$ = " "
Return

Ranger:
    CLASSTYPE$ = "Ranger"
    HITPOINTS = Int(Rnd * 8) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Dagger, longbow, longsword, shortbow, shortsword, spear, staff"
    Armor$ = "Armor: Leather armor, chainmail"
    ClassFeature1$ = "Wayfinder. You have advantage on checks associated with Rangers."
    ClassFeature2$ = "Herbalism. Make an INT check to find an herb you choose. If you fail, you can't try to find that herb again until you successfully complete a rest. Unused herbs loose thier effect in 3 rounds."
    ClassFeature3$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "You deal d12 damage with one weapon type you choose"
        If Talent$ = "3-6" Then ClassTalent$ = "+1 to melee or ranged attacks and damage"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 Strength, Dexterity, or Intellegence"
        If Talent$ = "10-11" Then ClassTalent$ = "You gain ADV on Herbalism checks for an herb you choose"
        If Talent$ = "12" Then ClassTalent$ = "Choose a talent or +2 points to distribute to stats"
Return

Bard:
    CLASSTYPE$ = "Bard"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: "
    Armor$ = "Armor: "
    ClassFeature1$ = " "
    ClassFeature2$ = " "
    ClassFeature3$ = " "
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = " "
        If Talent$ = "3-6" Then ClassTalent$ = " "
        If Talent$ = "7-9" Then ClassTalent$ = " "
        If Talent$ = "10-11" Then ClassTalent$ = " "
        If Talent$ = "12" Then ClassTalent$ = " "
Return

Knight:
    CLASSTYPE$ = "Knight of St. Ydris"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: All melee weapons, crossbow "
    Armor$ = "Armor: All armor and shields"
    ClassFeature1$ = "Languages. You know Diabolic."
    ClassFeature2$ = "Demonic Possession"
    ClassFeature3$ = "Spellcasting. You can cast witch spells you know. "
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Your Demonic Possession bonus increases by 1 point"
        If Talent$ = "3-6" Then ClassTalent$ = "+1 to melee or ranged attacks"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength, Dexterity, or Constitution stat"
        If Talent$ = "10-11" Then ClassTalent$ = "+2 to Charisma stat or +1 to witch spellcasting checks"
        If Talent$ = "12" Then ClassTalent$ = "Choose one talent or 2 points to distribute to stats"
Return

Warlock:
    CLASSTYPE$ = "Warlock"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Club, crossbow, dagger, mace, longsword"
    Armor$ = "Armor: Leather armor, chainmail, and shields"
    ClassFeature1$ = "Languages. You know either Celestial, Diabolic, Draconic, Primordial, or Sylvan."
    ClassFeature2$ = "Patron. Choose a patron to serve (see pg. 17). Your patron is thesource of your supernatural gifts."
    ClassFeature3$ = "Patron Boon. At 1st level, you gain a random Patron Boontalent (see pg. 18) based onyour chosen patron."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Roll a Patron Boon from any patron; an unexplained gift"
        If Talent$ = "3-6" Then ClassTalent$ = "Add +1 point to two stats (they must be different)"
        If Talent$ = "7-9" Then ClassTalent$ = "+1 to melee or ranged attacks"
        If Talent$ = "10-11" Then ClassTalent$ = "Roll two Patron Boons and choose one to keep"
        If Talent$ = "12" Then ClassTalent$ = "Choose one talent or 2 points to distribute to stats"
Return

Witch:
    CLASSTYPE$ = "Witch"
    HITPOINTS = Int(Rnd * 4) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Dagger, staff"
    Armor$ = "Armor: Leather armor"
    ClassFeature1$ = "Languages. You know Diabolic, Primordial, and Sylvan. "
    ClassFeature2$ = "Familiar. You have a small animal such as a raven, rat, or frog who serves you loyally. It can speak Common."
    ClassFeature3$ = "Spellcasting. You can cast witch spells you know."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "1/day, teleport to your familiar's location as a move"
        If Talent$ = "3-6" Then ClassTalent$ = "+2 to Charisma stat or +1 to witch spellcasting checks"
        If Talent$ = "7-9" Then ClassTalent$ = "Gain advantage on casting one spell you know"
        If Talent$ = "10-11" Then ClassTalent$ = "Learn an additional witch spell of any tier you can cast"
        If Talent$ = "12" Then ClassTalent$ = "Choose one talent or 2 points to distribute to stats"
Return

DesertRaider:
    CLASSTYPE$ = "Desert Raider"
    HITPOINTS = Int(Rnd * 8) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Club, dagger, javelin, longsword, pike (see New Weapons, pg. 17), shortbow, scimitar, spear, whip"
    Armor$ = "Armor: Leather armor, shields"
    ClassFeature1$ = "Charge. 3/day, you can charge into combat by moving at least near before attacking."
    ClassFeature2$ = "Mount. You have a common camel or horse with a reliable or lovely demeanor (see pg. 29). It comes when you call and never spooks. You can only have one such mount at a time."
    ClassFeature3$ = " "
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "You can use any rider-bearing creature as your mount"
        If Talent$ = "3-6" Then ClassTalent$ = "You gain +1 to attacks or damage"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength or Dexterity stat, or +1 to melee attacks"
        If Talent$ = "10-11" Then ClassTalent$ = "Gain an additional use of your Charge talent each day"
        If Talent$ = "12" Then ClassTalent$ = "Choose one Talent or +2 points to distribute to stats"
Return

PitFighter:
    CLASSTYPE$ = "Pit Fighter"
    HITPOINTS = Int(Rnd * 8) + 1
    GoSub FixHP
    Weapon$ = "Weapons: All weapons"
    Armor$ = "Armor: Leather armor, shields"
    ClassFeature1$ = "Flourish. 3/day, regain 1d6 hit points when you hit an enemy with a melee attack."
    ClassFeature2$ = "Implacable. You have advantage on Constitution checks to resist injury, poison, or endure extreme environments."
    ClassFeature3$ = "Last Stand. You get up from dying with 1 hit point on a natural d20 roll of 18-20."
    ClassFeature4$ = "Relentless. 3/day, when you are reduced to 0 HP, make a DC 18 Constitution check (the Implacable talent applies to this roll). On a success, you instead go to 1 HP."
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "1/day, ignore all damage and effects from one attack"
        If Talent$ = "3-6" Then ClassTalent$ = "You gain +1 to melee weapon damage"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength or Constitution stat, or +1 to melee attacks"
        If Talent$ = "10-11" Then ClassTalent$ = "Increase the HP you gain from Flourish by 1d6"
        If Talent$ = "12" Then ClassTalent$ = "Choose one option or +2 points to distribute to stats"
Return

RasGodai:
    CLASSTYPE$ = "Ras-Godai"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Blowgun, (see pg. 17), bolas, dagger, razor chain, scimitar, shuriken, spear"
    Armor$ = "Armor: Leather armor"
    ClassFeature1$ = "Languages. You know Diabolic."
    ClassFeature2$ = "Assassinate. When you attack a surprised target, you deal double damage against it."
    ClassFeature3$ = "Smoke Step. 3/day, teleport to a location you can see within near. This does not use your action."
    BLTalent = Int(Rnd * 12) + 1
        If BLTalent = 1 Then ClassFeature4$ = "You deal triple damage with your Assassinate talent"
        If BLTalent = 2 Then ClassFeature4$ = "1/day, paralyze a target of LV 9 or less for 1d4 rounds when you damage it with a weapon"
        If BLTalent = 3 Then ClassFeature4$ = "You have advantage on Dexterity checks to avoid entrapment or injury"
        If BLTalent = 4 Then ClassFeature4$ = "You gain +1 to your AC when wielding a melee weapon in each hand"
        If BLTalent = 5 Then ClassFeature4$ = "You gain an additional hit points die"
        If BLTalent = 6 Then ClassFeature4$ = "You have advantage on DEX checks to sneak and hide"
        If BLTalent = 7 Then ClassFeature4$ = "When enemies who can see you make a morale check, the DC is 18 instead of 15"
        If BLTalent = 8 Then ClassFeature4$ = "1/day, you can walk on water as if it were solid for 1d4 rds"
        If BLTalent = 9 Then ClassFeature4$ = "1/day, choose a living creature of LV 5 or less you can see within near; it must pass a DC 15 CON check or fall asleep"
        If BLTalent = 10 Then ClassFeature4$ = "1/day, you can walk on sheer surfaces like walls for 1d4 rds"
        If BLTalent = 11 Then ClassFeature4$ = "You deal +1 damage with melee weapons"
        If BLTalent = 12 Then ClassFeature4$ = "1/day, choose a creature of LV 9 or less you can see; it must pass a DC 15 WIS check or it can't see or hear you for 1d4 rounds"
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "You are trained in the use of poisons (see pg. 27)"
        If Talent$ = "3-6" Then ClassTalent$ = "Roll an additional talent on the Black Lotus Talents table"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength or Dexterity stat, or +1 to melee attacks"
        If Talent$ = "10-11" Then ClassTalent$ = "Gain an additional use of your Smoke Step talent"
        If Talent$ = "12" Then ClassTalent$ = "Choose one option or +2 points to distribute to stats"
Return

SeaWolf:
    CLASSTYPE$ = "Sea Wolf"
    HITPOINTS = Int(Rnd * 8) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Dagger, greataxe, handaxe (see New Gear on pg. 20), longbow, longsword, spear"
    Armor$ = "Armor: Leather armor, chainmail, shields"
    ClassFeature1$ = "Seafarer. You have advantage on checks related to navigating and crewing boats."
    ClassFeature2$ = "Old Gods. Each day, your purpose aligns with one of the Old Gods (pg. 17)."
    ClassFeature3$ = "Shield Wall. If you wield a shield, you can use your action to take a defensive stance. Your AC becomes 20 during this time."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "1/day, go berserk: immune to damage for 3 rounds"
        If Talent$ = "3-6" Then ClassTalent$ = "Your attacks deal +1 damage"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to Strength or Constitution stat, or +1 to attacks"
        If Talent$ = "10-11" Then ClassTalent$ = "Duality; choose two different Old Gods effects each day"
        If Talent$ = "12" Then ClassTalent$ = "Choose one option or +2 points to distribute to stats"
Return

Seer:
    CLASSTYPE$ = "Seer"
    HITPOINTS = Int(Rnd * 6) + 1
    GoSub FixHP
    Weapon$ = "Weapons: Dagger, stave, spear"
    Armor$ = "Armor: Leather armor"
    ClassFeature1$ = "Destined. Whenever you use a luck token, add 1d6 to the roll."
    ClassFeature2$ = "Omen. 3/day, you can make a DC 9 WIS check. On a success, gain a luck token (you can't have more than one luck token at a time)."
    ClassFeature3$ = "Spellcasting. You can cast seer spells you know. You know one tier 1 spell of your choice from the seer spell list (see pg. 30)."
    ClassFeature4$ = " "
    GoSub GetTalent
        If Talent$ = "2" Then ClassTalent$ = "Learn an additional seer spell from any tier you can cast"
        If Talent$ = "3-6" Then ClassTalent$ = "Gain an additional use of your Omen talent each day"
        If Talent$ = "7-9" Then ClassTalent$ = "+2 to WIS or CHA stat, or +1 to spellcasting checks"
        If Talent$ = "10-11" Then ClassTalent$ = "Increase the die category of your Destined talent by one"
        If Talent$ = "12" Then ClassTalent$ = "Choose one option or +2 points to distribute to stats"
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
