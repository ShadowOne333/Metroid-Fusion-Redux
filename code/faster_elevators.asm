;	Faster Elevators
; Original code by interdpth, ported to MF_J by ShadowOne333

;[MF] Elevator down speed 
.org 0x8009C9C	; 8009BFC in U
	mov r0, #8

;Elevator up speed
.org 0x8009CAC	; 8009C0C in U
	dw 0xFFF8
