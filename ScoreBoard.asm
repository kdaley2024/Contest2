INCLUDE Tag.inc

.code

DrawHUD PROC PUBLIC
    ; sets the text color on the scoreboard text as white 
    mov eax, WHITE
    call SetTextColor

    ; Move the cursor to the position right 
    ; below the end of the game area
    mov dl, 0
    mov dh, mapH+1
    call Gotoxy

    ; displays the score to the player
    mov edx, OFFSET scoreLbl
    call WriteString
    mov eax, score
    call WriteDec
    mov edx, OFFSET spc
    call WriteString

    ; displays the new lives count to the player
    mov edx, OFFSET livesLbl
    call WriteString
    mov eax, lives
    call WriteDec

    ret
DrawHUD ENDP
END