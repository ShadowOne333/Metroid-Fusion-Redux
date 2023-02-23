; Pending: Port to MF_J

;0300129C -> 082D6046 (left) 082D6060 (right) is gfx pointer to new samus

.org 0800B87Eh
	mov	r15,r1

.org 0800B8DCh
	.word aimhang

.org 0x0879ED00
aimhang:
	ldr		r1,=300129Ch
	ldr		r0,[r6,8h]
	str     r0,[r1]
	ldr		r3,[r6]
	push    r2
	push	r1

	ldr		r1,=082D6060h
	cmp		r1,r0
	beq		@@continue
	ldr		r1,=082D6046h
	cmp		r1,r0
	bne		@@return
@@continue:
	ldr		r2,=03001256h
	ldrb	r1,[r2]
	mov		r0,30h
	eor		r0,r1
	strb	r0,[r2]
	ldr		r1,=3001245h
	mov		r0,27h
	strb	r0,[r1]
@@return:

	pop		r1
	pop		r2
	ldr		r0,=0800B884h
	mov		r15,r0
.pool
