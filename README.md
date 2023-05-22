# Shadowdark Character Generator

This program randomly generates a character for the Shadowdark RPG, Quickstart rules are availble at;

https://www.drivethrurpg.com/product/413713/Shadowdark-RPG-Quickstart-Set

Compiling:
This program was writen for Qbasic and can be compiled with QB64 or FreeBasic;

FreeBasic is available at https://www.freebasic.net/. To compile under FreeBasic, use the folowing;

For Linux:

    fbc -lang qb shadowdark.bas -x bin/shadowdark.lnx

For Windows:

    fbc64 -lang qb shadowdark.bas -x bin\shadowdark.exe

QB64 is availble from https://qb64.com/. If you are using QB64 or have downloaded Qbasic from the internet, the first line of the program must be changed from Randomize (Timer, 3) to Randomize Timer. To compile under QB64, use the folowing;

qb64 -c shadowdark.bas

Notes:

In light of the information provided by The Arcane Library and their Lawyer in a streaming event, I have removed all the Cursed Scroll classes and backgrounds, I have also rewritten the ancestry and class features so as not to be verbatum from the rule book.

I have added the Ranger and Bard classes, please keep in mind the Bard class is still under development and may change.

This is a commandline, text program, there is no fancy Windows GUI. The program will ask if you want to save the character, if you say yes, it will save it as a text file.

I am aware this is really bad code. I originally wrote this program back in the early 90's to roll up D&D characters. While I am capable of cleaning it up and making it into a decent program, I choose not to, I like the old school coding because it goes along with the old school feel of the Shadowdark RPG.

There is a Linux (.lnx) and a Windows (.exe) binary in the bin folder for those of you who do not want to go to the trouble of downloading and installing QB64 or FreeBasic. I use Linux as my primary operating system, so the Windows binary may occassionally fall a few days behind the Linux binary. Sorry OS X users, I do not own a Mac, you are on your own.

Thank you to Kelsey Dionne for creating the Shadowdark RPG, your hard work and creativity is appreciated.

https://www.thearcanelibrary.com/

https://www.youtube.com/@TheArcaneLibrary

Legal Statement:
This Shadowdark Character Generator is an independent product published under the Shadowdark RPG Third-Party License and is not affiliated with The Arcane Library, LLC. Shadowdark RPG © 2023 The Arcane Library, LLC."

Disclaimer:
This software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to warranties of merchantability, fitness for a paticular purpose and nonifringment. In no event shall the author or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.
