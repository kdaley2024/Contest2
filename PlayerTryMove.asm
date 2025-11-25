INCLUDE tag.inc
.code
; expects dx in EAX, dy in EBX
PlayerTryMove PROC PUBLIC USES ecx edx esi
    ; compute newX = px + dx
    mov  edx, px
    add  edx, eax

    ; clamp newX into [1, mapW-2]
    cmp  edx, 1
    jge  @chkRightX
    mov  edx, 1
    jmp  @xClamped

@chkRightX:
    cmp  edx, mapW-2
    jle  @xClamped
    mov  edx, mapW-2

@xClamped:
    ; compute newY = py + dy
    mov  ecx, py
    add  ecx, ebx


    ret
PlayerTryMove ENDP
END