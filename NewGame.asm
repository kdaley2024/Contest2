INCLUDE Tag.inc

.code

;This Procedure involves the setup of a new game
Init PROC PUBLIC
    mov lives, 3
    mov score, 0

    ; Sets up the map once the game begins
    call ResetMap

    ret
Init ENDP

END
