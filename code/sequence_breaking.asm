; Sequence Breaking Fusion hack ported to MF_J by ShadowOne333
; IBJ code is already ported, located in the misc.asm file

;-------------------------------------
; SA-X (NOC) waiting in door to lay Power Bomb
.org 0x8018B5C	; 0x80189F0 in U
	bl 0x808532C	; 0x80846D0
	cmp r0,0x00
	beq 0x8018BE2	; 0x8018A76
	cmp r0,0x02
	bne 0x8018B6E	; 0x8018A02
	bl 0x80853CE	; 0x8084772
	b 0x8018B72	; 0x8018A06
	bl 0x80853B8	; 0x808475C
	nop	; C0 46

;-------------------------------------
; Security pad initialize
.org 0x802110C	; 0x8020F90 in U
	bl 0x8075712	; 0x8074F86 (Originally 0x8074F70)

;-------------------------------------
; Security pad monitor arm extending
.org 0x802154A	; 0x80213CE in U
	bl 0x8075712	; 0x8074F86 (Originally 0x8074F70)

;-------------------------------------
; Core-X ability initialize
.org 0x80255B8	; 0x8025404 in U
	beq 0x80255C4
	cmp r0,0x44
	beq 0x80255D4
	mov r0,0x00
	strh r0,[r5]
	b 0x8025710
	ldr r0,[pc,0x20]
	ldrb r1,[r0,0x0C]
	mov r0,0x40
	and r0,r1
	cmp r0,0x00
	bne 0x80255BE
	mov r1,ip
	b 0x80255EE
	ldr r0,[pc,0x10]
	ldrb r1,[r0,0x0C]
	mov r0,0x01
	and r0,r1
	cmp r0,0x00
	bne 0x80255BE
	mov r4,0x4B
	mov r1,0x5E
	b 0x80255EE
	mov r0,r0
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	nop	; mov r8,r8
	push {r1,r4}
	bl 0x80643EC	; 0x8063DE8
	pop {r1,r4}
	mov ip,r1

;-------------------------------------
; Chozo statue initialize
.org 0x802D7A4	; 0x802D5E4 in U
	ldr r4,[pc,0x18]
	add r0,r4,0x00
.org 0x802D79E	; 0x802D5EE in U
	ldr r0,[pc,0x14]
	ldrb r0,[r0,0x0A]
	mov r3,0x01
	and r3,r0
	cmp r3,0x00
	beq 0x802D7B8
	mov r0,0x00
	strh r0,[r4]
	b 0x802D86C
	lsl r4,r7,0x1A
	lsl r0,r0,0x0C
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	bl 0x80643EC	; 0x8063DE8
.org 0x802D808	; 0x802D648 in U
	strh r2,[r4,0x0C]

;-------------------------------------
; Shake trigger AI
.org 0x8030528	; 0x8030358 in U
	bl 0x808540A	; 0x80847AE

;-------------------------------------
; Scientist initialize
.org 0x803A28E	; 0x803A08A in U
	ldr r4,[pc,0x1C]
	add r1,r4,0x00
.org 0x803A298	; 0x803A094 in U
	ldr r0,[pc,0x14]
.org 0x803A2A2	; 0x803A09F in U
	cmp r0,0x00
	beq 0x803A0B4	; 0x803A0B0
	mov r0,0x00
	strh r0,[r4]
	b 0x803A300	; 0x803A0FC
	lsl r4,r7,0x1A
	lsl r0,r0,0x0C
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	bl 0x80643EC	; 0x8063DE8
	add r1,r4,0x00
	add r1,0x22
	mov r0,0x0C
	strb r0,[r1]
	ldrh r1,[r2]
	ldr r0,[pc,0x44]
	and r0,r1
.org 0x803A0C0	; 0x803A0BC in U
	ldrh r1,[r4]
.org 0x803A0C8	; 0x803A0C4 in U
	strh r0,[r4]
	add r0,r4,0x00
	add r0,0x25
	strb r5,[r0]
	add r3,r4,0x00
.org 0x803A0D8	; 0x803A0D4 in U
	add r0,r4,0x00
.org 0x803A0E6	; 0x803A0E2 in U
	strh r0,[r4,0x0A]
	strh r1,[r4,0x0C]
	add r0,0x64
	strh r0,[r4,0x0E]
	mov r0,0x14
	strh r0,[r4,0x10]
	add r0,r4,0x00
.org 0x803A0FA	; 0x803A0F6 in U
	str r0,[r4,0x18]
	strb r1,[r4,0x1C]
	strh r1,[r4,0x16]

;-------------------------------------
; Destroyed data pad AI
.org 0x8043AAC	; 0x804386C in U
	bl 0x80853F4	; 0x8084798
	cmp r0,0x00
	bne 0x8043AD0	; 0x8043890

;-------------------------------------
; Nettori initialize
.org 0x8043F72	; 0x8043D32 in U
	beq 0x8043F80
	ldr r1,[pc,0x124]
.org 0x8043F80	; 0x8043D40 in U
	bl 0x80643EC	; 0x8063DE8

; Check projectile hit Zazabi
; Zazabi Fix is already included and modifies the same offsets, so that one will be used instead
;.org 0x8045670	; 0x8045418 in U
;	ldr r0,[pc,0x58]
;.org 0x804569A	; 0x8045442 in U
;	ldr r0,[pc,0x34]
;.org 0x80456CA	; 0x8045472 in U
;	b 0x80456D4	; 0x804547C
;	lsr r0,r4,0x05
;	lsl r0,r0,0x0C
;	lsl r4,r7,0x1A
;	lsl r0,r0,0x0C
;	ldrb r0,[r4,0x0F]
;	cmp r0,0x0E
;	bhi 0x804572C	; 0x80454D4
;	cmp r0,0x0A
;	blo 0x80456EC	; 0x8045494
;	cmp r7,0x07
;	beq 0x8045756	; 0x80454FE
;	mov r0,0x0A
;	bl 0x8085940	; 0x8084D00
;	b 0x80456FE	; 0x80454A6
;	mov r2,0x08
;	cmp r0,0x05
;	blo 0x804572C	; 0x80454D4
;	ldrb r0,[r4,0x10]
;	cmp r0,0x04
;	bne 0x804572C	; 0x80454D4
;.org 0x80456FC	; 0x80454A4 in U
;	mov r2,0x04
;	add r1,r6,0x00
;	add r0,r5,0x00

;-------------------------------------
; Serris initialize
.org 0x8047A9A	; 0x804782E in U
	beq 0x8047AA8	; 0x804783C
	ldr r1,[pc,0x154]
.org 0x8047AA8	; 0x804783C in U
	bl 0x80643EC	; 0x8063DE8

