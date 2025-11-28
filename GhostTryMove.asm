INCLUDE Tag.inc
.code

; expects dx in EAX, dy in EBX
GhostTryMove PROC PUBLIC USES ecx edx

    ; compute newX = gx + dx
    mov  ecx, gx
    add  ecx, eax

    ; clamp newX into [1, mapW-2]
    cmp  ecx, 1
    jge  @chkRightX
    mov  ecx, 1
    jmp  @xClamped
@chkRightX:
    ret
GhostTryMove ENDP
END