INCLUDE Tag.inc

mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

.code
;this procedure creates the map with the walls, the edible dots, as well as designing them with colors, etc
DrawMap PROC PUBLIC USES eax ebx ecx edx esi edi
    xor edi, edi                 ; y = 0
rowLoop:
    cmp edi, mapH                
    jge doneRows

    xor esi, esi                 ; x = 0
colLoop:
    cmp esi, mapW                
    jge nextRow

    mov eax, edi
    imul eax, mapW
    add eax, esi

    mov bl, mapRows[eax]

    mov bh, CYAN                 
    cmp bl, T_WALL
    jne notWall
    ; blue walls
    mov bh, BLUE                 
    jmp haveColor
notWall:
    cmp bl, T_DOT
    jne haveColor
    ; yellow dots
    mov bh, YELLOW
haveColor:
    mov eax, esi
    mov dl, al
    mov eax, edi
    mov dh, al
    call Gotoxy

    movzx eax, bh
    call SetTextColor
    mov al, bl
    call WriteChar

    inc esi
    jmp colLoop

nextRow:
    inc edi
    jmp rowLoop

doneRows:
    mov eax, GREEN
    call SetTextColor
    mov eax, px
    mov dl, al
    mov eax, py
    mov dh, al
    call Gotoxy
    mov al, 'C'
    call WriteChar

    ret
DrawMap ENDP

END