;-------------------------------------
; Gold Zebesian door lock AI
.org 0x805794C	; 0x8057574 in U
	beq 0x805795C	; 0x8057584
	ldr r1,[pc,0x128]
.org 0x805795C	; 0x8057584 in U
	bl 0x80643EC	; 0x8063DE8

;-------------------------------------
; Ridley (pre-spawn) initialize
.org 0x805BA52	; 0x805B5A2 in U
	beq 0x805BA60	; 0x805B5B0
	ldr r1,[pc,0x5C]
.org 0x805BA60	; 0x805B5B0 in U
	bl 0x806488E	; 0x806428A

;-------------------------------------
; Yakuza initialize
.org 0x805C286	; 0x805BDC6 in U
	beq 0x805C294	; 0x805BDD4
	ldr r1,[pc,0xE0]
.org 0x805C294	; 0x805BDD4 in U
	bl 0x80643EC	; 0x8063DE8

;-------------------------------------
; Nightmare initialize
.org 0x805E2C2	; 0x805DDE2 in U
	beq 0x805E2D0	; 0x805DDF0
	ldr r1,[pc,0x1C4]
.org 0x805E2D0	; 0x805DDF0 in U
	bl 0x80643EC	; 0x8063DE8

;-------------------------------------
; Check advance event
.org 0x8060F7C	; 0x8060940 in U
	push {r4,r5,r6,r7,lr}
	lsl r0,r0,0x18
	lsr r2,r0,0x18
	ldr r1,[pc,0x174]
	ldrb r0,[r1]
	cmp r0,r2
	beq 0x8060FA0	; 0x8060964
	bgt 0x8060FA6	; 0x806096A
	add r1,0x01
	b 0x8060F84	; 0x8060948
	mov r0,0x10
	b 0x8060F96	; 0x806095A
	mov r0,0x20
	ldr r1,[pc,0x164]
	ldrb r1,[r1,0x0C]
	and r0,r1
	beq 0x8060FD2	; 0x8060996
	b 0x8060FCE	; 0x8060992
	ldr r1,[pc,0x15C]
	mov r0,0x3C
	strb r0,[r1]
	push {r2}
	add r0,r2,0x00
	bl 0x807501C	; 0x8074890
	pop {r2}
	cmp r2,0x66
	bge 0x8060FD2	; 0x8060996
	cmp r2,0x26
	beq 0x8060FD2	; 0x8060996
	cmp r2,0x31
	beq 0x8060FD2	; 0x8060996
	cmp r2,0x32
	beq 0x8060FD2	; 0x8060996
	cmp r2,0x33
	beq 0x8060F90	; 0x8060954
	cmp r2,0x51
	beq 0x8060F94	; 0x8060958
	sub r2,0x5B
	cmp r2,0x05
	blo 0x8060FD2	; 0x8060996
	bl 0x8060FD8	; 0x806099C
	pop {r4,r5,r6,r7}
	pop {r1}
	bx r1
	push {r4,lr}
	mov r0,0x6D
	mov r1,0x0A
	ldr r2,[pc,0x124]
	bl 0x80610C6	; 0x8060A8A
	mov r1,0x0B
	ldr r2,[pc,0x120]
	bl 0x80610C6	; 0x8060A8A
	mov r1,0x0C
	ldr r2,[pc,0x11C]
	bl 0x80610C6	; 0x8060A8A
	ldr r5,[pc,0x118]
	ldrb r2,[r5]
	cmp r2,0xFF
	bne 0x8061000	; 0x80609C4
	ldr r3,[pc,0xFC]
	ldrb r2,[r3,0x0D]
	ldr r5,[pc,0x110]
	add r2,0x01
	lsl r2,r2,0x18
	lsr r2,r2,0x18
	ldrb r1,[r5,r2]
	cmp r1,r0
	bhs 0x8061010	; 0x80609D4
	add r0,r1,0x00
	ldr r2,[pc,0x104]
	ldrb r1,[r2,0x02]
	cmp r0,r1
	beq 0x806101E	; 0x80609E2
	blt 0x806102A	; 0x80609EE
	add r2,0x04
	b 0x8061012	; 0x80609D6
	ldr r4,[pc,0xFC]
	ldrh r4,[r4,0x0C]
	ldrh r1,[r2]
	cmp r1,r4
	bne 0x806101A	; 0x80609DE
	ldrb r0,[r2,0x03]
	ldr r4,[pc,0xF4]
	ldrb r2,[r4]
	cmp r2,0x3C
	beq 0x806108C	; 0x8060A50
	cmp r0,0x3A
	beq 0x8061098	; 0x8060A5C
	cmp r2,0x3A
	beq 0x80610AA	; 0x8060A6E
	cmp r0,0xF
	beq 0x80610B2	; 0x8060A76
	cmp r0,0x4A
	bne 0x806104E	; 0x8060A12
	ldr r2,[pc,0xD8]
	ldrb r2,[r2,0x0C]
	cmp r2,0x00
	beq 0x806104E	; 0x8060A12
	mov r0,0x44
	b 0x80610BE	; 0x8060A82
	cmp r0,0x46
	blo 0x80610BE	; 0x8060A82
	cmp r0,0x4E
	bhs 0x8061074	; 0x8060A38
	ldr r3,[pc,0xA4]
	ldrb r2,[r3,0x0A]
	mov r1,0x04
	and r1,r2
	cmp r1,0x04
	beq 0x80610BE	; 0x8060A82
	ldrb r1,[r3,0x0D]
	cmp r1,0xFF
	beq 0x80610BE	; 0x8060A82
	push {r0}
	mov r0,0x46
	bl 0x807501C	; 0x8074890
	pop {r0}
	b 0x80610BE	; 0x8060A82
	ldr r2,[pc,0x98]
	ldrb r1,[r2]
	cmp r1,0xFF
	beq 0x80610BE	; 0x8060A82
	ldr r3,[pc,0x7C]
	strb r1,[r3,0x0D]
	mov r1,0xFF
	strb r1,[r2]
	ldr r2,[pc,0x9C]
	mov r1,0x02
	strb r1,[r2]
	b 0x80610BE	; 0x8060A82
	cmp r0,0x3D
	beq 0x80610C0	; 0x8060A84
	ldr r3,[pc,0x6C]
	mov r2,0x3C
	strb r2,[r3]
	b 0x80610BE	; 0x8060A82
	cmp r2,0x3B
	beq 0x80610C0	; 0x8060A84
	ldr r3,[pc,0x88]
	mov r2,0x4D
	strb r2,[r3]
	ldr r2,[pc,0x88]
	mov r1,0x00
	strb r1,[r2]
	b 0x80610BE	; 0x8060A82
	ldr r3,[pc,0x7C]
	mov r2,0x53
	strb r2,[r3]
	b 0x80610BE	; 0x8060A82
	ldr r3,[pc,0x7C]
	ldrb r3,[r3]
	cmp r3,0x1F
	blt 0x80610BE	; 0x8060A82
	add r0,0x01
	b 0x80610BE	; 0x8060A82
	strb r0,[r4]
	pop {r4}
	pop {r1}
	bx r1
	push {r0,lr}
	mov r0,0xFF
	ldr r3,[pc,0x30]
	add r3,r1,r3
	mov r4,0x80
	add r5,r2,0x07
	ldrb r2,[r3]
	and r2,r4
	cmp r2,0x00
	bne 0x80610E2	; 0x8060AA6
	ldrb r1,[r5]
	cmp r1,r0
	bhs 0x80610E2	; 0x8060AA6
	add r0,r1,0x00
	sub r5,0x01
	lsr r4,r4,0x01
	cmp r4,0x00
	bgt 0x80610D2	; 0x8060A96
	pop {r1}
	cmp r1,r0
	bhs 0x80610F2	; 0x8060AB6
	add r0,r1,0x00
	pop {r1}
	bx r1
	mov r0,r0
	ldr r3,[pc,0x38]
	lsr r0,r1,0x20
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	lsl r6,r0,0x01
	lsl r0,r0,0x0C
	ldr r3,[pc,0x78]
	lsr r0,r1,0x20
	ldr r3,[pc,0x98]
	lsr r0,r1,0x20
	ldr r3,[pc,0xB8]
	lsr r0,r1,0x20
	mov r5,r3
	lsl r0,r0,0x0C
	ldr r3,[pc,0xD8]
	lsr r0,r1,0x20
	ldr r0,[pc,0x3E0]
	lsr r0,r1,0x20
	mov r0,r4
	lsl r0,r0,0x0C
	lsr r7,r0,0x0E
	lsl r0,r0,0x0C
	lsl r2,r1,0x01
	lsl r0,r0,0x0C
	lsl r0,r4,0x01
	lsl r0,r0,0x0C
	add r1,r6,r7
	lsl r0,r0,0x0C
	lsl r6,r5,0x1A
	lsl r0,r0,0x0C
