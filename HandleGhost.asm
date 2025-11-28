INCLUDE Tag.inc

;constants
mapW        EQU 30
mapH        EQU 20
MAPSIZE     EQU (mapW * mapH)

VK_A        EQU 41h   
VK_D        EQU 44h   
VK_W        EQU 57h   
VK_S        EQU 53h   

.code
HandleGhost PROC PUBLIC USES eax ebx
  
    ret
HandleGhost ENDP
END
