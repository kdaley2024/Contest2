INCLUDE Tag.inc
.code
HandleGhost PROC PUBLIC USES eax ebx
    push VK_A
    call GetAsyncKeyState@4
    test ax, 8000h
    jz   @noA
    mov  eax, -1
    mov  ebx, 0
    call GhostTryMove
@noA:
    ret
HandleGhost ENDP
END