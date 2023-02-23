; Apply over the Jumzhu's Faster Door Transitions patch(https://metroidconstruction.com/resource.php?id=414)
; Fixes an issue where vertical scrolling during door transition would get stuck in a loop when needing to scroll an odd number of pixels(?)
;.gba
;.open "Metroid Fusion.gba",0x8000000

; Original Faster Door Transitions code 
.org 0x806F25E	; 806EBB2 in U
	add r0,r1,2
.org 0x806F270	; 806EBC4 in U
	sub r0,r1,2
.org 0x806F292	; 806EBE6 in U 
	add r0,0xC
.org 0x806F2B0	; 806EC04 in U
	sub r0,0xC

; Following fixes by somerando(caauyjdp)
.org 0x806F250	; .org 0x806EBA4 in U
	db 14h
.org 0x806F252	; .org 0x806EBA6 in U
	db 15h
.org 0x806F254	; .org 0x806EBA8 in U

	ldrh r2,[r0,2]
	ldrh r0,[r3,12h]
	mov r4,2	; Had a solution in 4 instructions, but this is less untested
	sub r1,r2,r0
	add r1,1
	cmp r1,2
	bhi skip
	mov r4,1
skip:

;0x6ebb8
	cmp r2,r0
	bls jmp1
	add r0,r4
	b store
jmp1:
	.org 0x806F270	; .org 0x806EBC4 in U
	sub r0,r4
store:

;.close
