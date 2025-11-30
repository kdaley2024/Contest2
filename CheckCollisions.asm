INCLUDE Tag.inc

mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

.code
;this procedure checks if the coordinates of C and G are equal and if they are
;there would be a collision and the life of C would decrease by 1 and the players would be reset to their respective coordinates.
CheckCollisions PROC PUBLIC USES eax ecx

  mov eax, px
  mov ecx, gx
  cmp eax, ecx
  jne Ret
  mov eax, py
  mov ecx, gy
  cmp eax, ecx
  jne Ret

  dec lives

  mov px, 1
  mov py, 1
  mov gx, mapW-2
  mov gy, mapH-2

Ret:
  ret
CheckCollisions ENDP
END
