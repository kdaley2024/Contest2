INCLUDE Tag.inc

mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

.code

; Copies MAPSIZE bytes from templateMapRows to mapRows 
; (resets the map back to initial state)
ResetMap PROC PUBLIC USES esi edi ecx

    mov  esi, OFFSET templateMapRows
    mov  edi, OFFSET mapRows
    mov  ecx, MAPSIZE ; Load number of bytes to copy

    ; copies bytes from [ESI] → [EDI]
    rep  movsb

    call CountDots
    ret
ResetMap ENDP
END