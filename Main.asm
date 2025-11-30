Include Tag.inc

;constants
mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

;the different types of tiles that can be on the board, whether its the wall (#), edible dots (.) or an empty space ( )
T_WALL      EQU '#'
T_DOT       EQU '.'
T_EMPTY     EQU ' '

; different dirrections that the player can go in and keys that can be pressed
VK_LEFT     EQU 25h
VK_UP       EQU 26h
VK_RIGHT    EQU 27h
VK_DOWN     EQU 28h
VK_ESCAPE   EQU 1Bh
VK_A        EQU 41h
VK_D        EQU 44h
VK_W        EQU 57h
VK_S        EQU 53h

.data

;this is how the game board will look.
;A 30x20 board with walls
templateMapRows BYTE "##############################"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "#............................#"
                BYTE "##############################"


;creating an empty array to hold the inital bytes of the template for later use
mapRows BYTE MAPSIZE DUP(?)

px       SDWORD 1
py       SDWORD 1
gx       SDWORD mapW-2
gy       SDWORD mapH-2

score    SDWORD 0
lives    SDWORD 3
dotsLeft SDWORD 0

frameDelay  DWORD 70

nl        BYTE 13,10,0       ;new line
spc       BYTE ' ',0
scoreLbl  BYTE "Score: ",0
livesLbl  BYTE "Lives: ",0

winMsg    BYTE "YOU ATE ALL DOTS!",0
loseMsg   BYTE "GAME OVER!",0
quitMsg   BYTE "Thanks for playing.",0

;public global variable definition - so that they can be used in other modules
PUBLIC templateMapRows, mapRows, dotsLeft
PUBLIC px, py, gx, gy
PUBLIC score, lives
PUBLIC scoreLbl, livesLbl
PUBLIC nl, spc
PUBLIC frameDelay
PUBLIC winMsg, loseMsg, quitMsg

.code
main PROC PUBLIC
; draw current frame
  call Randomize
  call Init
  call Clrscr

GameLoop:
; draw current frame
  call DrawMap
  call DrawHUD
; player (C) one move per frame with arrow keys
  call HandlePlayer
; player (G) one move per frame with arrow keys
  call HandleGhost
; check for tag (G hits C)
  call CheckCollisions

; check win
  mov eax, dotsLeft
  cmp eax, 0
  jne @checkLose

  mov eax, YELLOW
  call SetTextColor
  mov edx, OFFSET nl
  call WriteString
  mov edx, OFFSET winMsg
  call WriteString
  jmp ExitGamePrint


@checkLose:
ExitGamePrint:


ExitGame:
    INVOKE ExitProcess, 0
main ENDP

END main
