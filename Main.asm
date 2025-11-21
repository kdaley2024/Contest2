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
