; Restore the original behaviour of the Bombs and the Wall Jump to that of the original Metroid Fusion

;-------------------------------------
;Single wall jumping (U)
;0x92BC - 0x16 -> 0x0B
; For Fusion (J), Needs the walljumping demo to be fixed
.org 0x8009336	; 0x9336, 0x16->0x0B
	.db 16h		; 0Bh
;-------------------------------------
; Demo Fixes
.include "code/og_demo_bombs_walljump.asm"
;-------------------------------------
; Mid-air bomb jump (J) by biospark
.org 0x80092A4
	mov r0, #0x28		; b 0x80092E0
.org 0x80092B0
	ldr r0, [pc, #8]	;b 0x80092E0
.org 0x80092C2
	beq 0x80092C6		;beq 0x80092E0
; Infinite Bomb Jumps, ported to MF_J by ShadowOne333
.org 0x8086386
	strh r2,[r1,16h]	;strh r2,[r1,1Ah]
	mov r0,1Ch		;mov r0,20h
	strh r0,[r1,18h]	;strh r0,[r1,18h]
	strh r2,[r1,1Ah]	;sub r2,10h
	mov r0,20h		;strh r2,[r1,16h]
.org 0x808639C
	mov r0,32h	;mov r0,0Bh
	strb r0, [r1,1Eh]
;-------------------------------------

.pool