.area 0x5C,0x00	; Limit area to 0x8061190(?), 0x8060B54 in U
.endarea

;-------------------------------------
; Check on event Escaped NOC SA-X
.org 0x80612CC	; 0x8060C92 in U
	push {r0,lr}
	mov r1,0x00
.org 0x80612D6	; 0x8060C9A in U
	bgt 0x80612DA	; 0x8060C9E
	mov r1,0x00

;-------------------------------------
; Check on event NOC 1 nav conversation
.org 0x8061336	; 0x8060CFA in U
	bgt 0x8061340
	mov r1,0x01

;-------------------------------------
; Check on event meltdown
.org 0x806149A	; 0x8060E5E in U
	bgt 0x80614A4
	mov r1,0x01

;-------------------------------------
; No documentation for this, unknown what it is
.org 0x80647E2	; 0x80641DE in U
	lsl r3,r5,0x03
	add r3,r3,r1
	ldrb r1,[r2,0x0C]
	ldrb r3,[r3,0x02]
	bl 0x808531E	; 0x80846C2

;-------------------------------------
; Load room entry
.org 0x8064E34	; 0x8064830 in U
	b 0x8064F6C	; 0x8064968
.org 0x8064F54	; 0x8064950 in U
	bl 0x80854E4	; 0x8084888
	cmp r0,0x00
	beq 0x8064F6C	; 0x8064968
	ldrb r0,[r5,0x01]
	cmp r0,0x44
	bne 0x8064F6C	; 0x8064968
	ldr r1,[pc,0x14]
	mov r0,0x80
	lsl r0,r0,0x08
	strh r0,[r1]
	strh r0,[r1,0x02]
	add sp,0x3C
	pop {r4,r5}
	pop {r0}
	bx r0
;-------------------------------------

; Check ground type under Samus
.org 0x80697BC	; 0x8069198 in U
	ldr r1,[pc,0x90]	
.org 0x80697CA	; 0x80691A6 in U
	ldr r1,[pc,0x88]
	ldr r0,[pc,0x88]
.org 0x80697E0	; 0x80691BC in U
	ldr r0,[pc,0x78]
	mov r8,r0
	ldr r1,[pc,0x78]
	mov sb,r1
	ldr r1,[pc,0x6C]
	ldrb r0,[r4,0x01]
.org 0x806981E	; 0x80691FA in U
	ldr r1,[pc,0x44]
.org 0x8069826	; 0x8069202 in U
	bl 0x80854A0	; 0x8084844
	ldrb r1,[r4]
	mov r0,0x20
	and r0,r1
	cmp r0,0x00
	beq 0x8069844	; 0x8069220
	lsl r0,r5,0x18
	lsr r0,r0,0x18
	bl 0x8069B2C	; 0x8069508
	ldr r1,[pc,0x10]
	mov ip,r1
	cmp r0,0xFF
	bne 0x8069876	; 0x8069252
	bl 0x808544C	; 0x80847F0
	cmp r0,0xFF
	bne 0x8069876	; 0x8069252
	b 0x8069874	; 0x8069250
	mov r0,r0
	lsr r0,r4,0x0F
	lsl r0,r0,0x0C
	.db 0x94,0xB8
	lsr r1,r7,0x01
	mov r4,r5
	lsl r0,r0,0x0C
	mov r6,r5
	lsl r0,r0,0x0C
	ldr r6,[pc,0xE0]
	lsl r0,r0,0x0C
	ldr r6,[pc,0x30]
	lsl r0,r0,0x0C

.org 0x8069868	; 0x8069244 in U
.area 0x0C,0x00	; Limit area to 0x8069874, 0x8069250 in U
.endarea

;-------------------------------------
; CHECK TOUCHING TRANSITION OR TANK (?)
.org 0x806C966	; 0x806C340 in U
	b 0x806CAF2	; 0x806C464
	ldrh r0,[r5]

.org 0x806C970	; 0x806C34A in U
	b 0x806CAF2	; 0x806C464
.org 0x806C978	; 0x806C350 in U
	ldr r0,[pc,0x140]	; 0x120 in U ($25->$48)
	; $2D->$50

.org 0x806C980	; 0x806C358 in U
	b 0x806CADA	; 0x806C44C
	ldr r0,[pc,0x13C]	; 0x11C in U ($24->$47)
	; $2C->$4F
;-------------------------------------
; THIS SECTION MIGHT NEED A REWRITE DUE TO THE SIGNIFICANT CHANGES IN CODING BETWEEN MF_U AND MF_J
.org 0x806C98E	; 0x806C366 in U
	b 0x806CAF2	; 0x806C464
	;mov r4,0x03
