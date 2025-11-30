INCLUDE Tag.inc
.code

ResetLevel PROC PUBLIC
    call ResetMap          ; copy template into mapRows & recount dots

    ; resets the position of player and ghost 
    mov px, 1
    mov py, 1
    mov gx, mapW-2
    mov gy, mapH-2
    ret
ResetLevel ENDP

END
