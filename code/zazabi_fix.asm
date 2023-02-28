; Modifies Zazabi's AI to make it vulnerable to all Charged beams and all Missile types. Overwrites existing code in Zazabi AI.
; Written by Kazuto, Ported to [MF_J] by ShadowOne333

.org 0x08045670	; .org 0x08045418 in U
	ldr	r0,=0x03000994	; =0x03000960	; Base offset for projectiles
.org 0x0804569A	; .org 0x08045442 in U
	ldr	r0,=0x030006F0	; =0x030006BC	; Base offset for current enemy slot
.org 0x080456CA	; .org 0x08045472 in U
.area 0x08045702-.	; .area 0x080454AA-.   ; Protect code past this code block
ZazabiFix:
	b	@@missileCheck
.pool

@@missileCheck:
	ldrb	r0,[r4,0x0F]	; Projectile type
	cmp	r0,0x0E
	bhi	0x0804572C	; 0x080454D4   ; Tink
	cmp	r0,0x0A
	bcc	@@beamCheck
	cmp	r7,0x07
	beq	0x08045756	; 0x080454FE   ; Increment projectile slot
	mov	r0,0x0A
	bl	0x0808595C	; 0x08084D00   ; Sprite hit related
	mov	r2,0x08
	b	@@merge
@@beamCheck:
	cmp	r0,0x05
	bcc	0x0804572C	; 0x080454D4   ; Tink
	ldrb	r0,[r4,0x10]	; Projectile direction
	cmp	r0,0x04
	bne	0x0804572C	; 0x080454D4   ; Branch if not vertical beam
	mov	r0,0x0A
	bl	0x0808595C	; 0x08084D00
	mov	r2,0x04
@@merge:
	mov	r1,r6
	mov	r0,r5
.endarea