; The following LDR is changed to an ADD r3,sp,0x18 in MF_J
	;ldr r2,[pc,0x110]	; 0x110 in U ($21->$44)
	;mov sl,r2
.org 0x806C996	; 0x806C36E
	ldr r0,[pc,0x12C]	; 0x110 in U ($21->$44)
	; $28->$4B

.org 0x806C9A0	; 0x806C37C
	bne 0x806CAE4	; 0x806C9A4 in J
	;b 0x806CAFA
	;sub r0,0x24
	;cmp r0,0X08
.org 0x806C9A8
	bls 0x806CAE4	; 0x806C9A4 in J, 0x806C9AC in U
; Modified code from MF_U
	;beq 0x806CAE4	; 0x806C456
	;sub r0,0x24
	;cmp r0,0x08
	;bhi 0x806CAE4	; 0x806C456

.org 0x806C9B6	; 0x806C38C in U
	bne 0x806CAD8	; 0x806C9BA in J
	;beq 0x806CAD8	; 0x806C44A in U, originally 0x806C460

.org 0x806C9E0	; 0x806C3B6 in U
	bne 0x806CAD8	; 0x806C9E4
	b 0x806CAEE
	ldr r1,[pc,0xD8]	; 0xBC in U ($0C->$2F)
	; $13->$36
	mov r0,0x01
	strb r0,[r1]
	ldr r1,[pc,0xE0]	; 0xC4 in U ($0E->$31)
	; $15->$38

.org 0x806C9FA	; 0x806C3CE in U
	ldr r1,[pc,0xB8]
	cmp r5,0x01
	bne 0x806CA14	; 0x806C3E8
	mov r2,0x01
	ldrh r0,[r1,0x06]
	add r0,0x05
	cmp r0,0xFF
	bgt 0x806CA3E	; 0x806C412
	strh r0,[r1,0x06]
	ldrh r0,[r1,0x04]
	add r0,0x05
	strh r0,[r1,0x04]
	b 0x806CA3E	; 0x806C412
	cmp r5,0x02
	bne 0x806CA28	; 0x806C3FC
	ldrh r0,[r1,0x02]
	add r0,0x64
	ldr r2,[pc,0x98]
	cmp r0,r2
	bgt 0x806CA4C	; 0x806C420
	strh r0,[r1,0x02]
	strh r0,[r1]
	b 0x806CA4C	; 0x806C420
	cmp r5,0x03
	bne 0x806CA4C	; 0x806C420
	mov r2,0x20
	ldrb r0,[r1,0x09]
	add r0,0x02
	cmp r0,0xFE
	bgt 0x806CA3E	; 0x806C412
	strb r0,[r1,0x09]
	ldrb r0,[r1,0x08]
	add r0,0x02
	strb r0,[r1,0x08]
	ldrb r0,[r1,0x0B]
	tst r0,r2
	bne 0x806C420
	orr r0,r2
	strb r0,[r1,0x0B]
	bl 0x806099C
	mov r1,r8
	ldr r0,[r1]
	sub r0,0x24
	lsl r0,r0,0x02
	add r0,sl
	ldrb r5,[r0,0x02]
	cmp r5,0x00
	beq 0x806C44A
	ldr r1,[pc,0x5C]
	ldrh r0,[r1,0x18]
	str r0,[sp]
	ldrh r0,[r1,0x16]
	str r0,[sp,0x04]
	mov r0,0x00
	str r0,[sp,0x08]
	mov r0,0x21
	add r1,r5,0x00
	mov r2,0x06
	mov r3,0x10
	bl 0x800FBC8
	ldr r0,[pc,0x2C]
	ldrb r0,[r0]
	lsl r0,r0,0x18
	asr r0,r0,0x18
	cmp r0,0x00
	bne 0x806C464
	mov r2,0x04
	rsb r2,r2,0x00
	add r8,r2
	sub r4,0x01
	cmp r4,0x00
	blt 0x806C464
	b 0x806C376
	add sp,0x34
	pop {r3,r4,r5}
	mov r8,r3
	mov sb,r4
	mov sl,r5
	pop {r4,r5,r6,r7}
	pop {r0}
	bx r0
	mov r2,r5
	lsl r0,r0,0x0C
	mov r6,r4
	lsl r0,r0,0x0C
	str r3,[sp,0x3C0]
	lsr r4,r7,0x20
	str r4,[sp,0x90]
	lsr r4,r7,0x20
	ldr r7,[pc,0x290]
	lsl r0,r0,0x0C
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	lsr r3,r6,0x20
	mov r0,r0
	asr r4,r0,0x09
	lsl r0,r0,0x0C
	mov r0,r0
	mov r0,r0
; Ends in 0x806CAC4 in J, 0x806C497 in U
;-------------------------------------


; Check update sub-event and music
.org 0x80709D0	; 0x8070324 in U
; 0x8070D94 in U, changed to 0x8070D9C
	.dw 0x8071448	; 0x8071440 in J

.org 0x80713F2	; 0x8070D46 in U
	mov r0,0x02
	b 0x80713F8
	mov r0,0x00
	cmp r3,0x01
	bne 0x8071414
	ldr r1,[pc,0x3C]
	ldrb r1,[r1]
	cmp r0,r1
	beq 0x807140C
	ldr r1,[pc,0x38]
	ldrb r0,[r1]
	cmp r0,0x00
	beq 0x8071428
	mov r0,0x46
	bl 0x800375D	; 0x80036F9
	b 0x8071428
	cmp r3,0x02
	bne 0x8071428
	ldrb r1,[r2,0x01]
	cmp r0,r1
	bne 0x8071428
	mov r0,0x5A
	mov r1,0x0B
	bl 0x800359C	; 0x8003538
	mov r5,0x01
	cmp r5,0x00
	bne 0x8071430
	bl 0x8071C36
	ldr r0,[pc,0x10]
	bl 0x8003D38	; 0x8003CD4
	bl 0x8071C36
	mov r0,r0
	ldr r6,[pc,0xF0]
	lsl r0,r0,0x0C
	add r0,r6,r7
	lsl r0,r0,0x0C
	lsl r7,r1,0x0B
	mov r0,r0
	bl 0x8003D60	; 0x8003CFC
	bl 0x8071C34
	mov r0,r0
	mov r0,r0
	mov r0,r0
	mov r0,r0


