Include Tag.inc

;constants
mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

;the different types of tiles that can be on the board, whether its the wall (#), edible dots (.) or an empty space ( )
T_WALL      EQU '#'
T_DOT       EQU '.'
T_EMPTY     EQU ' '

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

spc       BYTE ' ',0
scoreLbl  BYTE "Score: ",0
livesLbl  BYTE "Lives: ",0

;public global variable definition - so that they can be used in other modules
PUBLIC templateMapRows, mapRows, dotsLeft
PUBLIC px, py, gx, gy
PUBLIC score, lives
PUBLIC nl, spc

.code
main PROC PUBLIC

  call Randomize
  call Init
  call Clrscr

GameLoop:
  call DrawMap
  call DrawHUD

ExitGame:
    INVOKE ExitProcess, 0
main ENDP

END main
