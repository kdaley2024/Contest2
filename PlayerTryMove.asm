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
    
@xClamped:
    ret
PlayerTryMove ENDP
END