; Check or download data item
.org 0x80756BC	; 0x8074F30 in U
	push {r4,r5,lr}
	lsl r0,r0,0x18
	lsr r3,r0,0x18
	ldr r1,[pc,0xA0]
	ldrh r1,[r1,0x1C]
	ldr r2,[pc,0xA0]
	ldrb r4,[r2,0x02]
	ldr r5,[pc,0xA0]
	ldrh r0,[r2]
	cmp r0,r1
	bne 0x80756FA
	ldrb r0,[r5]
	and r0,r4
	bne 0x80756FA
	ldrb r0,[r2,0x03]
	cmp r0,0x42
	bne 0x80756EE
	ldr r5,[pc,0x90]
	ldrb r4,[r5]
	cmp r4,0x41
	beq 0x80756EE
	ldr r5,[pc,0x7C]
	ldrb r4,[r5,0x0B]
	cmp r4,0x09
	beq 0x807570A
	cmp r3,0x00
	beq 0x80756F6
	bl 0x8060F7C	; 0x8060940
	mov r0,0x01
	b 0x807570C
	add r2,0x04
	ldrb r0,[r2,0x02]
	cmp r0,r4
	bgt 0x8075704
	add r5,0x01
	add r4,r0,0x00
	cmp r0,0x00
	bne 0x80756CC
	mov r0,0x00
	pop {r4,r5}
	pop {r1}
	bx r1
	push {r4,r5,r6,r7,lr}
	lsl r0,r0,0x18
	lsr r7,r0,0x18
	ldr r0,[pc,0x58]
	ldrb r4,[r0,0x0D]
	add r4,0x01
	lsl r4,r4,0x18
	lsr r4,r4,0x18
	ldr r1,[pc,0x40]
	ldrb r1,[r1,0x1C]
	ldr r2,[pc,0x50]
	mov r3,0x00
	ldrb r0,[r2,0x01]
	cmp r1,r0
	beq 0x807573A
	add r3,0x01
	add r2,0x08
	cmp r3,0x04
	blt 0x807572A
	b 0x807575C
	ldrb r0,[r2]
	cmp r4,r0
	bgt 0x807575C
	add r0,r7,0x00
	cmp r0,0x00
	beq 0x8075758
	ldr r1,[pc,0x1C]
	mov r0,0x00
	strb r0,[r1,0x0B]
	ldrb r0,[r2,0x03]
	bl 0x8060F7C	;  0x8060940
	mov r0,0x02
	bl 0x8063A30	; 0x806342C
	mov r0,0x01
	b 0x807575E
	mov r0,0x00
	pop {r4,r5,r6,r7}
	pop {r1}
	bx r1
	mov r0,r2
	lsl r0,r0,0x0C
	ldr r2,[pc,0x2B8]
	lsr r0,r1,0x20
	asr r2,r3,0x0C
	lsl r0,r0,0x0C
	lsr r7,r0,0x0E
	lsl r0,r0,0x0C
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	str r0,[r1,0x0C]
	lsr r7,r2,0x01
; Blank out
	mov r0,r0
	mov r0,r0
	mov r0,r0
	mov r0,r0
	mov r0,r0


; Display message
.org 0x807A100	; 0x807992C in U
	mov r3,r3
	lsl r0,r0,0x0C
	ldr r2,[pc,0x3E8]
	lsr r0,r1,0x20


;-------------------------------------
; Draw debug menu values (?)
.org 0x807F18A	; 0x807E886 in U
	ldr r0,[sp,0x04]
	add r0,sb
.org 0x807F1B8	; 0x807E8B4 in U
	add r3,r2,0x00
	mov r2,0x01
	add sb,r2
	ldr r1,[sp,0x14]
	ldrb r0,[r1]
	mov r2,r8
	sub r0,r0,r2
	add r2,r3,0x00
.org 0x807F29E	; 0x807E99A in U
	ldr r0,[pc,0x98]
.org 0x807F2A8	; 0x807E9A4 in U
	ldr r1,[pc,0x90]
.org 0x807F2B0	; 0x807E9AC in U
	ldr r0,[pc,0x8C]
.org 0x807F2DA	; 0x807E9D6 in U
	ldr r1,[pc,0x64]
.org 0x807F2E8	; 0x807E9E4 in U
	ldr r0,[pc,0x58]
.org 0x807F2F8	; 0x807E9F4 in U
	beq 0x807F350
	ldr r0,[sp,0x04]
	add r0,0x01
	str r0,[sp,0x04]
	ldr r3,[sp,0x14]
	ldrb r0,[r3]
	mov r1,sb
	sub r0,r0,r1
.org 0x807F318	; 0x807EA14 in U
	ldr r6,[pc,0x30]
.org 0x807F332	; 0x807EA2E in U
	mov r6,0x20
	add ip,r6
	b 0x807F354
	str r2,[r7,0x14]
	lsr r7,r2,0x01
	mov r1,0x7C
	lsr r0,r3,0x01
	mov r1,0xB3
	lsr r0,r3,0x01
	bkpt 0xA8
	lsr r1,r7,0x01
	mov r1,0x7F
	lsr r0,r3,0x01
	.db 0x00,0xC8
	lsl r0,r0,0x18
	cmp r2,0x00
	beq 0x807F3BC
.org 0x807F434	; 0x807EB30 in U
	mov r5,0x00
	ldr r1,[sp,0x08]
	add r0,r1,r5
	lsl r0,r0,0x05
	add r6,r0,r7
	mov r3,sl
	add r0,r2,r3
	ldrb r0,[r0]
	add r0,0x01
	add r0,r0,r4
	lsl r0,r0,0x05
	ldr r1,[sp,0x0C]
	add r3,r0,r1
	ldr r0,[pc,0xB8]
	add r0,sb
	ldr r0,[r0]
	add r0,r0,r4
	ldrb r0,[r0]
	ldr r1,[sp]
	and r0,r1
	add r4,0x01
	cmp r0,0x00
	beq 0x807F492
	add r5,0x01
	str r5,[sp,0x04]
	ldr r1,[sp,0x10]
	push {r4}
	ldr r4,[pc,0xA0]
	add r0,r1,r4
	ldrb r1,[r0]
	mov r4,ip
	ldrb r0,[r4]
	sub r1,r1,r0
	lsl r0,r3,0x01
	ldr r3,[pc,0x94]
	add r4,r0,r3
	lsl r0,r6,0x01
	add r3,r0,r3
	add r1,0x01
	ldrh r0,[r4]
	strh r0,[r3]
	add r4,0x02
	add r3,0x02
	sub r1,0x01
	cmp r1,0x00
	bne 0x807F482
	pop {r4}
	ldr r0,[pc,0x68]
	add r0,r8
	ldrb r0,[r0]
	cmp r4,r0
	blt 0x807F436
	b 0x807F4A0
	mov r0,r0

