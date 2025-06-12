; Patch for Kazuto's Sequence Breaking Fusion hack,
; animals don't get skipped if you collect power bombs before ice missiles.
; For the japanese port.
; Made by SpineShark
;.gba
;.open "SBF_J.gba","SBF_J_noAnimalSkip.gba",0x8000000

Freespace equ 0x8061140	; space at the end of CheckAdvanceEvent that was freed up by SBF, not vanilla freespace

MissileBombStatus equ 0x300134F
;CheckAdvanceEvent equ 0x8060F7C	; Already defined in SF_J_v1.0.asm

; Repurpose unused bit in missile/bomb equipment status to keep track if animals were saved
; Set bit when interacting with console in habitation deck
.org 0x8039806 ; hijack in MiscPadSpawnMessageBanner
	bl	SetAnimalFlag

.org Freespace
SetAnimalFlag:
	push 	r14
	push	r0-r2	
	ldr 	r0,=MissileBombStatus
	ldrb	r1,[r0]
	mov 	r2,0x40	;\ set bit 7
	orr	r1,r2	;/
	strb	r1,[r0]
	pop 	r0-r2
	bl 	CheckAdvanceEvent	; replace what the hijack overwrote
	pop 	r15
	.pool

; add a check for MissileBombStatus bit 7 in the SBF event data
.org 0x8085788
	.db 	0x3D



;.close
