# Contest 2
## Tag

Computer Architecture and Assembly Language project by Chervelle Pierre and Karla Daley.

# Overview

Tag is a simple arcade-style console game implemented in MASM using techniques from Kip Irvine – Assembly Language for x86 Processors.
The game runs entirely in a Windows console window using text-mode “graphics.” It relies on Irvine32 library routines (Gotoxy, WriteString/WriteChar, SetTextColor, Clrscr, Randomize) and Win32 keyboard input via GetAsyncKeyState.

The player (C) moves around a dot-filled grid while a ghost (G) chases them. The goal: collect all dots before losing all lives. If the ghost touches the player, a life is lost and both characters reset to opposite corners.

The map is a fixed 30×20 maze with walls, empty tiles, and collectible dots.

# What You See

Map: A 30×20 rectangular playfield with border walls (#) and dots (.) filling the inside.

Player (C) in green, starting at top-left interior.

Ghost (G) in red, starting at bottom-right interior.

HUD under the map showing Score and Lives.

# Objective

Eat all dots on the map. Each dot increases your score. When all dots are collected, you win the game.

## Player Movement

Controlled using the arrow keys:

LEFT, RIGHT, UP, DOWN move the player one tile per frame.

Movement clamps to the map interior and ignores walls.

## Ghost Movement

Controlled manually using W A S D for testing/2-player mode:

A / D → left / right

W / S → up / down

Ghost movement is also clamped to stay within the map boundaries.

## Quitting

Press ESC at any time to exit the game.

# APIs Used From the textbook
## From Irvine32

Console:
Gotoxy – move cursor to (x,y)
WriteChar / WriteString / WriteDec – render characters/text
SetTextColor – color tiles and sprites
Clrscr – clear console
Timing:
Delay – millisecond sleep
Randomize – seed RNG

## From Microsoft Learn

Keyboard (non-blocking):
GetAsyncKeyState – detect arrow keys, WASD, and ESC without blocking

# Game Operations:
ResetMap- Copies the template map into mapRows and recounts dots.

ResetLevel- Resets the map and repositions player/ghost.

NewGame- Initializes score, lives, map, and starting positions.

DrawMap- Renders:walls, dots, empty spaces (colored), player C, ghost G

Scoreboard- Prints score and lives at the bottom of the grid.

HandlePlayer-Arrow-key movement with collision rules and dot eating.

HandleGhost- WASD-input ghost movement (optional double-speed by calling twice).

PlayerTryMove / GhostTryMove- Clamps positions and updates new coordinates.

CheckCollisions- Detects if player and ghost share the same tile → life lost, respawn.

CountDots- Counts remaining dots on the map for win condition.