;-------------------------------------
; Update arm cannon and weapons
.org 0x8082064	; 0x8081404 in U
	ldr r0,[pc,0x17C]
	ldrb r4,[r0,0x0A]
	mov r0,0x08
	and r0,r4
	cmp r0,0x00
	beq 0x80820B8
	mov r0,0x02
	and r0,r4
	lsl r1,r0,0x01
	add r1,0x03
	mov r0,0x04
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x8082086
	b 0x8082544
	ldr r5,[pc,0x160]
	mov r0,0x02
	and r0,r4
	cmp r0,0x00
	beq 0x80820A8
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x04
.org 0x808209E	; 0x808143E in U
	ldrh r2,[r5,0x02]
	mov r0,0x04
	mov r3,0x01
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x04
	mov r3,0x02
	bl 0x8081E1C
	mov r0,0x07
	b 0x80821D2
	mov r0,0x04
	and r0,r4
	cmp r0,0x00
	beq 0x8082108
	mov r0,0x02
	and r0,r4
	lsl r1,r0,0x01
	add r1,0x03
	mov r0,0x03
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x80820D6
	b 0x8082544
	ldr r5,[pc,0x110]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x03
	mov r3,0x00
	bl 0x8081E1C
	mov r0,0x02
	and r0,r4
	cmp r0,0x00
	beq 0x8082104
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x03
	mov r3,0x01
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x03
	mov r3,0x02
	bl 0x8081E1C
	mov r0,0x07
	b 0x80821D2
	mov r0,0x02
	and r0,r4
	cmp r0,0x00
	beq 0x808214A
	mov r0,0x02
	mov r1,0x07
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x8082120
	b 0x8082544
	ldr r5,[pc,0xC4]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x02
	mov r3,0x00
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x02
	mov r3,0x01
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x02
	mov r3,0x02
	bl 0x8081E1C
	mov r0,0x07
	b 0x80821D2
	mov r0,0x01
	cmp r0,r4
	bne 0x80821B2
	mov r0,0x01
	mov r1,0x07
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x8082160
	b 0x8082544
	ldr r5,[pc,0x84]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x01
	mov r3,0x00
	bl 0x8081E1C
	lsl r0,r0,0x18
	lsr r6,r0,0x18
	ldr r1,[pc,0x78]
	lsl r0,r6,0x05
	add r0,r0,r1
	ldrb r7,[r0,0x10]
	mov r8,r7
	ldrb r1,[r0]
	mov r0,0x40
	and r0,r1
	lsl r0,r0,0x18
	lsr r7,r0,0x18
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	str r7,[sp]
	mov r0,r8
	str r0,[sp,0x04]
	str r6,[sp,0x08]
	mov r0,0x01
	mov r3,0x01
	bl 0x8081EBC
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	str r7,[sp]
	mov r3,r8
	str r3,[sp,0x04]
	str r6,[sp,0x08]
	mov r0,0x01
	mov r3,0x02
	bl 0x8081EBC
	mov r0,0x07
	b 0x80821D2
	mov r0,0x00
	mov r1,0x03
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x80821C2
	b 0x8082544
	ldr r5,[pc,0x24]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x00
	mov r3,0x00
	bl 0x8081E1C
	mov r0,0x07
	ldr r1,[pc,0x1C]
	strb r0,[r1,0x0A]
	ldrh r0,[r5]
	ldrh r1,[r5,0x02]
	mov r2,0x2B
	bl 0x8073790	; 0x80730E4
	b 0x8082544
	mov r0,r0
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	lsr r0,r0,0x0E
	lsl r0,r0,0x0C
	lsr r0,r4,0x05
	lsl r0,r0,0x0C
	asr r4,r0,0x09
	lsl r0,r0,0x0C
.area 0x24,0x00	; Limit area to 0x8082218 in J, 0x80815B8 in U
.endarea

.org 0x80823A0	; 0x8081740 in U
	ldr r0,[pc,0x170]
	ldrb r4,[r0,0x0A]
	mov r0,0x08
	and r0,r4
	cmp r0,0x00
.org 0x80823BC	; 0x808175C in U
	ldr r5,[pc,0x158]
	mov r0,0x02
	and r0,r4
	cmp r0,0x00
	beq 0x80823DE
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x09
	mov r3,0x00
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x09
	mov r3,0x01
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x09
	mov r3,0x02
	bl 0x8081E1C
	mov r0,0x03
	b 0x8082502
	mov r0,0x04
	and r0,r4
	cmp r0,0x00
	beq 0x8082438
	mov r0,0x08
	mov r1,0x07
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x8082406
	b 0x8082544
	ldr r5,[pc,0x110]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x08
	mov r3,0x00
	bl 0x8081E1C
	mov r0,0x02
	and r0,r4
	cmp r0,0x00
	beq 0x8082434
	ldrh r1,[r5]
.org 0x808242A	; 0x80817CA in U
	ldrh r2,[r5,0x02]
.org 0x8082434	; 0x80817D4 in U
	mov r0,0x03
	b 0x8082502
	mov r0,0x02
	and r0,r4
	cmp r0,0x00
	beq 0x808247A
	mov r0,0x07
	mov r1,0x07
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x8082450
	b 0x8082544
	ldr r5,[pc,0xC4]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x7
	mov r3,0x00
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x07
	mov r3,0x01
	bl 0x8081E1C
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x07
	mov r3,0x02
	bl 0x8081E1C
	mov r0,0x03
	b 0x8082502
	mov r0,0x01
	cmp r0,r4
	bne 0x80824E2
	mov r0,0x06
	mov r1,0x07
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x8082490
	b 0x8082544
	ldr r5,[pc,0x84]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x06
	mov r3,0x00
	bl 0x8081E1C
	lsl r0,r0,0x18
	lsr r6,r0,0x18
	ldr r1,[pc,0x78]
	lsl r0,r6,0x05
	add r0,r0,r1
	ldrb r7,[r0,0x10]
	mov r8,r7
	ldrb r1,[r0]
	mov r0,0x40
	and r0,r1
	lsl r0,r0,0x18
	lsr r7,r0,0x18
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	str r7,[sp]
	mov r0,r8
	str r0,[sp,0x04]
	str r6,[sp,0x08]
	mov r0,0x06
	mov r3,0x01
	bl 0x8081EBC
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	str r7,[sp]
	mov r0,r8
	str r0,[sp,0x04]
	str r6,[sp,0x08]
	mov r0,0x06
	mov r3,0x02
	bl 0x8081EBC
	mov r0,0x03
	b 0x8082502
	mov r0,0x05
	mov r1,0x03
	bl 0x8081DCC
	lsl r0,r0,0x18
	cmp r0,0x00
	bne 0x80824F2
	b 0x8082544
	ldr r5,[pc,0x24]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
