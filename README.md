# Shadowdark-chargen

This program randomly generates a character for the Shadowdark RPG, Quickstart rules are availble at;

https://www.drivethrurpg.com/product/413713/Shadowdark-RPG-Quickstart-Set

Compiling:
This program was writen for Qbasic and can be compiled with QB64 or FreeBasic;

FreeBasic is available at https://www.freebasic.net/. To compile under FreeBasic, use the folowing;

fbc -lang qb shadowdark.bas -x bin/shadowdark 

QB64 is availble from https://qb64.com/. If you are using QB64 or have downloaded Qbasic from the internet, the first line of the program must be changed from Randomize (Timer, 3) to Randomize Timer. To compile under QB64, use the folowing;

qb64 -c shadowdark.bas

Notes:

This is a commandline, text program, there is no fancy Windows GUI. The program will ask if you want to save the character, if you say yes, it will save it as a text file.

I am aware this is really bad code. I originally wrote this program back in the early 90's to roll up D&D characters. While I am capable of cleaning it up and making it into a decent program, I choose not to, I like the old school coding because it goes along with the old school feel of the Shadowdark RPG.

There is a Linux binary in the bin folder, at some point I will add a pre compiled Windows binary for those who do not want to go to the trouble of downloading and installing QB64 or FreeBasic. Sorry OS X users, I do not own a Mac, you are on your own.

Thank you to Kelsey Dionne for creating the Shadowdark RPG, your hard work and creativity is appreciated.

https://www.thearcanelibrary.com/

https://www.youtube.com/@TheArcaneLibrary
