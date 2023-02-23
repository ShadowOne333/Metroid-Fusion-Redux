; Several tweaks and QoL patches for the Japanese version of Metroid Fusion. Ported by ShadowOne333
;.gba
;.open "Metroid Fusion.gba",0x8000000

;-------------------------------------
; Skip intro by pressing Start even on a new save file
.org 0x808864A
	lsl r0,#0x0
;-------------------------------------
;Single wall jumping (U)
;0x92BC - 0x16 -> 0x0B
; For Fusion (J), Needs the walljumping demo to be fixed
.org 0x8009336	; 0x9336, 0x16->0x0B
	.db 0Bh
;-------------------------------------
; Demo Fixes
.include "code/demo_fixes.asm"
;-------------------------------------
; Fixes glitched Frame of starting wall jump (U)
; 0x82D57D3 - 00 -> 01
; For Fusion (J)
.org 0x82D7ADB	; 0x2D7ADB, 00->01
	.db 01h
;-------------------------------------
; [MF_U] Fix endgame ship OAM
;.org 0x8056784
;	nop	; Fix OAM
.org 0x8056B5C	; 0x56B5C in (J)
	nop
;-------------------------------------
; Mid-air bomb jump (J) by biospark
.org 0x80092A4
	b 0x80092E0
.org 0x80092B0
	b 0x80092E0
.org 0x80092C2
	beq 0x80092E0
; Infinite Bomb Jumps, ported to MF_J by ShadowOne333
.org 0x8086386
	strh r2,[r1,1Ah]
	mov r0,20h
	strh r0,[r1,18h]
	sub r2,10h
	strh r2,[r1,16h]
.org 0x808639C
	mov r0,0Bh
;-------------------------------------
; [MF_U] Arm Cannon Palette updates to match Suit colors. (U)
;0x800C130
;  1C DE 28 08 -> 28 4D 00 03
;0x0828DD7E 
;  73 4E -> 00 00 (thanks kazuto)
; For Fusion (J) 
.org 0x800C1D0	; Pointer change to RAM
; 24 01 29 08 -> 58 4D 00 03
	.dw 03004D58h
.org 0x8290086	; 73 4E -> 00 00
	.dh 0h	; mov r0,r0
;-------------------------------------
; [MF_U] Normal beam is chargeable
;8005CF0
; 1A D0 -> C0 46
; For Fusion (J)
;.org 0x8005D54	; 1A D0 -> C0 46
;	nop
;-------------------------------------
; Walljump doesn't cancel Charge Beam (U)
;8005EE6
; 10 73 - C0 46
; For Fusion (J) 
.org 0x8005F4A	; 10 73 - C0 46
	nop
;-------------------------------------
; [MF_J] Made a version of my More Accurate In-Game Clock tweak for the Japanese version. 
.org 0x08068C9C	; 3F -> 3B
	.db 3Bh
;-------------------------------------
; [MF_U] Missile and PB's collection percentage start with 0, instead of 0A (10)
; 0xA208E		0A -> 00	; Missiles
 ;0xA20A0		0A -> 00	; Power bombs
; For Fusion (J)
.org 0x80A3F7E	; 0A -> 00	; Missiles
	.db 00h
.org 0x80A3F92	; 0A -> 00	; Power bombs
	.db 00h,38h	; Don't know why armips overwrites the $38 with $00, so we force it
;-------------------------------------
; [MF_U] Stops low health alarm in Metroid Fusion
;71DA2: 1D 2E -> 14 E0
; For Fusion (J) (0x2C)
;.org 0x807244E	; 1D 2E -> 14 E0
;	b 0x807247A
;-------------------------------------
; Skips intro cutscene, going right to the first nav room briefing. 0C for skipping file selection and going straight to Docking Bay, or 0B to skip new file intro and Jump to ship landing (U)
; 0x8777E - 01 to 0C
; For Fusion (J)
;.org 0x80886F6	; 0x886F6, 01->0C
;	.db 0Ch
;-------------------------------------
.pool
;.close
