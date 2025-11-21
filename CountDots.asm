Include Tag.inc

mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

T_WALL      EQU '#'
T_DOT       EQU '.'
T_EMPTY     EQU ' '

.code
;This procedure counts the number of dots on the board.
;If the value on the board is a '.' incrementation will occur
CountDots PROC PUBLIC USES eax ebx ecx edx
    xor eax, eax
    mov dotsLeft, eax

    xor edx, edx            ; y = 0
outer:
    cmp edx, mapH           
    jge cdDone
    xor ecx, ecx            ; x = 0
inner:
    cmp ecx, mapW          
    jge nextY

    mov eax, edx            ; eax = y
    imul eax, mapW          ; eax = y*mapW
    add eax, ecx            ; eax = y*mapW + x
    mov bl, mapRows[eax]    
nextY:
cdDone:
  ret
CountDots ENDP
END
