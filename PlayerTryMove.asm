INCLUDE Tag.inc

mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

T_WALL      EQU '#'
T_DOT       EQU '.'
T_EMPTY     EQU ' '

.code
; procedure that checks whether the position the player is trying to move
; to is within the bounds of the game screen
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