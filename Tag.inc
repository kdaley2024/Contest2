INCLUDE Irvine32.inc
;.386
;.model flat, stdcall
.stack 4096
ExitProcess PROTO :DWORD

OPTION PROC:PRIVATE

;Irvine (STDCALL)
Gotoxy        PROTO         ; DL=x, DH=y
WriteString   PROTO         ; EDX=addr
WriteDec      PROTO         ; EAX=value
SetTextColor  PROTO         ; EAX=(bg<<4)+fg


;Game Procedures (PROTO)
CountDots       PROTO
ResetMap        PROTO
Init            PROTO ;NewGame.asm
ScoreBoard      PROTO


;Game Constants (EXTERNDEF)
EXTERNDEF templateMapRows:BYTE
EXTERNDEF mapRows:BYTE
EXTERNDEF dotsLeft:SDWORD
EXTERNDEF score:SDWORD, lives:SDWORD
EXTERNDEF px:SDWORD, py:SDWORD
EXTERNDEF gx:SDWORD, gy:SDWORD
EXTERNDEF nl:BYTE, spc:BYTE
EXTERNDEF scoreLbl:BYTE, livesLbl:BYTE
