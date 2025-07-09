; Horizontal speed doesn't get reset to 0 every time Samus lands on a surface. Ie: you hit the ground running, and maintain speed boost after jumping and landing, like in project base, however it does reset the speed boost counter.
;.gba
;.open "Metroid Fusion.gba",0x8000000

.definelabel SamusData,0x03001278	; 0x03001244
.definelabel SamusDataCopy,0x030012A4	; 0x03001270
.definelabel ShinesparkTimer,0x0300130C	; 0x030012D8

.org 0x8004DC4	;.org 0x8004D60
	ldr	r0,=KeepSpeed ; =87F1460h	; r0,=879F370h
	mov	r15,r0
.pool

; Move to free space for MF_J
.org 0x87F3400	;0x87F1460	; 879F370 in MF_U
KeepSpeed:
	push    r4,r5,r14        ;
	ldr     r2,=SamusData     ;
	ldr     r0,=SamusDataCopy     ;
	mov     r1,r2            ;
	ldmia   [r1]!,r3-r5      ;
	stmia   [r0]!,r3-r5      ;
	ldmia   [r1]!,r3-r5      ;
	stmia   [r0]!,r3-r5      ;
	ldmia   [r1]!,r3-r5      ;
	stmia   [r0]!,r3-r5      ;
	ldmia   [r1]!,r3,r4      ;
	stmia   [r0]!,r3,r4      ;       Original Code (copies Changedpose to currentpose)
	ldrb    r0,[r2,2h]       ;
	cmp     r0,0h            ;
	beq     LCheck           ; If TurningFlag == 0
	ldrh    r0,[r2,12h]      ;
	mov     r1,30h           ;  Direction   10        Right
	eor     r0,r1            ;              20        Left"
	mov     r1,0h            ;
	strh    r0,[r2,12h]      ;  Change SamusDirection
	strb    r1,[r2,2h]       ;	Set TurningFlag == 0

LCheck:
    mov     r0,r2            ;
    sub     r0,5Ch           ;
    ldrh    r0,[r0]          ; r0 = button input
    mov     r1,20h           ;
    lsl     r1,r1,4h         ;
    and     r1,r0            ; if L Is not pressed
    cmp     r1,0h            ;
    beq     DontKeepSpeed      ;
    mov     r0,r2            ;;L is pressed
    add     r0,7h            ;
    ldrb    r0,[r0,8h]       ; load Speedboost/knockback Counter
    mov     r1,50h           ; 
    lsl     r1,r1,1h         ;
    cmp     r0,r1            ;
    blt     ContinueLPressed ; if SpeedboostCounter<A0
    sub     r1,2h            ; 
    strb    r1,[r2,0Fh]      ; speedboostCounter = 9E
    b       ContinueLPressed ;
ContinueLPressed:
    pop     r0               ;
    push    r0               ;
    cmp     r0,0FDh          ; if r0 == FD, samus is landing
    beq     Landing          ;
    b       DontKeepSpeed    ;
Landing:
	mov	r0,r2
	sub     r0,5Ch           ;  r0 = buttonInput
	ldrh    r0,[r0]          ;
	ldrh	r1,[r2,12h]      ;  r1 = samusDirection
	and     r1,r0            ;
	cmp     r1,0h            ;
	beq     DontKeepSpeed    ;  NotHolding Direction
	mov     r0,r2            ;
	add     r0,0E0h          ; 
	ldrb    r0,[r0,5h]       ; Load Samus 3001329 SamusClip Collision Type
	cmp     r0,0h            ;
	beq     DontKeepSpeed    ; if CollisionType == Standing (0)
	mov     r0,r2            ;
	add     r0,2Dh           ;
	ldrb    r0,[r0]          ; if NextPose == 12 (getting Hurt in ball)
	cmp     r0,12h           ;
	beq     DontKeepSpeed    ;
	cmp     r0,14h           ;
	beq     DontKeepSpeed    ; if getting knocked back in ball
	cmp     r0,10h           ;
	bne     IsJumpFallMorph  ;  If Jumping/Falling in ball SP == 03
	mov     r0,0Eh           ;
	b       SetReturnValue   ; If rolling SP = 0E
IsJumpFallMorph:
	mov     r0,3h            ;
SetReturnValue:
	str     r0,[sp]          ;
	b       ContinueSet      ;

DontKeepSpeed:
	mov     r0,0h            ;
	strh    r0,[r2,1Ah]      ;
	strb    r0,[r2,6h]       ;

ContinueSet:
	mov     r0,0h            ;
	strb    r0,[r2,3h]       ; Forced Movement = 00
	strb    r0,[r2,4h]       ; Wall Jump TImer = 00
	mov	r8,r8		 ; nop
	strb    r0,[r2,7h]       ; Arm Cannon Direction = 00
	strb    r0,[r2,0Eh]      ; Arm Running animation flag = 00
	strb    r0,[r2,0Fh]      ; Speed boost counter = 00
	mov     r1,0h            ;
	strh    r0,[r2,10h]      ; wall jump direction = 00
	mov	r8,r8		 ; nop
	strh    r0,[r2,1Ch]      ; y velocity = 00
	mov     r0,r2            ; 
	add     r0,21h           ;
	strb    r1,[r0]          ; animation counter = 00
	add     r0,1h            ;
	strb    r1,[r0]          ; current animation = 00
	ldr     r0,=ShinesparkTimer     ;
	strb    r1,[r0]          ;
	strb    r1,[r0,1h]       ;
	strb    r1,[r0,2h]       ; Shinespark timer = 00
	strb    r1,[r0,3h]       ;
	pop     r4,r5            ;
	pop     r0               ;
	bx      r0               ; Return

.pool
;.close