.org 0x8082500	; 0x80818A0 in U
	mov r0,0x03
	ldr r1,[pc,0x1C]
	strb r0,[r1,0x0A]
	ldrh r1,[r5]
	ldrh r2,[r5,0x02]
	mov r0,0x0F
	mov r3,0x00
	bl 0x8081E1C
	b 0x8082544
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	lsr r0,r0,0x0E
	lsl r0,r0,0x0C
	lsr r0,r4,0x05
	lsl r0,r0,0x0C
	asr r4,r0,0x09
	lsl r0,r0,0x0C
.area 0x20,0x00	; Limit area to 0x8082544 in J, 0x80818E4 in U
.endarea

;-------------------------------------
; Load beam graphics
.org 0x8082ABE	; 0x8081E5E in U
	ldr r0,[pc,0x48]
	ldrb r1,[r0,0x0A]
	cmp r1,0x01
	bne 0x8082ACA
	ldr r2,[pc,0x44]
	b 0x8082AD6
	lsr r0,r1,0x01
	lsl r1,r0,0x01
	add r1,r0,r1
	lsl r1,r1,0x02
	ldr r0,[pc,0x3C]
	add r2,r0,r1
	ldr r1,[pc,0x3C]
	ldr r0,[r2]
	str r0,[r1]
	ldr r0,[pc,0x38]
	str r0,[r1,0x04]
	ldr r0,[pc,0x38]
	str r0,[r1,0x08]
	ldr r0,[r1,0x08]
	ldr r0,[r2,0x04]
	str r0,[r1]
	ldr r0,[pc,0x34]
	str r0,[r1,0x04]
	ldr r0,[pc,0x2c]
	str r0,[r1,0x08]
	ldr r0,[r1,0x08]
	ldr r0,[r2,0x08]
	str r0,[r1]
	ldr r0,[pc,0x28]
	str r0,[r1,0x04]
	ldr r0,[pc,0x28]
	str r0,[r1,0x08]
	ldr r0,[r1,0x08]
	pop {r0}
	bx r0
	mov r0,r0
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	sub r4,r1,0x03
	lsr r0,r1,0x20
	sub r0,r3,0x03
	lsr r0,r1,0x20
	lsl r4,r2,0x03
	lsl r0,r0,0x10
	asr r0,r0,0x20
	lsl r1,r0,0x18
	lsl r0,r0,0x05
	strh r0,[r0]
	asr r0,r0,0x10
	lsl r1,r0,0x18
	lsl r0,r0,0x09
	lsl r0,r0,0x14
	mov r5,r0
	strh r0,[r0]
	rev r4,r4
	lsr r0,r3,0x01
	pop {r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r7}
	lsr r0,r3,0x01
	push {r2,r5,lr}
	lsr r0,r3,1
	.db 0xA4,0xB7
	lsr r0,r3,0x01
	push {r2,r5,r6}
	lsr r0,r3,0x01
	itt hs
	lsrh r0,r3,0x01
	stmh r1!,{r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r5,r7}
	lsr r0,r3,0x01
	stm r4!,{r2,r5}
	lsr r0,r3,0x01
	stm r6!,{r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r6,r7}
	lsr r0,r3,0x01
	stm r4!,{r2,r5}
	lsr r0,r3,0x01
	stm r6!,{r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r6,r7}
	lsr r0,r3,0x01
	itt hs
	lsrh r0,r3,0x01
	stmh r1!,{r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r5,r7}
	lsr r0,r3,0x01
	itt hs
	lsrh r0,r3,0x01
	stmh r1!,{r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r5,r7}
	lsr r0,r3,0x01
	ldm r1!,{r2,r5}
	lsr r0,r3,0x01
	ldm r3!,{r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r5,r6,r7}
	lsr r0,r3,0x01
	ldm r1!,{r2,r5}
	lsr r0,r3,0x01
	ldm r3!,{r2,r5,r7}
	lsr r0,r3,0x01
	push {r2,r5,r6,r7}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082AE8
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082AF4
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082b00
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082B0C
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082B18
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082B24
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082B30
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
	ldm r6!,{r2,r5}
	lsr r0,r3,0x01
	beq 0x8082B3C
	lsr r0,r3,0x01
	push {r2,lr}
	lsr r0,r3,0x01
.area 0x79,0x00	; Limit area to 0x8082C70 in J, 0x8082010 in U
.endarea
;-------------------------------------

; Load missile graphics
.org 0x8082C70	; 0x8082012 in U
	ldr r0,[pc,0x40]
	ldrb r1,[r0,0x0B]
	mov r2,0x0F
	and r1,r2
	mov r2,0x00
	cmp r1,r2
	beq 0x8082CAC
	add r2,0x01
	lsr r1,r1,0x01
	cmp r1,0x00
	bne 0x8082C7E
	sub r2,0x01
	lsl r2,r2,0x03
	ldr r0,[pc,0x28]
	add r2,r0,r2
	ldr r0,[pc,0x28]
	ldr r1,[r2]
	str r1,[r0]
	ldr r1,[pc,0x28]
	str r1,[r0,0x04]
	ldr r1,[pc,0x28]
	str r1,[r0,0x08]
	ldr r1,[r0,0x08]
	ldr r1,[r2,0x04]
	str r1,[r0]
	ldr r1,[pc,0x20]
	str r1,[r0,0x04]
	ldr r1,[pc,0x18]
	str r1,[r0,0x08]
	ldr r0,[r0,0x08]
	pop {r0}
	bx r0
	mov r0,r0
	asr r0,r2,0x0C
	lsl r0,r0,0x0C
	mov r0,0x6C
	lsr r0,r1,0x20
	lsl r4,r2,0x03
	lsl r0,r0,0x10
	asr r0,r0,0x0E
	lsl r1,r0,0x18
	lsl r0,r0,0x01
	strh r0,[r0]
	asr r0,r0,0x1E
	lsl r1,r0,0x18
	blo 0x8082D16
	lsr r0,r3,0x01
	blo 0x8082C1A
	lsr r0,r3,0x01
	bmi 0x8082D1E
	lsr r0,r3,0x01
	bmi 0x8082C22
	lsr r0,r3,0x01
	bpl 0x8082D26
	lsr r0,r3,0x01
	bpl 0x8082C2A
	lsr r0,r3,0x01
	bvs 0x8082D2E
	lsr r0,r3,0x01
	bvs 0x8082C32
	lsr r0,r3,0x01
.area 0x60,0x00	; Limit area to 0x8082D4C in J, 0x80820EC in U
.endarea
;-------------------------------------

