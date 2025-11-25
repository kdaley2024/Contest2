INCLUDE Tag.inc
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
    
    ; clamp newY into [1, mapH-2]
    cmp  ecx, 1
    jge  @chkBottomY
    mov  ecx, 1
    jmp  @yClamped
@chkBottomY:
    cmp  ecx, mapH-2
    jle  @yClamped
    mov  ecx, mapH-2
@yClamped:
    ; now edx = newX, ecx = newY
    
    ; index = newY * mapW + newX
    mov  esi, ecx
    imul esi, mapW
    add  esi, edx

     mov  al, mapRows[esi]

    ; if dot, eat it
    cmp  al, T_DOT
    jne  @noDot
    dec  dotsLeft
    inc  score
    mov  mapRows[esi], T_EMPTY
@noDot:

    ; commit move
    mov  px, edx
    mov  py, ecx

    ret
PlayerTryMove ENDP
END