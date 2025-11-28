INCLUDE Tag.inc
.code

; this procedure checks the x and y coordinates of the next position 
; to see it it is within the bound of the map
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
cmp  ecx, mapW-2
    jle  @xClamped
    mov  ecx, mapW-2
@xClamped:
    ; compute newY = gy + dy
    mov  edx, gy
    add  edx, ebx

    ; clamp newY into [1, mapH-2]
    cmp  edx, 1
    jge  @chkBottomY
    mov  edx, 1
    jmp  @yClamped
@chkBottomY:
    cmp  edx, mapH-2
    jle  @yClamped
    mov  edx, mapH-2
@yClamped:

    ; commit move
    mov  gx, ecx
    mov  gy, edx

    ret
GhostTryMove ENDP
END