; Move wave beam parts
.org 0x808318E	; 0x808252E
	ldr r5,[pc,0x58]
	ldrb r0,[r5,0x1E]
	mov r1,0x07
	mov r4,0x0F
	and r4,r0
	and r0,r1
	ldr r1,[pc,0x50]
	lsl r0,r0,0x01
	add r0,r1,r0
	ldrh r6,[r0]
	add r0,r6,0x00
	bl 0x80A4FC4
	ldr r2,[pc,0x44]
	ldr r3,[pc,0x48]
	bl 0x80a48A0
	bl 0x80a4160
	lsl r0,r0,0x10
	lsr r3,r0,0x10
	cmp r4,0x03
	bls 0x80831C0
	cmp r4,0x0B
	bls 0x80831C4
	mov r2,0x02
	b 0x80831C6
	mov r2,0x01
	ldrb r1,[r5,0x13]
	cmp r1,0x01
	bne 0x80831D0
	mov r1,0x03
	eor r2,r1
	ldrb r1,[r5]
	mov r0,0x40
	and r1,r0
	ldrb r0,[r5,0x10]
	sub r0,0x01
	cmp r0,0x04
	bhi 0x8083256
	lsls r0,r0,0x02
	ldr r4,[pc,0x14]
	adds r0,r4,r0
	ldr r0,[r0]
	mov pc,r0
	lsrs r0,r4,0x0D
	lsls r0,r0,0x0C
	cbz r4,0x8083262
	lsrs r0,r3,0x01
	str r6,[r4,0x64]
	subs r7,0xF6
	str r6,[r4,0x64]
	str r6,[r4,0x64]
	movs r5,0x9C
	lsrs r0,r1,0x20
	movs r5,0xF6
	lsrs r0,r1,0x20
	movs r5,0xB8
	lsrs r0,r1,0x20
	movs r5,0xB0
	lsrs r0,r1,0x20
	movs r5,0xEC
	lsrs r0,r1,0x20
	movs r5,0xE6
	lsrs r0,r1,0x20
	ldrh r0,[r5,0x08]
	cmp r1,0x00
	beq 0x808321E
	b 0x808322A
	ldrh r0,[r5,0x08]
	cmp r1,0x00
	beq 0x808322A
	cmp r2,0x01
	beq 0x8083226
	adds r0,r6,r0
	b 0x8083230
	subs r0,r0,r6
	b 0x808323C
	cmp r2,0x01
	bne 0x808323A
	subs r0,r0,r6
	strh r0,[r5,0x08]
	ldrh r0,[r5,0x0A]
	adds r0,r6,r0
	strh r0,[r5,0x0A]
	b 0x8083266
	adds r0,r6,r0
	strh r0,[r5,0x08]
	ldrh r0,[r5,0x0A]
	subs r0,r0,r6
	strh r0,[r5,0x0A]
	b 0x8083266
	cmp r1,0x00
	bne 0x8083250
	b 0x8083254
	cmp r1,0x00
	bne 0x8083254
	movs r0,0x03
	eors r2,r0
	adds r5,0x02
	adds r5,0x08
	ldrh r0,[r5]
	cmp r2,0x01
	bne 0x8083262
	subs r0,r0,r3
	b 0x8083264
	adds r0,r3,r0
	strh r0,[r5]
	pop {r4,r5,r6}
	pop {r0}
	bx r0
.area 0x1C,0x00	; Limit area to 0x8083288 in J, 0x8082628 in U
.endarea
;-------------------------------------

; Check weapon hit sprite
.org 0x8083966	; 0x8082D0C in U
	bl 0x80848F4	; 0x8083C98 in U
.org 0x8083996	; 0x8082D36 in U
	bl 0x8084A14	; 0x8083DB8 in U
.org 0x80839BE	; 0x8082D5E in U
	bl 0x8084B18	; 0x8083EAC
.org 0x80839D4	; 0x8082D84 in U
	bl 0x8084C0C	; 0x8083FB0
.org 0x8083A0C	; 0x8082DAC in U
	bl 0x808487C	; 0x8083C22
.org 0x8083A34	; 0x8082DD4 in U
	bl 0x808496A	; 0x8083D0E
.org 0x8083A6A	; 0x8082E0A in U
	bl 0x8084A8A	; 0x8083E2E
.org 0x8083A90	; 0x8082E30 in U
	bl 0x8084B86	; 0x8083F2A
.org 0x8083AB8	; 0x8082E58 in U
	bl 0x8084CB6	; 0x808405A
.org 0x8083B24	; 0x8082EC4 in U
	bl 0x8084DB8	; 0x808415C
.org 0x8083B4C	; 0x8082EEC in U
	bl 0x8084DB8	; 0x808415C
.org 0x8083B74	; 0x8082F14 in U
	bl 0x8084DB8	; 0x808415C
.org 0x8083B9C	; 0x8082F3C in U
	bl 0x8084E2C	; 0x80841D0
.org 0x8083BC4	; 0x8082F64 in U
	bl 0x8084F1C	; 0x80842C0


;-------------------------------------
; Normal beam hit sprite
.org 0x808	; 0x8083BC0 in U


; Charged plasma beam hit sprite
.org 0x808	; 0x8084166 in U


; Charged wave beam hit sprite
.org 0x808	; 0x8084501 in U


; Normal missile hit sprite
.org 0x808	; 0x80846C3 in U


; Diffusion missile hit sprite
.org 0x808	; 0x8084B3F in U


; Initialize charged normal beam
.org 0x808	; 0x8084D74 in U


; Process Normal beam
.org 0x808	; 0x8084F34 in U


; Initialize bomb
.org 0x808	; 0x8085740 in U


; Initialize Power Bomb
.org 0x808	; 0x8085A0E in U


; Process charged wide beam
; Initialize wide beam
; Process wide beam
; Initialize charged plasma beam
; Process plasma beam
; Initialize charged wave beam
.org 0x808	; 0x8085F72 in U


; Initialize charged wave beam
; Process charged wave beam
; Initialize wave beam
; Process wave beam
.org 0x808	; 0x8086444 in U

; Tileset entries
.org 0x808	; 0x83BFEC4 in U

; Navigation room hatch lock events
.org 0x808	; 0x83C89C9 in U

; Elevator room pairs (?)
.org 0x808	; 0x83C8C39 in U

.org 0x808	; 0x83C8C49 in U


; Animated palette entries (?)
.org 0x808	; 0x83E3AF0 in U
.org 0x808	; 0x83E3B00 in U
.org 0x808	; 0x83E3B10 in U
.org 0x808	; 0x83E3B34 in U
.org 0x808	; 0x83E3B3C in U
.org 0x808	; 0x83E3B52 in U

; Event location and navigation info
.org 0x808	; 0x8575A8B in U
.org 0x808	; 0x8575BAB in U
.org 0x808	; 0x8575BF3 in U
.org 0x808	; 0x8575C53 in U
.org 0x808	; 0x8575CE3 in U
.org 0x808	; 0x8575D2B in U
.org 0x808	; 0x8575D4F in U
.org 0x808	; 0x8575DA3 in U

; Process projectile pointers
.org 0x808	; 0x879C27C in U


