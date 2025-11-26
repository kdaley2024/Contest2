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
    ; RIGHT: dx = +1, dy = 0
    push VK_RIGHT
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noRight
    mov  eax, 1
    mov  ebx, 0
    call PlayerTryMove
@noRight:
    ; UP: dx = 0, dy = -1
    push VK_UP
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noUp
    mov  eax, 0
    mov  ebx, -1
    call PlayerTryMove
@noUp:
    ret
HandlePlayer ENDP

END
