# Contest2
##Tag

Computer Architecture and Assembly Language project by Chervelle Pierre and Karla Daley.

#Overview

Tag is a simple arcade-style console game implemented in MASM using techniques from Kip Irvine – Assembly Language for x86 Processors.
The game runs entirely in a Windows console window using text-mode “graphics.” It relies on Irvine32 library routines (Gotoxy, WriteString/WriteChar, SetTextColor, Clrscr, Randomize) and Win32 keyboard input via GetAsyncKeyState.

The player (C) moves around a dot-filled grid while a ghost (G) chases them. The goal: collect all dots before losing all lives. If the ghost touches the player, a life is lost and both characters reset to opposite corners.

The map is a fixed 30×20 maze with walls, empty tiles, and collectible dots.
