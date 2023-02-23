; Makes the morphball only do its "rolling" animation if the ball is moving
;.gba
;.open "fusion.gba","Metroid Fusion.gba",0x8000000

.org 0x8004E04	; .org 0x8004DA0
	bl MorphCheck		;checks when to 0 animation values
.org 0x8004FCE	; .org 0x8004F6A
	bl IdleStop		;stops animation is ball is idle

.org 0x80FBD8C	; .org 0x80F9A28	;unused fusion sound
IdleStop:
	mov r4,r0
	ldrb r0,[r5,1h]		;checks if not moving in morphball
	cmp r0,0Dh
	beq @@Return
	add r4,1h		;if moving, adds to animation counter like normal
	strb r4,[r1]
@@Return:
	bx r14

MorphCheck:
	ldrb r0,[r2,1h]
	cmp r0,0Dh		;checks ball poses
	beq @@ButtonCheck
	cmp r0,0Eh		;checks ball poses
	beq @@ButtonCheck
@@Normal:
	mov r0,r2
	add r0,21h
	b @@Return
@@ButtonCheck:			;needed if player is unmorphing, otherwise the game can 
	push r1			;load an animation that doesnt exist and crash
	ldr r0,=30011ECh	;changed input
	ldrh r0,[r0]
	mov r1,40h
	and r0,r1
	pop r1
	cmp r0,40h		;checks if pressed up is pressed
	beq @@Normal
	ldr r0,=8004DAAh
	mov r15,r0
@@Return:
	bx r14
	
.pool
;.close
