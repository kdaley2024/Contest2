INCLUDE Irvine32.inc
;.386
;.model flat, stdcall
.stack 4096
ExitProcess PROTO :DWORD

OPTION PROC:PRIVATE

;Irvine (STDCALL)

;Game Procedures (PROTO)
CountDots       PROTO
ResetMap        PROTO

;Game Constants (EXTERNDEF)
EXTERNDEF templateMapRows:BYTE
EXTERNDEF mapRows:BYTE
EXTERNDEF dotsLeft:SDWORD

