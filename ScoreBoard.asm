DrawHUD PROC PUBLIC
    mov eax, WHITE
    call SetTextColor

    ; Gotoxy(0, mapH+1)
    mov dl, 0
    mov dh, mapH+1
    call Gotoxy

    mov edx, OFFSET scoreLbl
    call WriteString
    mov eax, score
    call WriteDec
    mov edx, OFFSET spc
    call WriteString

    mov edx, OFFSET livesLbl
    call WriteString
    mov eax, lives
    call WriteDec

    ret
DrawHUD ENDP
END