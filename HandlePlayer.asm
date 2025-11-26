INCLUDE Tag.inc

;virtual key definitions
VK_LEFT     EQU 25h
VK_UP       EQU 26h
VK_RIGHT    EQU 27h
VK_DOWN     EQU 28h
VK_ESCAPE   EQU 1Bh

.code

HandlePlayer PROC PUBLIC USES eax ebx
    ; LEFT: dx = -1, dy = 0
    push VK_LEFT
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noLeft
    mov  eax, -1
    mov  ebx, 0
    call PlayerTryMove
@noLeft:
    ret
HandlePlayer ENDP

END
