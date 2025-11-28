INCLUDE Tag.inc

;constants
mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

VK_A        EQU 41h   
VK_D        EQU 44h   
VK_W        EQU 57h   
VK_S        EQU 53h   

.code
HandleGhost PROC PUBLIC USES eax ebx

    ; A: left
    push VK_A
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noA
    mov  eax, -1
    mov  ebx, 0
    call GhostTryMove
@noA:
    ; D: right
    push VK_D
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noD
    mov  eax, 1
    mov  ebx, 0
    call GhostTryMove
@noD:
    ; W: up
    push VK_W
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noW
    mov  eax, 0
    mov  ebx, -1
    call GhostTryMove
@noW:
    ; S: down
    push VK_S
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noS
    mov  eax, 0
    mov  ebx, 1
    call GhostTryMove
@noS:
  
    ret
HandleGhost ENDP
END
