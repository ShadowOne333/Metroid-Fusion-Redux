; Collecting missile/power bomb tanks unlocks missiles/power bombs.
; Made by biospark

; obtain missiles from missile tank
.org 0x806C9FE
    bl      AddMissiles
    b       0x806CAC2

; obtain power bombs from power bomb tank
.org 0x806CA94
    bl      AddPowerBombs
    b       0x806CAC2

.org 0x808579C ; Space that Sequence Breaking Fusion freed up in the MissileHitSprite functions, not vanilla free space.
; increase missile capacity
AddMissiles:
    ldr     r0,=NumTanksPerArea
    ldrb    r0,[r0,0x16]        ; r0 = total number of missile tanks
    ldr     r1,=Difficulty
    ldrb    r1,[r1]
    lsl     r1,r1,2
    ldr     r2,=TankIncreaseAmounts
    add     r1,r2,r1
    ldrb    r1,[r1,1]           ; r1 = increase amount
    mul     r0,r1               ; r0 = max capacity
    add     r0,0xA              ; account for 10 initial missiles
    ldr     r2,=Equipment
    ldrh    r3,[r2,6]
    add     r3,r3,r1            ; r3 = new capacity
    cmp     r0,r3
    blt     @@Return            ; if not over max capacity
    strh    r3,[r2,6]           ; store new capacity
    ldrh    r0,[r2,4]
    add     r0,r0,r1
    strh    r0,[r2,4]           ; add to current amount
    ldrb    r0,[r2,0xB]
    mov     r1,1
    orr     r0,r1
    strb    r0,[r2,0xB]         ; set missile flag
@@Return:
    bx      r14
    ;.pool

; increase power bomb capacity
AddPowerBombs:
    ldr     r0,=NumTanksPerArea
    ldrb    r0,[r0,0x17]        ; r0 = total number of power bomb tanks
    ldr     r1,=Difficulty
    ldrb    r1,[r1]
    lsl     r1,r1,2
    ldr     r2,=TankIncreaseAmounts
    add     r1,r2,r1
    ldrb    r1,[r1,2]           ; r1 = increase amount
    mul     r0,r1               ; r0 = max capacity
    add     r0,0xA              ; account for 10 initial PBs 
    ldr     r2,=Equipment
    ldrb    r3,[r2,9]
    add     r3,r3,r1            ; r3 = new capacity
    cmp     r0,r3
    blt     @@Return            ; if not over max capacity
    strb    r3,[r2,9]           ; store new capacity
    ldrb    r0,[r2,8]
    add     r0,r0,r1
    strb    r0,[r2,8]           ; add to current amount
    ldrb    r0,[r2,0xB]
    mov     r1,0x20
    orr     r0,r1
    strb    r0,[r2,0xB]         ; set power bomb flag
@@Return:
    bx      r14
    .pool
