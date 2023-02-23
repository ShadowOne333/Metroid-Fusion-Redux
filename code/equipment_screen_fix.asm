; Gets rid of ugly spaces between items on the Equipment screen when you get items out of order. Does not use any free space.
; Written by Kazuto, Ported to [MF_J] by ShadowOne333
;.gba
;.open "Metroid Fusion.gba",0x08000000

; Code for Beams/Suits (Section always visible)
.org 0x0807F18A	; .org 0x0807E886
    ldr     r0,[sp,0x04]
    add     r0,r9
.org 0x0807F1B8	; .org 0x0807E8B4
.area 0x0807F1C8-.	; .area 0x0807E8C4-.
    mov     r3,r2
    mov     r2,0x01
    add     r9,r2
    ldr     r1,[sp,0x14]
    ldrb    r0,[r1]
    mov     r2,r8
    sub     r0,r0,r2
    mov     r2,r3
.endarea

; Code for Missiles (Section only shows w/collected item)
.org 0x0807F29E	; .org 0x0807E99A
	ldr     r0,=0x0857887E	; =0x0857617A
.org 0x0807F2A8	; .org 0x0807E9A4
	ldr     r1,=0x085848B0	; =0x0858217C
.org 0x0807F2B0	; .org 0x0807E9AC
	ldr     r0,=0x085848E7	; =0x085821B3
.org 0x0807F2DA	; .org 0x0807E9D6
	ldr     r1,=0x085848E7	; =0x085821B3
.org 0x0807F2E8	; .org 0x0807E9E4
	ldr     r0,=0x087EE558	; =0x0879BEA8
.org 0x0807F2F8	; .org 0x0807E9F4
	beq     0x0807F350	; 0x0807EA4C
	ldr     r0,[sp,0x04]
	add     r0,0x01
	str     r0,[sp,0x04]
	ldr     r3,[sp,0x14]
	ldrb    r0,[r3,0x00]
	mov     r1,r9
	sub     r0,r0,r1
	ldr     r0,=0x085848B3	; =0x0858217F
.org 0x0807F318	; .org 0x0807EA14
	ldr     r6,=0x0600C800
.org 0x0807F332	; .org 0x0807EA2E
	mov     r6,0x20
	add     r12,r6
	b       0x0807F354	; 0x0807EA50
.pool
.org 0x0807F350	; .org 0x0807EA4C
	cmp     r2,0x00
	beq     0x0807F3BC	; 0x0807EAB8

; Code for Misc (Section only shows w/collected item)
.org 0x0807F3FA	; .org 0x0807eaf6
    ldr     r0,=0x0857887E	; =0x0857617A
.org 0x0807F406	; .org 0x0807eb02
    ldr     r1,=0x085848B0	; =0x0858217C
.org 0x0807F40E	; .org 0x0807eb0a
    ldr     r3,=0x085848E7	; =0x085821B3
.org 0x0807F434	; .org 0x0807eb30
.area 0x0807F4A0-.	; .area 0x0807EB9C-.
    mov     r5,0x00
@@itemLoop:
    ldr     r1,[sp,0x08]
    add     r0,r1,r5
    lsl     r0,r0,0x05
    add     r6,r0,r7
    mov     r3,r10
    add     r0,r2,r3
    ldrb    r0,[r0]
    add     r0,0x01
    add     r0,r0,r4
    lsl     r0,r0,0x05
    ldr     r1,[sp,0x0c]
    add     r3,r0,r1
    ldr     r0,=0x087EE558	; =0x0879BEA8
    add     r0,r9
    ldr     r0,[r0]
    add     r0,r0,r4
    ldrb    r0,[r0]
    ldr     r1,[sp]
    and     r0,r1
    add     r4,0x01
    cmp     r0,0x00
    beq     @@incrementLoop
    add     r5,0x01
    str     r5,[sp,0x04]
    ldr     r1,[sp,0x10]
    push    r4
    ldr     r4,=0x085848B3	; =0x0858217F
    add     r0,r1,r4
    ldrb    r1,[r0]
    mov     r4,r12
    ldrb    r0,[r4]
    sub     r1,r1,r0
    lsl     r0,r3,0x01
    ldr     r3,=0x0600C800
    add     r4,r0,r3
    lsl     r0,r6,0x01
    add     r3,r0,r3
    add     r1,0x01
@@drawLoop:
    ldrh    r0,[r4]
    strh    r0,[r3]
    add     r4,0x02
    add     r3,0x02
    sub     r1,0x01
    cmp     r1,0x00
    bne     @@drawLoop
    pop     r4
@@incrementLoop:
    ldr     r0,=0x0857887E	; =0x0857617A
    add     r0,r8
    ldrb    r0,[r0]
    cmp     r4,r0
    blt     @@itemLoop
    b       0x0807F4A0	; 0x0807EB9C
.fill 0x0807F4A0-.	; 0x0807EB9C-.
.endarea
.org 0x0807F4A8	; .org 0x0807EBA4
    ldr     r1,=0x085848B0	; =0x0858217C
.org 0x0807F4BA	; .org 0x0807EBB6
    ldr     r0,=0x085848E7	; =0x085821B3
.org 0x0807F4C6	; .org 0x0807EBC2
    ldr     r0,=0x085848E7	; =0x085821B3
.org 0x0807F4CE	; .org 0x0807EBCA
    ldr     r3,=0x085848B3	; =0x0858217F
.org 0x0807F4FC	; .org 0x0807EBF8
.area 0x0807F514-.	; .area 0x0807EC10-.
.pool
.endarea

;.close
