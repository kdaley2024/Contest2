INCLUDE Tag.inc

.code

;This Procedure involves the setup of a new game
Init PROC PUBLIC
    mov lives, 3
    mov score, 0

    ; Sets up the map once the game begins
    call ResetMap

    ; Every time the game restarts or starts, these are the starting positions of the players
    mov px, 1
    mov py, 1
    mov gx, mapW-2
    mov gy, mapH-2

    ret
Init ENDP

END
