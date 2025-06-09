; Sequence Breaking Fusion ported to japanese Fusion by SpineShark
; Special thanks to:
;       Kazuto for the Sequence Breaking Fusion hack
;       Yohann and Meinos Belfort for turning the IPS patch into hexdump ASM
;       Biospark for the data maps, function dumper and tank fix
;       ShadowOne333 for the partial SBF port

.include "code/Sequence Breaking Fusion/SBF_J_Labels.asm"

; [OK] means that section is fully ported (aside from undiscovered bugs)

;=====================================
; in: SamusUpdateJumpVelocity [OK]
; mid-air bomb jump tweak
;=====================================
.org 0x80092A6
    b       0x80092E0

.org 0x80092B0
    b       0x80092E0

.org 0x80092C2
    beq     0x80092E0

;=====================================
; old single wall jump tweak
;=====================================
;92bc: 16 to 0b
;.org 0x80092bc
;    .byte 0x0B

;=====================================
; new single wall jump tweak [OK]
;=====================================
.org 0x80079CA ; 0x8007952 in MF_U: 1C 21 -> 02 E0
    b       0x80079D2

;=====================================
; SA-X (NOC) waiting in door to lay Power Bomb [OK]
;=====================================
.org 0x8018B5C	; 0x80189F0 in U
	bl      0x808532C	; 0x80846D0
	cmp     r0,0x00
	beq     0x8018BE2	; 0x8018A76
	cmp     r0,0x02
	bne     0x8018B6E	; 0x8018A02
	bl      0x80853CE	; 0x8084772
	b       0x8018B72	; 0x8018A06
	bl      0x80853B8	; 0x808475C
	nop	                ; C0 46

;=====================================
; Security pad init [OK]
;=====================================
.org 0x802110c
    bl      sub_8074F86

; Security pad monitor arm extending
.org 0x802154a
    bl      sub_8074F86

;=====================================
; Core-X ability initialize [OK]
;=====================================
.org 0x80255B8	; 0x8025404 in U
sub_8025404:
    beq     @@_8025410
    cmp     r0,0x44
    beq     @@_8025420
@@_802540A:
    mov     r0,0
    strh    r0,[r5]
    b       0x8025710 ; @@_802555C ; @@return
@@_8025410:
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xC]
    mov     r0,0x40
    and     r0,r1
    cmp     r0,0
    bne     @@_802540A
    mov     r1,r12
    b       @@_802543A
@@_8025420:
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xC]
    mov     r0,1
    and     r0,r1
    cmp     r0,0
    bne     @@_802540A
    mov     r4,0x4B
    mov     r1,0x5E
    b       @@_802543A
    .pool
    nop
@@_802543A:
    push    r1,r4
    bl      CheckLockHatchesWithTimer
    pop     r1,r4
    mov     r12,r1

;=====================================
; Chozo statue initialize [OK]
;=====================================
.org 0x802D7A4	; 0x802D5E4 in U
sub_802D5E4:
    ldr     r4,=CurrSpriteData
    mov     r0,r4
    add     r0,0x26
    mov     r5,1
    strb    r5,[r0]
    ldr     r0,=Equipment
    ldrb    r0,[r0,0xA]
    mov     r3,1
    and     r3,r0
    cmp     r3,0
    beq     @@_802D608
    mov     r0,0
    strh    r0,[r4]
    b       0x802D87C ; @@_802D6BC ; @@return
    .pool
@@_802D608:
    bl      CheckLockHatchesWithTimer

.org 0x802D808	; 0x802D648 in U
	strh    r2,[r4,0x0C]

;=====================================
; Shake trigger AI [OK]
;=====================================
.org 0x8030528	; 0x8030358 in U
	;bl 0x808540A	; 0x80847AE
    bl      sub_80847AE

;=====================================
; Scientist initialize [OK]
;=====================================
.org 0x803A28C
Scientist_Init:
    push    r4,r5,r14
    ldr     r4,=CurrSpriteData
    mov     r1,r4
    add     r1,0x26
    mov     r0,1
    strb    r0,[r1]
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xA]
    mov     r5,2
    mov     r0,r5
    and     r0,r1
    cmp     r0,0
    beq     @@_803A0B0
    mov     r0,0
    strh    r0,[r4]
    b       @@_803A0FC
    .pool
@@_803A0B0:
    bl      CheckLockHatchesWithTimer
    mov     r1,r4
    add     r1,0x22
    mov     r0,0xC
    strb    r0,[r1]
    ldrh    r1,[r4]
    ldr     r0,=0xFFFB
    and     r0,r1
    mov     r1,0
    strh    r0,[r4]
    mov     r0,r4
    add     r0,0x25
    strb    r5,[r0]
    mov     r3,r4
    add     r3,0x27
    mov     r0,0x28
    strb    r0,[r3]
    mov     r0,r4
    add     r0,0x28
    strb    r1,[r0]
    add     r3,2
    mov     r0,0x10
    strb    r0,[r3]
    ldr     r0,=0xFF88
    strh    r0,[r4,0xA]
    strh    r1,[r4,0xC]
    add     r0,0x64
    strh    r0,[r4,0xE]
    mov     r0,0x14
    strh    r0,[r4,0x10]
    mov     r0,r4
    add     r0,0x24
    strb    r5,[r0]
    ldr     r0,=0x834FCF4 ; 0x834D9EC ; OAM
    str     r0,[r4,0x18]
    strb    r1,[r4,0x1C]
    strh    r1,[r4,0x16]
@@_803A0FC:
    pop     r4,r5
    pop     r0
    bx      r0
    .pool

;=====================================
; Destroyed data pad AI [OK]
;=====================================
.org 0x8043AAC	; 0x804386C in U
	bl      sub_8084798	; 0x8084798
	cmp     r0,0
	bne     0x8043AD0	; 0x8043890

;=====================================
; Nettori initialize [OK]
;=====================================
.org 0x8043F72	; 0x8043D32 in U
	beq     0x8043F80
	ldr     r1,[pc,0x124]
.org 0x8043F80	; 0x8043D40 in U
	bl      CheckLockHatchesWithTimer ; 0x8063DE8

;=====================================
; Check projectile hit Zazabi [OK]
;=====================================
; Use existing Zazabi fix

;=====================================
; Serris initialize [OK]
;=====================================
.org 0x8047A9A	; 0x804782E in U
	beq     0x8047AA8	; 0x804783C
	ldr     r1,[pc,0x154]
.org 0x8047AA8	; 0x804783C in U
	bl      CheckLockHatchesWithTimer ; 0x8063DE8

;=====================================
; VariaSuitAbilityInit [OK]
;=====================================
.org 0x805794C	; 0x8057574 in U
	beq     0x805795C	; 0x8057584
	ldr     r1,[pc,0x128]
.org 0x805795C	; 0x8057584 in U
	bl      CheckLockHatchesWithTimer ; 0x8063DE8

;=====================================
; Ridley (pre-spawn) initialize [OK]
;=====================================
.org 0x805BA52	; 0x805B5A2 in U
	beq     0x805BA60	; 0x805B5B0
	ldr     r1,[pc,0x5C]
.org 0x805BA60	; 0x805B5B0 in U
	bl      CheckLockHatchesWithTimer ; 0x8063DE8

;=====================================
; Yakuza initialize [OK]
;=====================================
.org 0x805C286	; 0x805BDC6 in U
	beq     0x805C294	; 0x805BDD4
	ldr     r1,[pc,0xE0]
.org 0x805C294	; 0x805BDD4 in U
	bl      CheckLockHatchesWithTimer ; 0x8063DE8

;=====================================
; Nightmare initialize [OK]
;=====================================
.org 0x805E2C2	; 0x805DDE2 in U
	beq     0x805E2D0	; 0x805DDF0
	ldr     r1,[pc,0x1C8]
.org 0x805E2D0	; 0x805DDF0 in U
	bl      CheckLockHatchesWithTimer ; 0x8063DE8

;=====================================
; Check advance event [OK]
;=====================================
.org 0x8060F7C	; 0x8060940 in U
    .fill 0x214, 0x0    ; zero out original function

.org 0x8060F7C	; 0x8060940 in U
CheckAdvanceEvent:
    push    r4-r7,r14
    lsl     r0,r0,0x18
    lsr     r2,r0,0x18
    ldr     r1,=EventData_8084B0E ; 0x8084B0E
@@_8060948:
    ldrb    r0,[r1]
    cmp     r0,r2
    beq     @@_8060964
    bgt     @@_806096A
    add     r1,1
    b       @@_8060948
@@_8060954:
    mov     r0,0x10
    b       @@_806095A
@@_8060958:
    mov     r0,0x20
@@_806095A:
    ldr     r1,=Equipment
    ldrb    r1,[r1,0xC]
    and     r0,r1
    beq     @@_8060996
    b       @@_8060992
@@_8060964:
    ldr     r1,=DoorUnlockTimer
    mov     r0,0x3C
    strb    r0,[r1]
@@_806096A:
    push    r2
    mov     r0,r2
    bl      SetEvent
    pop     r2
    cmp     r2,0x66
    bge     @@_8060996
    cmp     r2,0x26
    beq     @@_8060996
    cmp     r2,0x31
    beq     @@_8060996
    cmp     r2,0x32
    beq     @@_8060996
    cmp     r2,0x33
    beq     @@_8060954
    cmp     r2,0x51
    beq     @@_8060958
    sub     r2,0x5B
    cmp     r2,5
    bcc     @@_8060996
@@_8060992:
    bl      sub_806099C ; 0x806099C in U
@@_8060996:
    pop     r4-r7
    pop     r1
    bx      r1

sub_806099C:
    push    r4,r14
    mov     r0,0x6D
    mov     r1,0xA
    ldr     r2,=EventData_8084B1E ; 0x8084B1E
    bl      sub_8060A8A ; 0x8060A8A
    mov     r1,0xB
    ldr     r2,=EventData_8084B26 ; 0x8084B26
    bl      sub_8060A8A ; 0x8060A8A
    mov     r1,0xC
    ldr     r2,=EventData_8084B2E ; 0x8084B2E
    bl      sub_8060A8A ; 0x8060A8A
    ldr     r5,=SecurityHatchFlashLevelBackup
    ldrb    r2,[r5]
    cmp     r2,0xFF
    bne     @@_80609C4
    ldr     r3,=Equipment
    ldrb    r2,[r3,0xD]
@@_80609C4:
    ldr     r5,=EventData_8084B36 ; 0x8084B36
    add     r2,1
    lsl     r2,r2,0x18
    lsr     r2,r2,0x18
    ldrb    r1,[r5,r2]
    cmp     r1,r0
    bcs     @@_80609D4
    mov     r0,r1
@@_80609D4:
    ldr     r2,=EventData_80848F8 ; 0x80848F8
@@_80609D6:
    ldrb    r1,[r2,2]
    cmp     r0,r1
    beq     @@_80609E2
    blt     @@_80609EE
@@_80609DE:
    add     r2,4
    b       @@_80609D6
@@_80609E2:
    ;ldr     r4,=RebootGameFlag ;\ load area and room ID (MF_U)
    ;ldrh    r4,[r4,0xC]        ;/
    ldr     r4,=AreaID ;\ load area and room ID (MF_J)
    ldrh    r4,[r4]    ;/
    ldrh    r1,[r2]
    cmp     r1,r4
    bne     @@_80609DE
    ldrb    r0,[r2,3]
@@_80609EE:
    ldr     r4,=EventCounter
    ldrb    r2,[r4]
    cmp     r2,0x3C
    beq     @@_8060A50
    cmp     r0,0x3A
    beq     @@_8060A5C
    cmp     r2,0x3A
    beq     @@_8060A6E
    cmp     r0,0xF
    beq     @@_8060A76
    cmp     r0,0x4A
    bne     @@_8060A12
    ;ldr     r2,=RebootGameFlag ;\ load AreaID (MF_U)
    ;ldrb    r2,[r2,0xC]        ;/
    ldr     r2,=AreaID ;\ load AreaID (MF_J)
    ldrb    r2,[r2]    ;/
    cmp     r2,0
    beq     @@_8060A12
    mov     r0,0x44
    b       @@_8060A82
@@_8060A12:
    cmp     r0,0x46
    bcc     @@_8060A82
    cmp     r0,0x4E
    bcs     @@_8060A38
    ldr     r3,=Equipment
    ldrb    r2,[r3,0xA]
    mov     r1,4
    and     r1,r2
    cmp     r1,4
    beq     @@_8060A82
    ldrb    r1,[r3,0xD]
    cmp     r1,0xFF
    beq     @@_8060A82
    push    r0
    mov     r0,0x46
    bl      SetEvent
    pop     r0
    b       @@_8060A82
@@_8060A38:
    ldr     r2,=SecurityHatchFlashLevelBackup
    ldrb    r1,[r2]
    cmp     r1,0xFF
    beq     @@_8060A82
    ldr     r3,=Equipment
    strb    r1,[r3,0xD]
    mov     r1,0xFF
    strb    r1,[r2]
    ldr     r2,=CurrEventBasedEffect
    mov     r1,2
    strb    r1,[r2]
    b       @@_8060A82
@@_8060A50:
    cmp     r0,0x3D
    beq     @@_8060A84
    ldr     r3,=DoorUnlockTimer
    mov     r2,0x3C
    strb    r2,[r3]
    b       @@_8060A82
@@_8060A5C:
    cmp     r2,0x3B
    beq     @@_8060A84
    ldr     r3,=SubEventCounter
    mov     r2,0x4D
    strb    r2,[r3]
    ldr     r2,=MusicInfo_Unk21 ; 0x30019F1 in MF_U
    mov     r1,0
    strb    r1,[r2]
    b       @@_8060A82
@@_8060A6E:
    ldr     r3,=SubEventCounter
    mov     r2,0x53
    strb    r2,[r3]
    b       @@_8060A82
@@_8060A76:
    ldr     r3,=AtmosphericStabilizersOnline
    ldrb    r3,[r3]
    cmp     r3,0x1F
    blt     @@_8060A82
    add     r0,1
    b       @@_8060A82
@@_8060A82:
    strb    r0,[r4]
@@_8060A84:
    pop     r4
    pop     r1
    bx      r1

sub_8060A8A:
    push    r0,r14
    mov     r0,0xFF
    ldr     r3,=Equipment
    add     r3,r1,r3
    mov     r4,0x80
    add     r5,r2,7
@@_8060A96:
    ldrb    r2,[r3]
    and     r2,r4
    cmp     r2,0
    bne     @@_8060AA6
    ldrb    r1,[r5]
    cmp     r1,r0
    bcs     @@_8060AA6
    mov     r0,r1
@@_8060AA6:
    sub     r5,1
    lsr     r4,r4,1
    cmp     r4,0
    bgt     @@_8060A96
    pop     r1
    cmp     r1,r0
    bcs     @@_8060AB6
    mov     r0,r1
@@_8060AB6:
    pop     r1
    bx      r1
    .pool

;=====================================
; Check on event Escaped NOC SA-X [OK]
;=====================================
.org 0x80612CE	; 0x8060C92 in U
	mov     r1,1
.org 0x80612D6	; 0x8060C9A in U
	bgt     0x80612DA	; 0x8060C9E
	mov     r1,0

;=====================================
; Check on event NOC 1 nav conversation [OK]
;=====================================
.org 0x8061336	; 0x8060CFA in U
	bgt     0x806133A

;=====================================
; Check on event meltdown [OK]
;=====================================
.org 0x806149A	; 0x8060E5E in U
	bgt     0x80614A4

;=====================================
; Fix recovering suit cutscene [OK]
;=====================================
.org 0x80647E2	; 0x80641DE in U
	lsl     r3,r5,0x03
	add     r3,r3,r1
	ldrb    r1,[r2,0x0C]
	ldrb    r3,[r3,0x02]
	bl      RecoveringSuitCutsceneFix ; 0x808531E	; 0x80846C2

;=====================================
; Load room entry [OK]
;=====================================
.org 0x8064E34	; 0x8064830 in U
	b       0x8064F6C	; 0x8064968
.org 0x8064F54	; 0x8064950 in U
	bl      0x80854E4	; 0x8084888
	cmp     r0,0x00
	beq     0x8064F6C	; 0x8064968
	ldrb    r0,[r5,0x01]
	cmp     r0,0x44
	bne     0x8064F6C	; 0x8064968
	ldr     r1,[pc,0x14]
	mov     r0,0x80
	lsl     r0,r0,0x08
	strh    r0,[r1]
	strh    r0,[r1,0x02]
	add     sp,0x3C
	pop     {r4,r5}
	pop     {r0}
	bx      r0

;=====================================
; CheckEnterDoor [OK]
;=====================================
.org 0x80697A8
CheckEnterDoor:
    push    r4-r7,r14
    mov     r7,r9
    mov     r6,r8
    push    r6,r7
    mov     r2,r0
    lsl     r2,r2,0x10
    lsr     r7,r2,0x10
    lsl     r1,r1,0x10
    lsr     r3,r1,0x10
    mov     r6,0
    ldr     r1,=SubGameMode1
    mov     r4,0
    ldsh    r2,[r1,r4]
    mov     r12,r1
    cmp     r2,2
    beq     @@_80691A6
    b       @@_806936E
@@_80691A6:
    ldr     r1,=AreaDoorsPtrs
    ldr     r0,=AreaID
    ldrb    r0,[r0]
    lsl     r0,r0,2
    add     r0,r0,r1
    ldr     r4,[r0]
    mov     r5,0
    ldrb    r2,[r4]
    cmp     r2,0
    bne     @@_80691BC
    b       @@_806936C
@@_80691BC:
    ldr     r0,=PrevDoor
    mov     r8,r0
    ldr     r1,=SamusDoorPositionOffset
    mov     r9,r1
@@_80691C4:
    ldr     r1,=AreaID
    ldrb    r0,[r4,1]
    ldrb    r1,[r1,1]
    cmp     r0,r1
    beq     @@_80691D0
    b       @@_8069360
@@_80691D0:
    mov     r0,0xF
    and     r0,r2
    cmp     r0,1
    bhi     @@_80691DA
    b       @@_8069360
@@_80691DA:
    ldrb    r0,[r4,2]
    cmp     r0,r3
    bls     @@_80691E2
    b       @@_8069360
@@_80691E2:
    ldrb    r0,[r4,3]
    cmp     r3,r0
    bls     @@_80691EA
    b       @@_8069360
@@_80691EA:
    ldrb    r0,[r4,4]
    cmp     r0,r7
    bls     @@_80691F2
    b       @@_8069360
@@_80691F2:
    ldrb    r1,[r4,5]
    cmp     r7,r1
    bls     @@_80691FA
    b       @@_8069360
@@_80691FA:
    ldr     r1,=DoorPositionStart
    mov     r0,0
    strh    r0,[r1]
    strh    r0,[r1,2]
    bl      sub_8084844 ; 0x8084844
    ldrb    r1,[r4]
    mov     r0,0x20
    and     r0,r1
    cmp     r0,0
    beq     @@_8069220
    lsl     r0,r5,0x18
    lsr     r0,r0,0x18
    bl      FindEventBasedDoor
    ldr     r1,=SubGameMode1
    mov     r12,r1
    cmp     r0,0xFF
    bne     @@_8069252
@@_8069220:
    bl      sub_80847F0    ; 0x80847F0
    cmp     r0,0xFF
    bne     @@_8069252
    b       @@_8069250
    .pool
    lsl     r0,r0,0
    lsl     r0,r0,0
    lsl     r0,r0,0
    lsl     r0,r0,0
    lsl     r0,r0,0
    lsl     r0,r0,0
@@_8069250:
    ldrb    r0,[r4,6]
@@_8069252:
    mov     r1,r8
    strb    r0,[r1]
    mov     r0,3
    mov     r1,r12
    strh    r0,[r1]
    ldrb    r1,[r4]
    mov     r0,0xF
    and     r0,r1
    cmp     r0,2
    bls     @@_806929C
    ldrb    r1,[r4,2]
    ldr     r0,=BG1XPosition
    ldrh    r0,[r0]
    lsr     r0,r0,6
    add     r0,8
    ldr     r2,=DoorPositionStart
    cmp     r1,r0
    ble     @@_806927A
    mov     r0,1
    strh    r0,[r2]
@@_806927A:
    ldrb    r0,[r4,4]
    strh    r0,[r2,2]
    ldrb    r0,[r4,5]
    add     r0,1
    lsl     r0,r0,6
    ldr     r1,=SamusData
    ldrh    r1,[r1,0x18]
    sub     r0,r0,r1
    sub     r0,1
    b       @@_806929E
    .pool
@@_806929C:
    mov     r0,0
@@_806929E:
    mov     r1,r9
    strh    r0,[r1]
    ldrb    r0,[r4]
    bl      ProcessDoorType
    ldr     r2,=HatchData
    mov     r5,5
@@_80692AC:
    ldrb    r0,[r2,1]
    mov     r1,7
    and     r1,r0
    strb    r1,[r2,1]
    ldrb    r3,[r2]
    lsl     r0,r3,0x1F
    cmp     r0,0
    beq     @@_80692E8
    lsl     r0,r3,0x1B
    mov     r6,1
    cmp     r0,0
    bge     @@_80692C6
    sub     r6,2
@@_80692C6:
    ldrb    r0,[r2,2]
    add     r6,r6,r0
    ldrb    r0,[r4,2]
    cmp     r6,r0
    bne     @@_80692E8
    ldrb    r0,[r4,4]
    ldrb    r1,[r2,3]
    cmp     r0,r1
    bcc     @@_80692E8
    mov     r1,r0
    ldrb    r0,[r2,3]
    add     r0,3
    cmp     r1,r0
    bgt     @@_80692E8
    mov     r0,0xE
    orr     r0,r3
    strb    r0,[r2]
@@_80692E8:
    add     r2,4
    sub     r5,1
    cmp     r5,0
    bge     @@_80692AC
    mov     r6,1
    ldr     r1,=AreaDoorsPtrs
    ldr     r0,=AreaID
    ldrb    r0,[r0]
    lsl     r0,r0,2
    add     r0,r0,r1
    ldr     r4,[r0]
    mov     r0,r8
    ldrb    r1,[r0]
    lsl     r0,r1,1
    add     r0,r0,r1
    lsl     r0,r0,2
    add     r4,r4,r0
    ldrb    r0,[r4,1]
    bl      CheckPlayCutsceneDuringTransition
    mov     r5,r0
    cmp     r5,0
    beq     @@_8069348
    ldr     r1,=ColorFading
    mov     r0,2
    strb    r0,[r1]
    cmp     r5,2
    bne     @@_8069340
    ldr     r1,=SubGameMode1
    mov     r0,4
    strh    r0,[r1]
    mov     r6,0
    b       @@_8069348
    .pool
@@_8069340:
    cmp     r5,3
    bne     @@_8069348
    mov     r0,0xA
    strb    r0,[r1]
@@_8069348:
    ldrb    r0,[r4,1]
    bl      SetCurrNavRoom
    ldr     r0,=AreaID
    ldrb    r0,[r0]
    ldrb    r1,[r4,1]
    bl      PlayRoomMusicTrack
    b       @@_806936C
    .pool
@@_8069360:
    add     r4,0xC
    add     r5,1
    ldrb    r2,[r4]
    cmp     r2,0
    beq     @@_806936C
    b       @@_80691C4
@@_806936C:
    mov     r0,r6
@@_806936E:
    pop     r3,r4
    mov     r8,r3
    mov     r9,r4
    pop     r4-r7
    pop     r1
    bx      r1

;=====================================
; CheckTouchingTransitionOrTank [OK]
;=====================================
; Biospark already made a fix for this, so I'll use that instead.

;=====================================
; Check update sub-event and music [OK]
;=====================================
.org 0x80709D0	; 0x8070324 in U
; 0x8070D94 in U, changed to 0x8070D9C
	.dw 0x8071448	; 0x8071440 in J

.org 0x80713F2	; 0x8070D46 in U
sub_8070D46:
    mov     r0,2
    b       @@_8070D4C
    mov     r0,0
@@_8070D4C:
    cmp     r3,1
    bne     @@_8070D68
    ldr     r1,=DestinationRoom
    ldrb    r1,[r1]
    cmp     r0,r1
    beq     @@_8070D60
    ldr     r1,=MusicSlotSwitch     ;0x30019F0 in U
    ldrb    r0,[r1]
    cmp     r0,0
    beq     @@_8070D7C
@@_8070D60:
    mov     r0,0x46
    bl      FadeOutMusic
    b       @@_8070D7C
@@_8070D68:
    cmp     r3,2
    bne     @@_8070D7C
    ldrb    r1,[r2,1]
    cmp     r0,r1
    bne     @@_8070D7C
    mov     r0,0x5A
    mov     r1,0xB
    bl      PlayMusic
    mov     r5,1
@@_8070D7C:
    cmp     r5,0
    bne     @@_8070D84
    bl      0x8071C36       ; @@_807158A in U
@@_8070D84:
    ldr     r0,=0x2CF
    bl      MusicRelated_3CD4
    bl      0x8071C36       ; @@_807158A in U
    .pool
    bl      MusicRelated_3CFC
    bl      0x8071C34       ; @@_8071588 in U
    .dh  0       ;lsl     r0,r0,0
    .dh  0       ;lsl     r0,r0,0
    .dh  0       ;lsl     r0,r0,0
    .dh  0       ;lsl     r0,r0,0

;=====================================
; CheckOrDownloadDataItem and CheckOrUnlockSecurityLevel [OK]
;=====================================
;                   in MF_U:  | in MF_J:
; CopiedTo203800C = 0x3000010 | 0x3000012
;   Ability count = 0x300001B | 0x300001F
;         Area ID = 0x300002C | 0x3000032

.org 0x80756BC	; 0x8074F30 in U
    .fill 0xCC, 0x0

.org 0x80756BC	; 0x8074F30 in U
CheckOrDownloadDataItem:
    push    r4,r5,r14
    lsl     r0,r0,0x18
    lsr     r3,r0,0x18
    ;ldr     r1,=CopiedTo203800C ;\
    ;ldrh    r1,[r1,0x1C]        ;/ load area ID (MF_U)
    ldr     r1,=AreaID    ;\
    ldrh    r1,[r1]       ;/ load area ID (MF_J)
    ldr     r2,=EventData_8084AAE ; 0x8084AAE
    ldrb    r4,[r2,2]
    ldr     r5,=BeamStatus ;0x300131A in U ; beam status
@@_8074F40:
    ldrh    r0,[r2]
    cmp     r0,r1
    bne     @@_8074F6E
    ldrb    r0,[r5]
    and     r0,r4
    bne     @@_8074F6E
    ldrb    r0,[r2,3]
    cmp     r0,0x42
    bne     @@_8074F62
    ldr     r5,=EventCounter
    ldrb    r4,[r5]
    cmp     r4,0x41
    beq     @@_8074F62
    ;ldr     r5,=CopiedTo203800C ;\
    ;ldrb    r4,[r5,0xB]         ;/ load ability count (MF_U)
    ldr     r5,=AbilityCount    ;\
    ldrb    r4,[r5]             ;/ load ability count (MF_J)
    cmp     r4,9
    beq     @@_8074F7E
@@_8074F62:
    cmp     r3,0
    beq     @@_8074F6A
    bl      CheckAdvanceEvent
@@_8074F6A:
    mov     r0,1
    b       @@_8074F80
@@_8074F6E:
    add     r2,4
    ldrb    r0,[r2,2]
    cmp     r0,r4
    bgt     @@_8074F78
    add     r5,1
@@_8074F78:
    mov     r4,r0
    cmp     r0,0
    bne     @@_8074F40
@@_8074F7E:
    mov     r0,0
@@_8074F80:
    pop     r4,r5
    pop     r1
    bx      r1

sub_8074F86:
    push    r4-r7,r14
    lsl     r0,r0,0x18
    lsr     r7,r0,0x18
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xD]
    add     r4,1
    lsl     r4,r4,0x18
    lsr     r4,r4,0x18
    ;ldr     r1,=CopiedTo203800C ;\
    ;ldrb    r1,[r1,0x1C]        ;/ load area ID (MF_U)
    ldr     r1,=AreaID    ;\
    ldrb    r1,[r1]       ;/ load area ID (MF_J)
    ldr     r2,=SecurityUnlockEvents
    mov     r3,0
@@_8074F9E:
    ldrb    r0,[r2,1]
    cmp     r1,r0
    beq     @@_8074FAE
    add     r3,1
    add     r2,8
    cmp     r3,4
    blt     @@_8074F9E
    b       @@_8074FD0
@@_8074FAE:
    ldrb    r0,[r2]
    cmp     r4,r0
    bgt     @@_8074FD0
    mov     r0,r7
    cmp     r0,0
    beq     @@_8074FCC
    ;ldr     r1,=CopiedTo203800C
    ldr     r1,=AbilityCount
    mov     r0,0
    ;strb    r0,[r1,0xB] ; store to ability count (MF_U)
    strb    r0,[r1]
    ldrb    r0,[r2,3]
    bl      CheckAdvanceEvent
    mov     r0,2
    bl      SetCurrEventBasedEffect
@@_8074FCC:
    mov     r0,1
    b       @@_8074FD2
@@_8074FD0:
    mov     r0,0
@@_8074FD2:
    pop     r4-r7
    pop     r1
    bx      r1
    .pool

;=====================================
; Display message [OK]
;=====================================
.org 0x807A100	; 0x807992C in U
    .word   AbilityCount
    .word   EventData_8084AFA

;=====================================
; StatusScreenDrawBeamOrSuit [OK]
;=====================================
.org 0x807F18A	; 0x807E886 in U
	ldr     r0,[sp,4]
	add     r0,r9       ; changed sb to r9
.org 0x807F1B8	; 0x807E8B4 in U
	add     r3,r2,0
	mov     r2,1
	add     r9,r2       ; changed sb to r9
	ldr     r1,[sp,0x14]
	ldrb    r0,[r1]
	mov     r2,r8
	sub     r0,r0,r2
	add     r2,r3,0

;=====================================
; StatusScreenDrawMissileOrBomb: 7e99a in U [OK]
;=====================================
.org 0x807F280
StatusScreenDrawMissileOrBomb:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    add     sp,-0x18
    lsl     r0,r0,0x18
    lsr     r7,r0,0x18
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    str     r1,[sp]
    mov     r0,1
    neg     r0,r0
    str     r0,[sp,4]
    mov     r2,0
    ldr     r0,=0x857887E ; 0x857617A
    add     r1,r7,r0
    ldrb    r1,[r1]
    cmp     r2,r1
    bge     @@_807EA5C
    ldr     r1,=0x85848B0 ; 0x858217C
    lsl     r3,r7,2
    mov     r10,r3
    add     r5,r3,r7
    ldr     r0,=0x85848E7 ; 0x85821B3
    add     r0,2
    add     r0,r5,r0
    ldrb    r0,[r0]
    str     r0,[sp,8]
    add     r0,r1,3
    add     r0,r5,r0
    str     r0,[sp,0x14]
    add     r0,r5,r1
    ldrb    r0,[r0]
    add     r1,2
    add     r1,r5,r1
    ldrb    r6,[r1]
    mov     r9,r6
    str     r5,[sp,0xC]
    str     r1,[sp,0x10]
    lsl     r0,r0,5
    mov     r12,r0
@@_807E9D0:
    mov     r0,r12
    add     r0,r9
    mov     r8,r0
    ldr     r1,=0x85848E7 ; 0x85821B3
    add     r0,r5,r1
    ldrb    r0,[r0]
    add     r0,r0,r2
    lsl     r0,r0,5
    ldr     r3,[sp,8]
    add     r6,r0,r3
    ldr     r0,=0x87EE558 ; 0x879BEA8
    add     r0,r10
    ldr     r0,[r0]
    add     r0,r0,r2
    ldrb    r0,[r0]
    ldr     r1,[sp]
    and     r0,r1
    cmp     r0,0
    beq     @@_807EA4C
    ldr     r0,[sp,4]
    add     r0,1
    str     r0,[sp,4]
    ldr     r3,[sp,0x14]
    ldrb    r0,[r3]
    mov     r1,r9
    sub     r0,r0,r1
    ldr     r0,=0x85848B3 ; 0x858217F
    ldr     r3,[sp,0xC]
    add     r0,r3,r0
    ldrb    r1,[r0]
    ldr     r3,[sp,0x10]
    ldrb    r0,[r3]
    sub     r1,r1,r0
    lsl     r0,r6,1
    ldr     r6,=0x600C800
    add     r4,r0,r6
    mov     r3,r8
    lsl     r0,r3,1
    add     r3,r0,r6
    add     r1,1
@@_807EA20:
    ldrh    r0,[r4]
    strh    r0,[r3]
    add     r4,2
    add     r3,2
    sub     r1,1
    cmp     r1,0
    bne     @@_807EA20
    mov     r6,0x20
    add     r12,r6
    b       @@_807EA50
    .pool
@@_807EA4C:
    cmp     r2,0
    beq     @@_807EAB8
@@_807EA50:
    add     r2,1
    ldr     r1,=0x857887E ; 0x857617A
    add     r0,r7,r1
    ldrb    r0,[r0]
    cmp     r2,r0
    blt     @@_807E9D0
@@_807EA5C:
    ldr     r2,[sp,4]
    cmp     r2,0
    blt     @@_807EAB8
    ldr     r3,=0x85848B0 ; 0x858217C
    lsl     r2,r7,2
    add     r2,r2,r7
    add     r0,r2,r3
    ldr     r1,[sp,4]
    add     r1,1
    ldrb    r0,[r0]
    add     r1,r1,r0
    lsl     r1,r1,5
    add     r0,r3,2
    add     r0,r2,r0
    ldrb    r4,[r0]
    add     r1,r1,r4
    mov     r8,r1
    ldr     r1,=0x85848E7 ; 0x85821B3
    add     r0,r1,1
    add     r0,r2,r0
    ldrb    r0,[r0]
    add     r1,2
    add     r1,r2,r1
    lsl     r0,r0,5
    ldrb    r1,[r1]
    add     r6,r0,r1
    add     r3,3
    add     r2,r2,r3
    ldrb    r0,[r2]
    sub     r1,r0,r4
    cmp     r1,0
    blt     @@_807EAB8
    lsl     r0,r6,1
    ldr     r3,=0x600C800
    add     r4,r0,r3
    mov     r6,r8
    lsl     r0,r6,1
    add     r3,r0,r3
    add     r1,1
@@_807EAAA:
    ldrh    r0,[r4]
    strh    r0,[r3]
    add     r4,2
    add     r3,2
    sub     r1,1
    cmp     r1,0
    bne     @@_807EAAA
@@_807EAB8:
    add     sp,0x18
    pop     r3-r5
    mov     r8,r3
    mov     r9,r4
    mov     r10,r5
    pop     r4-r7
    pop     r0
    bx      r0
    .pool

;=====================================
; StatusScreenDrawMisc: [OK]
;=====================================
.org 0x807F3DC
StatusScreenDrawMisc:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    add     sp,-0x24
    lsl     r0,r0,0x18
    lsr     r0,r0,0x18
    mov     r8,r0
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    str     r1,[sp]
    mov     r0,0
    str     r0,[sp,4]
    mov     r4,0
    ldr     r0,=0x857887E ; 0x857617A
    mov     r2,r8
    add     r1,r2,r0
    ldrb    r1,[r1]
    cmp     r4,r1
    bge     @@_807EB9C
    ldr     r1,=0x85848B0 ; 0x858217C
    lsl     r2,r2,2
    mov     r9,r2
    add     r2,r8
    ldr     r3,=0x85848E7 ; 0x85821B3
    mov     r10,r3
    mov     r0,r10
    add     r0,2
    add     r0,r2,r0
    ldrb    r0,[r0]
    str     r0,[sp,0xC]
    add     r0,r1,3
    add     r6,r2,r0
    str     r6,[sp,0x1C]
    add     r0,r2,r1
    ldrb    r0,[r0]
    add     r0,1
    str     r0,[sp,8]
    add     r1,2
    add     r1,r2,r1
    ldrb    r7,[r1]
    str     r2,[sp,0x10]
    mov     r12,r1
    mov     r5,0
@@_807EB32:
    ldr     r1,[sp,8]
    add     r0,r1,r5
    lsl     r0,r0,5
    add     r6,r0,r7
    mov     r3,r10
    add     r0,r2,r3
    ldrb    r0,[r0]
    add     r0,1
    add     r0,r0,r4
    lsl     r0,r0,5
    ldr     r1,[sp,0xC]
    add     r3,r0,r1
    ldr     r0,=0x87EE558 ; 0x879BEA8
    add     r0,r9
    ldr     r0,[r0]
    add     r0,r0,r4
    ldrb    r0,[r0]
    ldr     r1,[sp]
    and     r0,r1
    add     r4,1
    cmp     r0,0
    beq     @@_807EB8E
    add     r5,1
    str     r5,[sp,4]
    ldr     r1,[sp,0x10]
    push    r4
    ldr     r4,=0x85848B3 ; 0x858217F
    add     r0,r1,r4
    ldrb    r1,[r0]
    mov     r4,r12
    ldrb    r0,[r4]
    sub     r1,r1,r0
    lsl     r0,r3,1
    ldr     r3,=0x600C800
    add     r4,r0,r3
    lsl     r0,r6,1
    add     r3,r0,r3
    add     r1,1
@@_807EB7E:
    ldrh    r0,[r4]
    strh    r0,[r3]
    add     r4,2
    add     r3,2
    sub     r1,1
    cmp     r1,0
    bne     @@_807EB7E
    pop     r4
@@_807EB8E:
    ldr     r0,=0x857887E ; 0x857617A
    add     r0,r8
    ldrb    r0,[r0]
    cmp     r4,r0
    blt     @@_807EB32
    b       @@_807EB9C
    lsl     r0,r0,0
@@_807EB9C:
    ldr     r4,[sp,4]
    cmp     r4,0
    beq     @@_807EC6C
    mov     r4,0
    ldr     r1,=0x85848B0 ; 0x858217C
    mov     r6,r8
    lsl     r6,r6,2
    str     r6,[sp,0x14]
    mov     r7,r6
    add     r7,r8
    add     r2,r1,2
    add     r0,r7,r2
    mov     r12,r0
    ldr     r0,=0x85848E7 ; 0x85821B3
    add     r0,2
    add     r0,r0,r7
    mov     r10,r0
    add     r2,r7,r1
    mov     r9,r2
    ldr     r0,=0x85848E7 ; 0x85821B3
    add     r0,1
    add     r0,r7,r0
    str     r0,[sp,0x18]
    ldr     r3,=0x85848B3 ; 0x858217F
    add     r3,r7,r3
    str     r3,[sp,0x20]
@@_807EBD0:
    cmp     r4,0
    bne     @@_807EC10
    ldr     r6,[sp,4]
    add     r6,1
    str     r6,[sp,4]
    mov     r1,r9
    ldrb    r0,[r1]
    add     r0,r0,r6
    lsl     r0,r0,5
    mov     r2,r12
    ldrb    r2,[r2]
    add     r6,r0,r2
    ldr     r3,[sp,0x18]
    ldrb    r0,[r3]
    lsl     r0,r0,5
    mov     r1,r10
    ldrb    r1,[r1]
    add     r3,r0,r1
    b       @@_807EC2A
    .pool
@@_807EC10:
    mov     r2,r9
    ldrb    r0,[r2]
    lsl     r0,r0,5
    mov     r3,r12
    ldrb    r3,[r3]
    add     r6,r0,r3
    ldr     r1,=0x85848E7 ; 0x85821B3
    add     r0,r7,r1
    ldrb    r0,[r0]
    lsl     r0,r0,5
    mov     r2,r10
    ldrb    r2,[r2]
    add     r3,r0,r2
@@_807EC2A:
    ldr     r0,[sp,0x20]
    ldrb    r1,[r0]
    mov     r2,r12
    ldrb    r0,[r2]
    sub     r1,r1,r0
    add     r5,r4,1
    cmp     r1,0
    blt     @@_807EC66
    ldr     r1,[sp,0x14]
    add     r1,r8
    ldr     r4,=0x85848B3 ; 0x858217F
    add     r0,r1,r4
    ldrb    r2,[r0]
    ldr     r0,=0x85848B2 ; 0x858217E
    add     r1,r1,r0
    ldrb    r0,[r1]
    sub     r2,r2,r0
    lsl     r0,r3,1
    ldr     r1,=0x600C800
    add     r4,r0,r1
    lsl     r0,r6,1
    add     r3,r0,r1
    add     r1,r2,1
@@_807EC58:
    ldrh    r0,[r4]
    strh    r0,[r3]
    add     r4,2
    add     r3,2
    sub     r1,1
    cmp     r1,0
    bne     @@_807EC58
@@_807EC66:
    mov     r4,r5
    cmp     r4,1
    ble     @@_807EBD0
@@_807EC6C:
    add     sp,0x24
    pop     r3-r5
    mov     r8,r3
    mov     r9,r4
    mov     r10,r5
    pop     r4-r7
    pop     r0
    bx      r0
    .pool

;=====================================
; UpdateArmCannonAndWeapons [OK]
;=====================================
.org 0x8081F50
        .fill 0x674, 0x0     ; zero out vanilla function

.org 0x8081F50
UpdateArmCannonAndWeapons:
        push    r4-r7,r14
        mov     r7,r8
        push    r7
        add     sp,-0xC
        ldr     r0,=SubGameMode1
        mov     r1,0
        ldsh    r0,[r0,r1]
        cmp     r0,2
        beq     @@_8081304
        b       @@_8081940
    @@_8081304:
        bl      CallUpdateArmCannonOam
        ldr     r2,=ArmCannonYPosition
        ldr     r1,=SamusData
        ldrh    r0,[r1,0x18]
        ldr     r3,=SamusGraphicsInfo
        lsr     r0,r0,2
        ldrh    r4,[r3,0x24]
        add     r0,r0,r4
        lsl     r0,r0,2
        strh    r0,[r2]
        ldr     r2,=ArmCannonXPosition
        ldrh    r0,[r1,0x16]
        lsr     r0,r0,2
        ldrh    r3,[r3,0x22]
        add     r0,r0,r3
        lsl     r0,r0,2
        strh    r0,[r2]
        ldrb    r0,[r1,0xC]
        cmp     r0,0x10
        bne     @@_808136A
        mov     r3,0
        mov     r5,0
        mov     r4,1
        ldr     r2,=ParticleEffects
    @@_8081336:
        ldrb    r1,[r2]
        mov     r0,r4
        and     r0,r1
        cmp     r0,0
        beq     @@_8081346
        ldrb    r0,[r2,2]
        cmp     r0,0x43
        beq     @@_80813FC
    @@_8081346:
        add     r2,0xC
        add     r5,1
        cmp     r5,0xF
        ble     @@_8081336
    @@_808134E:
        cmp     r3,0
        bne     @@_808136A
        ldr     r5,=ArmCannonYPosition
        ldrh    r0,[r5]
        ldr     r4,=ArmCannonXPosition
        ldrh    r1,[r4]
        mov     r2,0x43
        bl      SetParticleEffect
        ldrh    r0,[r5]
        ldrh    r1,[r4]
        mov     r2,0x44
        bl      SetParticleEffect
    @@_808136A:
        ldr     r0,=SamusTimersAndCounters
        ldrb    r0,[r0,0x13]
        cmp     r0,0x10
        bne     @@_80813A4
        mov     r3,0
        mov     r5,0
        mov     r4,1
        ldr     r2,=ParticleEffects
    @@_808137A:
        ldrb    r1,[r2]
        mov     r0,r4
        and     r0,r1
        cmp     r0,0
        beq     @@_808138A
        ldrb    r0,[r2,2]
        cmp     r0,0x45
        beq     @@_80813F4
    @@_808138A:
        add     r2,0xC
        add     r5,1
        cmp     r5,0xF
        ble     @@_808137A
    @@_8081392:
        cmp     r3,0
        bne     @@_80813A4
        ldr     r0,=ArmCannonYPosition
        ldrh    r0,[r0]
        ldr     r1,=ArmCannonXPosition
        ldrh    r1,[r1]
        mov     r2,0x45
        bl      SetParticleEffect
    @@_80813A4:
        ldr     r0,=SamusData
        ldrb    r0,[r0,9]
        sub     r0,1
        cmp     r0,5
        bls     @@_80813B0
        b       @@_80818EA
    @@_80813B0:
        lsl     r0,r0,2
        ldr     r1,=@@_80813DC
        add     r0,r0,r1
        ldr     r0,[r0]
        mov     r15,r0
        .pool
    @@_80813DC:
        .dw @@_8081404,@@_80815B8,@@_80818EA,@@_80816E0
        .dw @@_8081740,@@_8081708
    @@_80813F4:
        add     r0,r3,1
        lsl     r0,r0,0x18
        lsr     r3,r0,0x18
        b       @@_8081392
    @@_80813FC:
        add     r0,r3,1
        lsl     r0,r0,0x18
        lsr     r3,r0,0x18
        b       @@_808134E
    @@_8081404:
        ldr     r0,=Equipment
        ldrb    r4,[r0,0xA]
        mov     r0,8
        and     r0,r4
        cmp     r0,0
        beq     @@_8081458
        mov     r0,2
        and     r0,r4
        lsl     r1,r0,1
        add     r1,3
        mov     r0,4
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081426
        b       @@_80818E4
    @@_8081426:
        ldr     r5,=ArmCannonYPosition
        mov     r0,2
        and     r0,r4
        cmp     r0,0
        beq     @@_8081448
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,4
        mov     r3,0
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,4
        mov     r3,1
        bl      InitProjectile
    @@_8081448:
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,4
        mov     r3,2
        bl      InitProjectile
        mov     r0,7
        b       @@_8081572
    @@_8081458:
        mov     r0,4
        and     r0,r4
        cmp     r0,0
        beq     @@_80814A8
        mov     r0,2
        and     r0,r4
        lsl     r1,r0,1
        add     r1,3
        mov     r0,3
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081476
        b       @@_80818E4
    @@_8081476:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,3
        mov     r3,0
        bl      InitProjectile
        mov     r0,2
        and     r0,r4
        cmp     r0,0
        beq     @@_80814A4
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,3
        mov     r3,1
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,3
        mov     r3,2
        bl      InitProjectile
    @@_80814A4:
        mov     r0,7
        b       @@_8081572
    @@_80814A8:
        mov     r0,2
        and     r0,r4
        cmp     r0,0
        beq     @@_80814EA
        mov     r0,2
        mov     r1,7
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_80814C0
        b       @@_80818E4
    @@_80814C0:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,2
        mov     r3,0
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,2
        mov     r3,1
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,2
        mov     r3,2
        bl      InitProjectile
        mov     r0,7
        b       @@_8081572
    @@_80814EA:
        mov     r0,1
        cmp     r0,r4
        bne     @@_8081552
        mov     r0,1
        mov     r1,7
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081500
        b       @@_80818E4
    @@_8081500:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,1
        mov     r3,0
        bl      InitProjectile
        lsl     r0,r0,0x18
        lsr     r6,r0,0x18
        ldr     r1,=ProjectileData
        lsl     r0,r6,5
        add     r0,r0,r1
        ldrb    r7,[r0,0x10]
        mov     r8,r7
        ldrb    r1,[r0]
        mov     r0,0x40
        and     r0,r1
        lsl     r0,r0,0x18
        lsr     r7,r0,0x18
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        str     r7,[sp]
        mov     r0,r8
        str     r0,[sp,4]
        str     r6,[sp,8]
        mov     r0,1
        mov     r3,1
        bl      InitSecondaryProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        str     r7,[sp]
        mov     r3,r8
        str     r3,[sp,4]
        str     r6,[sp,8]
        mov     r0,1
        mov     r3,2
        bl      InitSecondaryProjectile
        mov     r0,7
        b       @@_8081572
    @@_8081552:
        mov     r0,0
        mov     r1,3
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081562
        b       @@_80818E4
    @@_8081562:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,0
        mov     r3,0
        bl      InitProjectile
        mov     r0,7
    @@_8081572:
        ldr     r1,=SamusData
        strb    r0,[r1,0xA]
        ldrh    r0,[r5]
        ldrh    r1,[r5,2]
        mov     r2,0x2B
        bl      SetParticleEffect
        b       @@_80818E4
        .pool
    @@_80815B8:
        ldr     r0,=Equipment
        ldrb    r1,[r0,0xB]
        mov     r0,8
        and     r0,r1
        cmp     r0,0
        beq     @@_8081634
        mov     r0,0xD
        mov     r1,2
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_80815D4
        b       @@_80818E4
    @@_80815D4:
        ldr     r0,=SamusTimersAndCounters
        ldrb    r0,[r0,0x13]
        lsl     r0,r0,0x18
        asr     r0,r0,0x18
        cmp     r0,0
        bge     @@_8081604
        ldr     r0,=ArmCannonYPosition
        ldrh    r1,[r0]
        ldr     r0,=ArmCannonXPosition
        ldrh    r2,[r0]
        mov     r0,0xE
        mov     r3,0
        bl      InitProjectile
        b       @@_8081614
        .pool
    @@_8081604:
        ldr     r0,=ArmCannonYPosition
        ldrh    r1,[r0]
        ldr     r0,=ArmCannonXPosition
        ldrh    r2,[r0]
        mov     r0,0xD
        mov     r3,0
        bl      InitProjectile
    @@_8081614:
        ldr     r1,=SamusData
        mov     r2,0
        mov     r0,0x10
        strb    r0,[r1,0xA]
        ldr     r0,=SamusTimersAndCounters
        strb    r2,[r0,0x13]
        b       @@_80818E4
        .pool
    @@_8081634:
        mov     r0,4
        and     r0,r1
        cmp     r0,0
        beq     @@_8081670
        mov     r0,0xC
        mov     r1,2
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_808164C
        b       @@_80818E4
    @@_808164C:
        ldr     r0,=ArmCannonYPosition
        ldrh    r1,[r0]
        ldr     r0,=ArmCannonXPosition
        ldrh    r2,[r0]
        mov     r0,0xC
        mov     r3,0
        bl      InitProjectile
        ldr     r1,=SamusData
        mov     r0,0xF
        b       @@_80816D0
        .pool
    @@_8081670:
        mov     r0,2
        and     r1,r0
        cmp     r1,0
        beq     @@_80816AC
        mov     r0,0xB
        mov     r1,2
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081688
        b       @@_80818E4
    @@_8081688:
        ldr     r0,=ArmCannonYPosition
        ldrh    r1,[r0]
        ldr     r0,=ArmCannonXPosition
        ldrh    r2,[r0]
        mov     r0,0xB
        mov     r3,0
        bl      InitProjectile
        ldr     r1,=SamusData
        mov     r0,0xE
        b       @@_80816D0
        .pool
    @@_80816AC:
        mov     r0,0xA
        mov     r1,2
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_80816BC
        b       @@_80818E4
    @@_80816BC:
        ldr     r0,=ArmCannonYPosition
        ldrh    r1,[r0]
        ldr     r0,=ArmCannonXPosition
        ldrh    r2,[r0]
        mov     r0,0xA
        mov     r3,0
        bl      InitProjectile
        ldr     r1,=SamusData
        mov     r0,9
    @@_80816D0:
        strb    r0,[r1,0xA]
        b       @@_80818E4
        .pool
    @@_80816E0:
        mov     r0,0x10
        mov     r1,4
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_80816F0
        b       @@_80818E4
    @@_80816F0:
        ldr     r4,=SamusData
        ldrh    r1,[r4,0x18]
        ldrh    r2,[r4,0x16]
        mov     r0,0x10
        mov     r3,0
        bl      InitProjectile
        mov     r0,7
        strb    r0,[r4,0xA]
        b       @@_80818E4
        .pool
    @@_8081708:
        mov     r0,0x11
        mov     r1,1
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081718
        b       @@_80818E4
    @@_8081718:
        ldr     r0,=CurrPowerBomb
        ldrb    r0,[r0]
        cmp     r0,0
        beq     @@_8081722
        b       @@_80818E4
    @@_8081722:
        ldr     r4,=SamusData
        ldrh    r1,[r4,0x18]
        ldrh    r2,[r4,0x16]
        mov     r0,0x11
        mov     r3,0
        bl      InitProjectile
        mov     r0,5
        strb    r0,[r4,0xA]
        b       @@_80818E4
        .pool
    @@_8081740:
        ldr     r0,=Equipment
        ldrb    r4,[r0,0xA]
        mov     r0,8
        and     r0,r4
        cmp     r0,0
        beq     @@_808178E
        mov     r0,9
        mov     r1,7
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_808175C
        b       @@_80818E4
    @@_808175C:
        ldr     r5,=ArmCannonYPosition
        mov     r0,2
        and     r0,r4
        cmp     r0,0
        beq     @@_808177E
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,9
        mov     r3,0
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,9
        mov     r3,1
        bl      InitProjectile
    @@_808177E:
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,9
        mov     r3,2
        bl      InitProjectile
        mov     r0,3
        b       @@_80818A2
    @@_808178E:
        mov     r0,4
        and     r0,r4
        cmp     r0,0
        beq     @@_80817D8
        mov     r0,8
        mov     r1,7
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_80817A6
        b       @@_80818E4
    @@_80817A6:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,8
        mov     r3,0
        bl      InitProjectile
        mov     r0,2
        and     r0,r4
        cmp     r0,0
        beq     @@_80817D4
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,8
        mov     r3,1
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,8
        mov     r3,2
        bl      InitProjectile
    @@_80817D4:
        mov     r0,3
        b       @@_80818A2
    @@_80817D8:
        mov     r0,2
        and     r0,r4
        cmp     r0,0
        beq     @@_808181A
        mov     r0,7
        mov     r1,7
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_80817F0
        b       @@_80818E4
    @@_80817F0:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,7
        mov     r3,0
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,7
        mov     r3,1
        bl      InitProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,7
        mov     r3,2
        bl      InitProjectile
        mov     r0,3
        b       @@_80818A2
    @@_808181A:
        mov     r0,1
        cmp     r0,r4
        bne     @@_8081882
        mov     r0,6
        mov     r1,7
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081830
        b       @@_80818E4
    @@_8081830:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,6
        mov     r3,0
        bl      InitProjectile
        lsl     r0,r0,0x18
        lsr     r6,r0,0x18
        ldr     r1,=ProjectileData
        lsl     r0,r6,5
        add     r0,r0,r1
        ldrb    r7,[r0,0x10]
        mov     r8,r7
        ldrb    r1,[r0]
        mov     r0,0x40
        and     r0,r1
        lsl     r0,r0,0x18
        lsr     r7,r0,0x18
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        str     r7,[sp]
        mov     r0,r8
        str     r0,[sp,4]
        str     r6,[sp,8]
        mov     r0,6
        mov     r3,1
        bl      InitSecondaryProjectile
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        str     r7,[sp]
        mov     r0,r8
        str     r0,[sp,4]
        str     r6,[sp,8]
        mov     r0,6
        mov     r3,2
        bl      InitSecondaryProjectile
        mov     r0,3
        b       @@_80818A2
    @@_8081882:
        mov     r0,5
        mov     r1,3
        bl      CheckAmountOfProjectiles
        lsl     r0,r0,0x18
        cmp     r0,0
        bne     @@_8081892
        b       @@_80818E4
    @@_8081892:
        ldr     r5,=ArmCannonYPosition
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,5
        mov     r3,0
        bl      InitProjectile
        mov     r0,3
    @@_80818A2:
        ldr     r1,=SamusData
        strb    r0,[r1,0xA]
        ldrh    r1,[r5]
        ldrh    r2,[r5,2]
        mov     r0,0xF
        mov     r3,0
        bl      InitProjectile
        b       @@_80818E4
        .pool
    @@_80818E4:
        ldr     r1,=SamusData
        mov     r0,0
        strb    r0,[r1,9]
    @@_80818EA:
        bl      CheckWeaponHitSprite
        mov     r5,0
        ldr     r6,=CurrProjectileData
        ldr     r4,=ProcessProjectilePtrs
        mov     r8,r4
    @@_80818F6:
        ldr     r1,=ProjectileData
        lsl     r0,r5,5
        add     r4,r0,r1
        ldrb    r1,[r4]
        mov     r0,1
        and     r0,r1
        cmp     r0,0
        beq     @@_808193A
        mov     r1,r6
        mov     r0,r4
        ldmia   [r0]!,r2,r3,r7
        stmia   [r1]!,r2,r3,r7
        ldmia   [r0]!,r2,r3,r7
        stmia   [r1]!,r2,r3,r7
        ldmia   [r0]!,r2,r7
        stmia   [r1]!,r2,r7
        ldrb    r0,[r6,0xF]
        lsl     r0,r0,2
        add     r0,r8
        ldr     r0,[r0]
        bl      bx_r0
        bl      AdvanceProjectileAnim
        bl      CheckDespawnProjectile
        mov     r1,r4
        mov     r0,r6
        ldmia   [r0]!,r3,r4,r7
        stmia   [r1]!,r3,r4,r7
        ldmia   [r0]!,r2-r4
        stmia   [r1]!,r2-r4
        ldmia   [r0]!,r2,r7
        stmia   [r1]!,r2,r7
    @@_808193A:
        add     r5,1
        cmp     r5,0xF
        ble     @@_80818F6
    @@_8081940:
        add     sp,0xC
        pop     r3
        mov     r8,r3
        pop     r4-r7
        pop     r0
        bx      r0
        .pool

;=====================================
; LoadBeamGraphics: 81e5e in MF_U [OK]
;=====================================
.org 0x8082ABE
    .fill 0x28E,0x0     ;zero out vanilla functions

.org 0x8082ABC
;sub_8081E5E:
    push    r14
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xA]
    cmp     r1,1
    bne     @@_8081E6A
    ldr     r2,=BeamGraphicsPointers ; 0x8081ECC in MF_U
    b       @@_8081E76
@@_8081E6A:
    lsr     r0,r1,1
    lsl     r1,r0,1
    add     r1,r0,r1
    lsl     r1,r1,2
    ldr     r0,=BeamGraphicsPointers + 0xC ; 0x8081ED8
    add     r2,r0,r1
@@_8081E76:
    ldr     r1,=0x40000D4   ; DMA controller 3
    ldr     r0,[r2]         ;\ 
    str     r0,[r1]         ;/ hand beam gfx pointer to DMA
    ldr     r0,=0x6011000   ;\ DMA destination
    str     r0,[r1,4]       ;/ 
    ldr     r0,=0x80000140  ;\ number of halfwords to transfer
    str     r0,[r1,8]       ;/
    ldr     r0,[r1,8]       ; ???
    ldr     r0,[r2,4]       ;\ 
    str     r0,[r1]         ;/ hand second gfx pointer to DMA
    ldr     r0,=0x6011400   ;\ DMA destination 2
    str     r0,[r1,4]       ;/
    ldr     r0,=0x80000140  ;\ number of halfwords to transfer
    str     r0,[r1,8]       ;/
    ldr     r0,[r1,8]       ; ???
    ldr     r0,[r2,8]       ;\
    str     r0,[r1]         ;/ hand palette pointer to DMA
    ldr     r0,=0x5000240   ;\ DMA destination
    str     r0,[r1,4]       ;/ (palette RAM)
    ldr     r0,=0x80000005  ;\ number of halfwords to transfer
    str     r0,[r1,8]       ;/
    ldr     r0,[r1,8]       ; ???
    pop     r0
    bx      r0
    .pool

.org 0x8082B2C
BeamGraphicsPointers:
    .word ChargeBeamGfx,         ChargeBeamGfx + 0x280, ChargeBeamPal,         NormalBeamGfx
    .word NormalBeamGfx + 0x280, NormalBeamPal,         WideBeamGfx,           WideBeamGfx + 0x280
    .word WideBeamPal,           PlasmaBeamGfx,         PlasmaBeamGfx + 0x280, PlasmaBeamPal
    .word PlasmaBeamGfx,         PlasmaBeamGfx + 0x280, PlasmaBeamPal,         WideBeamGfx
    .word WideBeamGfx + 0x280,   WideBeamPal,           WideBeamGfx,           WideBeamGfx + 0x280
    .word WideBeamPal,           WaveBeamGfx,           WaveBeamGfx + 0x280,   WaveBeamPal
    .word WaveBeamGfx,           WaveBeamGfx + 0x280,   WaveBeamPal,           IceBeamGfx
    .word IceBeamGfx + 0x280,    IceBeamPal,            IceBeamGfx,            IceBeamGfx + 0x280
    .word IceBeamPal,            IceBeamGfx,            IceBeamGfx + 0x280,    IceBeamPal
    .word IceBeamGfx,            IceBeamGfx + 0x280,    IceBeamPal,            IceBeamGfx
    .word IceBeamGfx + 0x280,    IceBeamPal,            IceBeamGfx,            IceBeamGfx + 0x280
    .word IceBeamPal,            IceBeamGfx,            IceBeamGfx + 0x280,    IceBeamPal
    .word IceBeamGfx,            IceBeamGfx + 0x280,    IceBeamPal

;=====================================
; LoadMissileGraphics: 82010 in MF_U [OK]
;=====================================
.org 0x8082C70
LoadMissileGfx:
    push    r14
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xB]
    mov     r2,0xF
    and     r1,r2
    mov     r2,0
    cmp     r1,r2
    beq     @@_808204E
@@_8082020:
    add     r2,1
    lsr     r1,r1,1
    cmp     r1,0
    bne     @@_8082020
    sub     r2,1
    lsl     r2,r2,3
    ldr     r0,=MissileGraphicsPointers ; 0x808206C
    add     r2,r0,r2
    ldr     r0,=0x40000D4
    ldr     r1,[r2]
    str     r1,[r0]
    ldr     r1,=0x6011380
    str     r1,[r0,4]
    ldr     r1,=0x80000040
    str     r1,[r0,8]
    ldr     r1,[r0,8]
    ldr     r1,[r2,4]
    str     r1,[r0]
    ldr     r1,=0x6011780
    str     r1,[r0,4]
    ldr     r1,=0x80000040
    str     r1,[r0,8]
    ldr     r0,[r0,8]
@@_808204E:
    pop     r0
    bx      r0
    .pool

.org 0x8082CCC
MissileGraphicsPointers:
    .word NormalMissileGfx, NormalMissileGfx + 0x80, SuperMissileGfx,     SuperMissileGfx + 0x80
    .word IceMissileGfx,    IceMissileGfx + 0x80,    DiffusionMissileGfx, DiffusionMissileGfx + 0x80

;=====================================
; MoveWaveBeamParts: 8252E in MF_U [OK]
;=====================================
.org 0x808318C
    .fill 0xFA,0x0      ;zero out original function

.org 0x808318C
MoveWaveBeamParts:
    push    r4-r6,r14
    ldr     r5,=CurrProjectileData
    ldrb    r0,[r5,0x1E]
    mov     r1,7
    mov     r4,0xF
    and     r4,r0
    and     r0,r1
    ldr     r1,=0x858BB5C ; 0x858B3CC in MF_U ; Some kind of beam data?
    lsl     r0,r0,1
    add     r0,r1,r0
    ldrh    r6,[r0]
    mov     r0,r6
    bl      IntToDouble
    ldr     r2,=0x3FF66666
    ldr     r3,=0x66666666
    bl      MultiplyDoubles
    bl      DoubleToInt_Overflow
    lsl     r0,r0,0x10
    lsr     r3,r0,0x10
    cmp     r4,3
    bls     @@_8082560
    cmp     r4,0xB
    bls     @@_8082564
@@_8082560:
    mov     r2,2
    b       @@_8082566
@@_8082564:
    mov     r2,1
@@_8082566:
    ldrb    r1,[r5,0x13]
    cmp     r1,1
    bne     @@_8082570
    mov     r1,3
    eor     r2,r1
@@_8082570:
    ldrb    r1,[r5]
    mov     r0,0x40
    and     r1,r0
    ldrb    r0,[r5,0x10]
    sub     r0,1
    cmp     r0,4
    bhi     @@_80825F6
    lsl     r0,r0,2
    ldr     r4,=@@_808259C
    add     r0,r4,r0
    ldr     r0,[r0]
    mov     r15,r0
    .pool
@@_808259C:
    .dw @@_80825F6,@@_80825B8,@@_80825B0,@@_80825EC
    .dw @@_80825E6
@@_80825B0:
    ldrh    r0,[r5,8]
    cmp     r1,0
    beq     @@_80825BE
    b       @@_80825CA
@@_80825B8:
    ldrh    r0,[r5,8]
    cmp     r1,0
    beq     @@_80825CA
@@_80825BE:
    cmp     r2,1
    beq     @@_80825C6
    add     r0,r6,r0
    b       @@_80825D0
@@_80825C6:
    sub     r0,r0,r6
    b       @@_80825DC
@@_80825CA:
    cmp     r2,1
    bne     @@_80825DA
    sub     r0,r0,r6
@@_80825D0:
    strh    r0,[r5,8]
    ldrh    r0,[r5,0xA]
    add     r0,r6,r0
    strh    r0,[r5,0xA]
    b       @@_8082606
@@_80825DA:
    add     r0,r6,r0
@@_80825DC:
    strh    r0,[r5,8]
    ldrh    r0,[r5,0xA]
    sub     r0,r0,r6
    strh    r0,[r5,0xA]
    b       @@_8082606
@@_80825E6:
    cmp     r1,0
    bne     @@_80825F0
    b       @@_80825F4
@@_80825EC:
    cmp     r1,0
    bne     @@_80825F4
@@_80825F0:
    mov     r0,3
    eor     r2,r0
@@_80825F4:
    add     r5,2
@@_80825F6:
    add     r5,8
    ldrh    r0,[r5]
    cmp     r2,1
    bne     @@_8082602
    sub     r0,r0,r3
    b       @@_8082604
@@_8082602:
    add     r0,r3,r0
@@_8082604:
    strh    r0,[r5]
@@_8082606:
    pop     r4-r6
    pop     r0
    bx      r0

;=====================================
; CheckWeaponHitSprite: [OK]
; 82888 in MF_U, 834E8 in MF_J, difference = C60
;=====================================
.org 0x808396C ; 0x8082d0c ; charge beam hit sprite
    bl      @_8083C98

.org 0x8083996 ; 0x8082d38 ; wide beam hit sprite
    bl      @_8083DB8

.org 0x80839BE ; 0x8082d60 ; plasma beam hit sprite
    bl      @_8083EA8

.org 0x80839E4 ; 0x8082d86 ; wave beam hit sprite
    bl      @_8083FB4

.org 0x8083A0C ; 0x8082dae ; charged normal beam hit sprite
    bl      @_8083C22

.org 0x8083A34 ; 0x8082dd4 ; charged charge beam hit sprite
    bl      @_8083D0E

.org 0x8083A6A ; 0x8082e0c ; charged wide beam hit sprite
    bl      @_8083E2E

.org 0x8083A90 ; 0x8082e32 ; charged plasma beam hit sprite
    bl      @_8083F2A

.org 0x8083AB8 ; 0x8082e5a ; charged wave beam hit sprite
    bl      @_808405A

.org 0x8083B24 ; 0x8082ec6 ; normal missile hit sprite
    bl      @_808415C

.org 0x8083B4C ; 0x8082eee ; super missile hit sprite
    bl      @_808415C

.org 0x8083B74 ; 0x8082f16 ; ice missile hit sprite
    bl      @_808415C

.org 0x8083B9C ; 0x8082f3e ; diffusion missile hit sprite
    bl      @_80841D0

.org 0x8083BC4 ; 0x8082f66 ; diffusion flake hit sprite
    bl      @_80842C0

;=====================================
; NormalBeamHitSprite: 83bac
; ChargedNormalBeamHitSprite: 83c70
; ChargeBeamHitSprite: 83d34
; ChargedChargeBeamHitSprite: 83e14
; WideBeamHitSprite: 83ef4
; ChargedWideBeamHitSprite: 83fb8
; PlasmaBeamHitSprite: 8407c
; ChargedPlasmaBeamHitSprite: 843a0
; WaveBeamHitSprite: 8423c
; ChargedWaveBeamHitSprite: 843a0
; [OK]
;=====================================
.org 0x808481C ; 0x8083bc0 in MF_U
    .fill 0x974,0x0     ;zero out vanilla functions

.org 0x808481C ; 0x8083bc0 in MF_U
;sub_8083BC0:
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083BEC
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    b       @@_8083C0A
@@_8083BEC:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083C20
    mov     r4,2
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    beq     @@_8083C16
    cmp     r1,0
    beq     @@_8083C0A
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8083C0A:
    mov     r0,r6
    mov     r1,r7
    mov     r2,3
    bl      SetParticleEffect
    b       @_8084136
@@_8083C16:
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
@@_8083C20:
    b       @_808412C
@_8083C22:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083C62
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    b       @@_8083C80
@@_8083C62:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083C96
    mov     r4,0xA
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    beq     @@_8083C8C
    cmp     r1,0
    beq     @@_8083C80
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8083C80:
    mov     r0,r6
    mov     r1,r7
    mov     r2,3
    bl      SetParticleEffect
    b       @_8084136
@@_8083C8C:
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
@@_8083C96:
    b       @_808412C
@_8083C98:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083CD8
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    b       @@_8083CF6
@@_8083CD8:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083D0C
    mov     r4,2
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    beq     @@_8083D02
    cmp     r1,0
    beq     @@_8083CF6
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8083CF6:
    mov     r0,r6
    mov     r1,r7
    mov     r2,4
    bl      SetParticleEffect
    b       @_8083D8E
@@_8083D02:
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
@@_8083D0C:
    b       @_8083D84
@_8083D0E:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083D4E
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    b       @@_8083D6C
@@_8083D4E:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083D82
    mov     r4,0xA
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    beq     @@_8083D78
    cmp     r1,0
    beq     @@_8083D6C
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8083D6C:
    mov     r0,r6
    mov     r1,r7
    mov     r2,4
    bl      SetParticleEffect
    b       @_8083D8E
@@_8083D78:
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
@@_8083D82:
    b       @_8083D84
@_8083D84:
    mov     r0,r6
    mov     r1,r7
    mov     r2,7
    bl      SetParticleEffect
@_8083D8E:
    ldr     r2,=ProjectileData
    mov     r0,r8
    lsl     r0,r0,5
    add     r4,r2,r0
    ldrb    r0,[r4]
    mov     r1,4
    tst     r0,r1
    beq     @@_8083DAC
    ldrb    r0,[r4,0x1F]
    lsl     r0,r0,5
    add     r2,r2,r0
    ldrb    r0,[r2,0x12]
    cmp     r0,3
    bhi     @@_8083DAC
    strb    r1,[r2,0x12]
@@_8083DAC:
    b       @_8084136
    .pool
@_8083DB8:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083DF8
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    b       @@_8083E16
@@_8083DF8:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083E2C
    mov     r4,3
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    beq     @@_8083E22
    cmp     r1,0
    beq     @@_8083E16
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8083E16:
    mov     r0,r6
    mov     r1,r7
    mov     r2,5
    bl      SetParticleEffect
    b       @_8084136
@@_8083E22:
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
@@_8083E2C:
    b       @_808412C
@_8083E2E:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083E6E
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    b       @@_8083E8C
@@_8083E6E:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083EA2
    mov     r4,0xF
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    beq     @@_8083E98
    cmp     r1,0
    beq     @@_8083E8C
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8083E8C:
    mov     r0,r6
    mov     r1,r7
    mov     r2,5
    bl      SetParticleEffect
    b       @_8084136
@@_8083E98:
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
@@_8083EA2:
    b       @_808412C
    .pool
@_8083EA8:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083EF2
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    mov     r0,r6
    mov     r1,r7
    mov     r2,6
    bl      SetParticleEffect
    b       @_8084136
@@_8083EF2:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083F18
    mov     r4,3
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    bne     @@_8083F1A
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    mov     r0,r6
    mov     r1,r7
    mov     r2,7
    bl      SetParticleEffect
    b       @_8084142
@@_8083F18:
    b       @_808412C
@@_8083F1A:
    cmp     r1,0
    beq     @@_8083F28
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris_PiercingBeam
@@_8083F28:
    b       @_8084142
@_8083F2A:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083F74
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    mov     r0,r6
    mov     r1,r7
    mov     r2,6
    bl      SetParticleEffect
    b       @_8084136
@@_8083F74:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_8083F9A
    mov     r4,9
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    bne     @@_8083F9E
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    mov     r0,r6
    mov     r1,r7
    mov     r2,7
    bl      SetParticleEffect
    b       @_8084142
@@_8083F9A:
    bl      @_808412C
@@_8083F9E:
    cmp     r1,0
    beq     @@_8083FAC
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris_PiercingBeam
@@_8083FAC:
    b       @_8084142
    .pool
@_8083FB4:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_8083FFE
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    ldr     r1,=Equipment
    ldrb    r1,[r1,0xA]
    mov     r0,4
    tst     r0,r1
    beq     @@_8084048
    b       @@_8084058
@@_8083FFE:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_808402E
    mov     r4,3
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    bne     @@_8084030
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    ldr     r1,=Equipment
    ldrb    r1,[r1,0xA]
    mov     r0,4
    tst     r0,r1
    beq     @@_808402E
    mov     r0,r6
    mov     r1,r7
    mov     r2,7
    bl      SetParticleEffect
    b       @_8084142
@@_808402E:
    b       @_808412C
@@_8084030:
    ldr     r5,=Equipment
    ldrb    r5,[r5,0xA]
    mov     r3,4
    tst     r3,r5
    bne     @@_808404A
    cmp     r1,0
    beq     @@_8084048
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8084048:
    b       @_8084136
@@_808404A:
    cmp     r1,0
    beq     @@_8084058
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris_PiercingBeam
@@_8084058:
    b       @_8084142
@_808405A:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    tst     r0,r1
    beq     @@_80840A4
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    ldr     r1,=Equipment
    ldrb    r1,[r1,0xA]
    mov     r0,4
    tst     r0,r1
    beq     @@_808411A
    b       @@_808412A
@@_80840A4:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_80840DA
    ldrb    r0,[r5,0x1D]
    cmp     r0,0xC0
    beq     @@_80840DE
    mov     r4,9
    bl      sub_8084412 ; 0x8084412
    cmp     r0,0
    bne     @@_8084102
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    bl      @_80843C4 ; 0x80843C4
    ldr     r1,=Equipment
    ldrb    r1,[r1,0xA]
    mov     r0,4
    tst     r0,r1
    beq     @@_80840DA
    mov     r0,r6
    mov     r1,r7
    mov     r2,7
    bl      SetParticleEffect
    b       @_8084142
@@_80840DA:
    bl      @_808412C
@@_80840DE:
    mov     r0,r9
    mov     r1,9
    bl      LowerSpriteHealth
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r0,r9
    bl      CheckSpriteMakesDebrisWhenHit
    lsl     r1,r0,0x10
    ldr     r5,=Equipment
    ldrb    r5,[r5,0xA]
    mov     r0,0x10
    and     r0,r5
    cmp     r0,0
    beq     @@_8084100
    mov     r0,1
@@_8084100:
    add     r0,1
@@_8084102:
    ldr     r5,=Equipment
    ldrb    r5,[r5,0xA]
    mov     r3,4
    tst     r3,r5
    bne     @@_808411C
    cmp     r1,0
    beq     @@_808411A
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_808411A:
    b       @_8084136
@@_808411C:
    cmp     r1,0
    beq     @@_808412A
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris_PiercingBeam
@@_808412A:
    b       @_8084142
@_808412C:
    mov     r0,r6
    mov     r1,r7
    mov     r2,7
    bl      SetParticleEffect
@_8084136:
    ldr     r0,=ProjectileData
    mov     r2,r8
    lsl     r1,r2,5
    add     r1,r1,r0
    mov     r0,0
    strb    r0,[r1]
@_8084142:
    pop     r3-r5
    mov     r8,r3
    mov     r9,r4
    mov     r10,r5
    pop     r4-r7
    pop     r0
    bx      r0
    .pool

;ChargedPlasmaBeamHitSprite:
@_808415C:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
;.org 0x8084DC2
@@_8084166:
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    ldr     r4,=Equipment
    ldrb    r4,[r4,0xB]
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    and     r0,r1
    cmp     r0,0
    beq     @@_80841A8
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    mov     r0,4
    tst     r0,r4
    beq     @@_80841C4
    bl      @_80843C0 ; 0x80843C0
    b       @@_80841C4
@@_80841A8:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_80841C6
    bl      sub_8084484 ; 0x8084484
    cmp     r0,0
    beq     @@_80841C6
    cmp     r1,0
    beq     @@_80841C4
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_80841C4:
    b       @_8084388
@@_80841C6:
    b       @_8084374
    .pool
@_80841D0:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    ldr     r4,=Equipment
    ldrb    r4,[r4,0xB]
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    mov     r0,8
    and     r0,r1
    cmp     r0,0
    beq     @@_808421C
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    mov     r0,4
    tst     r0,r4
    beq     @@_8084238
    bl      @_80843C0 ; 0x80843C0
    b       @@_8084238
@@_808421C:
    mov     r0,0x40
    tst     r0,r1
    bne     @@_80842B2
    bl      sub_8084484 ; 0x8084484
    cmp     r0,0
    beq     @@_80842B2
    cmp     r1,0
    beq     @@_8084238
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8084238:
    ldr     r0,=ProjectileData
    mov     r1,r8
    lsl     r1,r1,5
    add     r0,r0,r1
    mov     r5,r0
    ldrb    r0,[r5,0xF]
    cmp     r0,0xE
    bne     @@_80842B0
    add     sp,-0xC
    mov     r4,0
    mov     r0,3
    strb    r0,[r5,0x12]
    strb    r4,[r5,0x1E]
    ldrb    r1,[r5]
    mov     r0,0xEF
    and     r0,r1
    mov     r1,4
    orr     r0,r1
    strb    r0,[r5]
    str     r4,[sp]
    str     r4,[sp,4]
    ldrb    r0,[r5,0x1F]
    str     r0,[sp,8]
    mov     r0,0x12
    mov     r1,r6
    mov     r2,r7
    mov     r3,0
    bl      InitSecondaryProjectile
    str     r4,[sp]
    str     r4,[sp,4]
    ldrb    r0,[r5,0x1F]
    str     r0,[sp,8]
    mov     r0,0x12
    mov     r1,r6
    mov     r2,r7
    mov     r3,0x40
    bl      InitSecondaryProjectile
    str     r4,[sp]
    str     r4,[sp,4]
    ldrb    r0,[r5,0x1F]
    str     r0,[sp,8]
    mov     r0,0x12
    mov     r1,r6
    mov     r2,r7
    mov     r3,0x80
    bl      InitSecondaryProjectile
    str     r4,[sp]
    str     r4,[sp,4]
    ldrb    r0,[r5,0x1F]
    str     r0,[sp,8]
    mov     r0,0x12
    mov     r1,r6
    mov     r2,r7
    mov     r3,0xC0
    bl      InitSecondaryProjectile
    add     sp,0xC
@@_80842B0:
    b       @_8084388
@@_80842B2:
    b       @_8084374
    .pool
@_80842C0:
    push    r4-r7,r14
    mov     r7,r10
    mov     r6,r9
    mov     r5,r8
    push    r5-r7
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r9,r4
    lsl     r1,r1,0x18
    lsr     r1,r1,0x18
    mov     r8,r1
    lsl     r2,r2,0x10
    lsr     r6,r2,0x10
    lsl     r3,r3,0x10
    lsr     r7,r3,0x10
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r0,r5
    add     r0,0x34
    ldrb    r1,[r0]
    ldr     r4,=Equipment
    ldrb    r4,[r4,0xB]
    mov     r0,0x40
    and     r0,r1
    cmp     r0,0
    bne     @@_8084372
    mov     r0,8
    and     r1,r0
    cmp     r1,0
    beq     @@_8084314
    mov     r0,r9
    bl      ProjectileSetIsftForSolid
    mov     r0,4
    tst     r0,r4
    beq     @@_8084372
    bl      @_80843C0 ; 0x80843C0
    b       @@_8084372
@@_8084314:
    mov     r0,r9
    bl      GetSpriteWeakness
    mov     r1,4
    tst     r1,r4
    beq     @@_8084348
    mov     r4,r5
    add     r4,0x32
    ldrb    r1,[r4]
    cmp     r1,0
    bne     @@_8084372
    mov     r1,0x40
    tst     r1,r0
    beq     @@_8084372
    mov     r0,r9
    mov     r1,r8
    bl      LowerSpriteHealth_DiffusionFlake
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r0,r9
    bl      CheckSpriteMakesDebrisWhenHit
    lsl     r1,r0,0x10
    mov     r0,2
    b       @@_8084364
@@_8084348:
    mov     r1,8
    tst     r1,r0
    beq     @@_8084372
    mov     r0,r9
    mov     r1,1
    bl      LowerSpriteHealth
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r0,r9
    bl      CheckSpriteMakesDebrisWhenHit
    lsl     r1,r0,0x10
    mov     r0,1
@@_8084364:
    cmp     r1,0
    beq     @@_8084372
    mov     r1,r4
    mov     r2,r6
    mov     r3,r7
    bl      CreateSpriteDebris
@@_8084372:
    b       @_80843A4
@_8084374:
    mov     r0,r6
    mov     r1,r7
    mov     r2,7
    bl      SetParticleEffect
    mov     r0,r9
    mov     r1,r8
    bl      StartMissileTumble
    b       @_80843A4
@_8084388:
    ldr     r0,=ProjectileData
    mov     r5,r8
    lsl     r5,r5,5
    add     r5,r5,r0
    ldrb    r4,[r5,0xF]
    sub     r2,r4,2
    mov     r0,r6
    mov     r1,r7
    bl      SetParticleEffect
    cmp     r4,0xE
    beq     @_80843A4
    mov     r0,0
    strb    r0,[r5]
@_80843A4:
    pop     r3-r5
    mov     r8,r3
    mov     r9,r4
    mov     r10,r5
    pop     r4-r7
    pop     r0
    bx      r0
    .pool

@_80843C0:
    push    r14
    b       @_80843D2
@_80843C4:
    push    r14
    ldr     r1,=Equipment
    ldrb    r1,[r1,0xA]
    mov     r0,0x10
    and     r0,r1
    cmp     r0,0
    beq     @_808440E
@_80843D2:
    mov     r4,r9
    ldr     r1,=SpriteData
    lsl     r0,r4,3
    sub     r0,r0,r4
    lsl     r0,r0,3
    add     r5,r0,r1
    mov     r4,r5
    add     r4,0x32
    ldrb    r0,[r4]
    cmp     r0,0
    bne     @_808440E
    mov     r0,r9
    bl      GetSpriteWeakness
    mov     r1,0x40
    and     r1,r0
    cmp     r1,0
    beq     @_808440E
    mov     r0,0xF0
    strb    r0,[r4]
    mov     r0,0
    strb    r0,[r4,1]
    ldrb    r0,[r4,3]
    ldrb    r1,[r5,0x1F]
    add     r0,r0,r1
    mov     r1,0xF
    sub     r1,r1,r0
    mov     r0,r5
    add     r0,0x20
    strb    r1,[r0]
@_808440E:
    pop     r0
    bx      r0

sub_8084412:
    push    r14
    mov     r0,r9
    bl      GetSpriteWeakness
    ldr     r2,=ProjectileData
    mov     r1,r8
    lsl     r1,r1,5
    add     r2,r1,r2
    ldrb    r5,[r2,0xF]
    ldr     r2,=Equipment
    ldrb    r2,[r2,0xA]
    mov     r1,0x10
    tst     r1,r2
    bne     @@_8084456
    mov     r1,0
    cmp     r5,5
    blt     @@_8084436
    add     r1,1
@@_8084436:
    add     r1,2
    and     r0,r1
    cmp     r0,0
    beq     @@_8084480
    mov     r0,r9
    mov     r1,r4
    bl      LowerSpriteHealth
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r0,r9
    bl      CheckSpriteMakesDebrisWhenHit
    lsl     r1,r0,0x10
    mov     r0,1
    b       @@_8084480
@@_8084456:
    mov     r1,0
    cmp     r5,5
    blt     @@_808445E
    add     r1,1
@@_808445E:
    add     r1,2
    and     r0,r1
    cmp     r0,0
    beq     @@_8084480
    mov     r0,r9
    mov     r1,r8
    add     r2,r4,3
    bl      LowerSpriteHealth_IceBeam
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r0,r9
    bl      CheckSpriteMakesDebrisWhenHit
    lsl     r1,r0,0x10
    mov     r0,2
    b       @@_8084480
@@_8084480:
    pop     r2
    bx      r2

sub_8084484:
    push    r14
    mov     r0,r9
    bl      GetSpriteWeakness
    mov     r1,0
    mov     r2,r1
    mov     r3,1
    tst     r3,r4
    beq     @@_808449A
    add     r1,8
    add     r2,0xA
@@_808449A:
    mov     r3,2
    tst     r3,r4
    beq     @@_80844A4
    add     r1,4
    add     r2,0x14
@@_80844A4:
    mov     r3,8
    tst     r3,r4
    beq     @@_80844AC
    add     r2,5
@@_80844AC:
    mov     r3,4
    tst     r3,r4
    beq     @@_80844D4
    add     r1,0x40
    add     r2,0xA
    and     r0,r1
    cmp     r0,0
    beq     @@_80844F0
    mov     r0,r9
    mov     r1,r8
    bl      LowerSpriteHealth_IceMissile
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r0,r9
    bl      CheckSpriteMakesDebrisWhenHit
    lsl     r1,r0,0x10
    mov     r0,2
    b       @@_80844F0
@@_80844D4:
    and     r0,r1
    cmp     r0,0
    beq     @@_80844F0
    mov     r0,r9
    mov     r1,r2
    bl      LowerSpriteHealth
    lsl     r0,r0,0x18
    lsr     r4,r0,0x18
    mov     r0,r9
    bl      CheckSpriteMakesDebrisWhenHit
    lsl     r1,r0,0x10
    mov     r0,1
@@_80844F0:
    pop     r2
    bx      r2
    .pool

;=====================================
; Various event checks, replacing the following functions:
; NormalMissileHitSprite: 846c2 in MF_U
; SuperMissileHitSprite: 8479c in MF_U
; IceMissileHitSprite: 8486c in MF_U
; DiffusionMissileHitSprite: 84984 in MF_U
; DiffusionFlakeHitSprite: 84b60 in MF_U
; [OK]
;=====================================
.org 0x808531E   ; 0x80846c2
    .fill 0x56D,0x0     ;zero out vanilla functions

.org 0x808531E
; begins 2 bytes before the vanilla function
RecoveringSuitCutsceneFix:
    push    r14
    orr     r1,r3
    strb    r1,[r2,0xC]
    bl      CheckAdvanceEvent
    pop     r0
    bx      r0

; Handle NOC SA-X encounter
sub_80846D0:
    push    r14
    bl      CheckOnEvent_NocSaxEncounter
    cmp     r0,0
    bne     @@_808473A
    ldr     r0,=EventCounter
    ldrb    r1,[r0]
    cmp     r1,0x2F
    bcs     @@_8084704
    ldr     r1,=Equipment
    ldrb    r1,[r1,0xC]
    mov     r2,0x10
    and     r2,r1
    cmp     r2,0x10
    beq     @@_808472A
    ldr     r1,=RoomID
    ldrb    r2,[r1]
    cmp     r2,0x1A
    bne     @@_808472A
    ldr     r1,=SamusData
    ldrh    r1,[r1,0x18]
    lsr     r1,r1,6
    cmp     r1,0x10
    bcc     @@_808472A
    mov     r2,0x2F
    strb    r2,[r0]
@@_8084704:
    ldr     r1,=RoomID
    ldrb    r2,[r1]
    cmp     r2,0x1B
    bne     @@_808472A
    ldr     r1,=0x2026226 ; clipdata?
    ldrh    r2,[r1]
    cmp     r2,0
    beq     @@_808472E
    ldr     r1,=0x2026300 ; clipdata?
    mov     r2,0x1A
    add     r2,r1,r2
    ldrh    r2,[r2]
    cmp     r2,0
    beq     @@_808472E
    mov     r2,0x3C
    add     r2,r1,r2
    ldrh    r2,[r2]
    cmp     r2,0
    beq     @@_808472E
@@_808472A:
    mov     r0,0
    b       @@_808473A
@@_808472E:
    mov     r1,0x30
    strb    r1,[r0]
    ldr     r1,=SubEventCounter
    mov     r2,0x45
    strb    r2,[r1]
    mov     r0,2
@@_808473A:
    pop     r1
    bx      r1
    .pool

sub_808475C:
    push    r14
    bl      Sax_WalkingStart
    ldr     r0,=CurrSpriteData
    mov     r12,r0
    mov     r1,r12
    add     r1,0x24
    mov     r0,0x1A
    strb    r0,[r1]
    pop     r2
    bx      r2

sub_8084772:
    push    r14
    bl      Sax_WalkingStart
    ldr     r0,=CurrSpriteData
    mov     r12,r0
    ldrh    r1,[r0]
    mov     r0,0x80
    lsl     r0,r0,3
    orr     r0,r1
    mov     r1,r12
    strh    r0,[r1]
    add     r1,0x24
    mov     r0,0x18
    strb    r0,[r1]
    pop     r2
    bx      r2
    .pool

sub_8084798:
    push    r14
    bl      CheckOnEvent_EscapedNocSax
    cmp     r0,0
    bne     @@_80847AA
    mov     r1,0x10
    ldr     r0,=SuitMiscStatus ; 0x300131C
    ldrb    r0,[r0]
    and     r0,r1
@@_80847AA:
    pop     r1
    bx      r1
sub_80847AE:
    push    r14
    ldr     r1,=AreaID
    ldrh    r0,[r1]
    ldr     r1,=0x1406
    cmp     r0,r1
    bne     @@_80847D2
    ldr     r1,=Equipment
    ldrb    r0,[r1,0xA]
    mov     r1,8
    and     r0,r1
    cmp     r0,0
    bne     @@_80847D2
    ldr     r1,=EventCounter
    ldrb    r0,[r1]
    cmp     r0,0x58
    bcs     @@_80847D2
    mov     r0,0x58
    strb    r0,[r1]
@@_80847D2:
    bl      CheckOnEvent_RestrictedZoneWarning
    pop     r1
    bx      r1
    .pool

sub_80847F0:
    push    r4,r14
    ldr     r1,=EventData_8084A30 ; 0x8084A30
@@_80847F4:
    ldrb    r0,[r1]
    cmp     r0,0xFF
    beq     @@_8084832
    ldr     r3,=Equipment
    add     r3,r0,r3
    ldrb    r0,[r3]
    ldrb    r2,[r1,1]
    add     r1,2
    and     r0,r2
    cmp     r0,0
    beq     @@_8084822
    ldr     r2,=AreaID
    ldrb    r2,[r2]
@@_808480E:
    ldrb    r0,[r1,1]
    cmp     r0,0xFF
    beq     @@_808482C
    cmp     r0,r2
    bne     @@_808481E
    ldrb    r0,[r1,2]
    cmp     r0,r5
    beq     @@_8084830
@@_808481E:
    add     r1,4
    b       @@_808480E
@@_8084822:
    ldrb    r0,[r1,1]
    cmp     r0,0xFF
    beq     @@_808482C
    add     r1,4
    b       @@_8084822
@@_808482C:
    add     r1,2
    b       @@_80847F4
@@_8084830:
    ldrb    r0,[r1,3]
@@_8084832:
    pop     r4
    pop     r1
    bx      r1
    .pool

sub_8084844:
    push    r4,r5,r14
    ldr     r2,=AreaID
    ldrb    r2,[r2]
    ldr     r3,=EventData_8084958 ; 0x8084958
    ldr     r4,=EventCounter
    ldrb    r1,[r4]
@@_8084850:
    ldrb    r0,[r3]
    cmp     r0,r1
    bgt     @@_8084876
    bne     @@_8084870
    ldrb    r0,[r3,1]
    cmp     r0,r2
    bne     @@_8084870
    ldrb    r0,[r3,2]
    cmp     r0,r5
    bne     @@_8084870
    ldrb    r0,[r3,3]
    cmp     r0,0
    bne     @@_8084874
    bl      sub_806099C ; 0x806099C
    b       @@_8084874
@@_8084870:
    add     r3,4
    b       @@_8084850
@@_8084874:
    strb    r0,[r4]
@@_8084876:
    pop     r4,r5
    pop     r1
    bx      r1
    .pool

sub_8084888:
    push    r14
    ldrb    r0,[r4]
    cmp     r0,0
    bne     @@_80848E2
    ldr     r2,=EventData_8084986 ; 0x8084986
@@_8084892:
    ldr     r1,=AreaID
    ldrh    r1,[r1]
@@_8084896:
    ldrh    r0,[r2]
    cmp     r0,r1
    beq     @@_80848A6
    ldrb    r0,[r2,1]
    cmp     r0,0xFF
    beq     @@_80848E2
    add     r2,6
    b       @@_8084896
@@_80848A6:
    ldrb    r0,[r2,2]
    ldr     r1,=Equipment
    add     r1,r0,r1
    ldrb    r1,[r1]
    ldrb    r0,[r2,3]
    and     r0,r1
    cmp     r0,0
    bne     @@_80848BA
    add     r2,6
    b       @@_8084892
@@_80848BA:
    ldrb    r0,[r2,5]
    cmp     r0,1
    beq     @@_80848D2
    ldr     r0,[sp,0x34]
    str     r0,[r5,8]
    ldr     r1,=SpritesetNum
    add     r0,sp,0x38
    ldrb    r0,[r0]
    strb    r0,[r1]
    mov     r0,2
    strb    r0,[r4]
    b       @@_80848E2
@@_80848D2:
    ldr     r0,[sp,0x2C]
    str     r0,[r5,8]
    ldr     r1,=SpritesetNum
    add     r0,sp,0x30
    ldrb    r0,[r0]
    strb    r0,[r1]
    mov     r0,1
    strb    r0,[r4]
@@_80848E2:
    ldrb    r0,[r4]
    pop     r1
    bx      r1
    .pool

;=====================================
; Event data [OK]
;=====================================
EventData_80848F8:
    .byte 0x00, 0x27, 0x09
    .byte 0x07, 0x00, 0x26, 0x0e, 0x0a, 0x01, 0x28, 0x12
    .byte 0x0f, 0x01, 0x04, 0x12, 0x10, 0x01, 0x09, 0x12
    .byte 0x10, 0x01, 0x0d, 0x12, 0x10, 0x01, 0x0f, 0x12
    .byte 0x10, 0x01, 0x20, 0x12, 0x10, 0x02, 0x08, 0x18
    .byte 0x16, 0x02, 0x12, 0x1a, 0x19, 0x04, 0x2a, 0x20
    .byte 0x1d, 0x06, 0x1b, 0x28, 0x31, 0x06, 0x0d, 0x34
    .byte 0x33, 0x00, 0x45, 0x3d, 0x3f, 0x05, 0x05, 0x44
    .byte 0x42, 0x00, 0x12, 0x44, 0x46, 0x00, 0x2e, 0x44
    .byte 0x46, 0x02, 0x16, 0x44, 0x47, 0x00, 0x39, 0x4a
    .byte 0x44, 0x05, 0x05, 0x4a, 0x42, 0x00, 0x56, 0x4a
    .byte 0x49, 0x02, 0x3b, 0x4a, 0x4d, 0x01, 0x1b, 0x64
    .byte 0x60, 0xff, 0xff, 0xff, 0xff
EventData_8084958:    
    .byte 0x19, 0x02, 0x07
    .byte 0x1a, 0x27, 0x03, 0x25, 0x00, 0x28, 0x06, 0x23
    .byte 0x2c, 0x29, 0x06, 0x23, 0x2c, 0x42, 0x05, 0x05
    .byte 0x44, 0x44, 0x00, 0x32, 0x45, 0x44, 0x00, 0x83
    .byte 0x00, 0x44, 0x00, 0x24, 0x00, 0x45, 0x00, 0x24
    .byte 0x00, 0x46, 0x00, 0xc3, 0x00, 0x4a, 0x00, 0x7d
    .byte 0x4b, 0xff, 0xff
EventData_8084986:
    .byte 0x02, 0x00, 0x0a, 0x04, 0x00
    .byte 0x02, 0x02, 0x04, 0x0a, 0x04, 0x00, 0x02, 0x02
    .byte 0x05, 0x0a, 0x04, 0x00, 0x02, 0x02, 0x09, 0x0a
    .byte 0x04, 0x00, 0x02, 0x02, 0x0a, 0x0a, 0x04, 0x00
    .byte 0x02, 0x02, 0x13, 0x0a, 0x04, 0x00, 0x02, 0x02
    .byte 0x1b, 0x0a, 0x04, 0x00, 0x01, 0x02, 0x1e, 0x0a
    .byte 0x04, 0x00, 0x01, 0x02, 0x1f, 0x0a, 0x04, 0x00
    .byte 0x02, 0x02, 0x2c, 0x0a, 0x04, 0x00, 0x01, 0x02
    .byte 0x2e, 0x0a, 0x04, 0x00, 0x01, 0x03, 0x00, 0x0d
    .byte 0x0e, 0x00, 0x01, 0x03, 0x03, 0x0d, 0x0e, 0x00
    .byte 0x01, 0x03, 0x05, 0x0d, 0x0e, 0x00, 0x01, 0x03
    .byte 0x06, 0x0d, 0x0e, 0x00, 0x01, 0x03, 0x0a, 0x0d
    .byte 0x0e, 0x00, 0x01, 0x03, 0x1e, 0x0d, 0x0e, 0x00
    .byte 0x01, 0x05, 0x18, 0x0b, 0x20, 0x00, 0x02, 0x05
    .byte 0x2b, 0x0b, 0x20, 0x00, 0x01, 0x06, 0x03, 0x0c
    .byte 0x10, 0x00, 0x01, 0x06, 0x04, 0x0c, 0x10, 0x00
    .byte 0x01, 0x06, 0x05, 0x0c, 0x10, 0x00, 0x01, 0x06
    .byte 0x06, 0x0c, 0x10, 0x00, 0x01, 0x06, 0x07, 0x0c
    .byte 0x10, 0x00, 0x01, 0x06, 0x08, 0x0c, 0x10, 0x00
    .byte 0x01, 0x06, 0x0a, 0x0c, 0x10, 0x00, 0x01, 0x06
    .byte 0x19, 0x0c, 0x10, 0x00, 0x01, 0x06, 0x1c, 0x0c
    .byte 0x10, 0x00, 0x01, 0xff, 0xff
EventData_8084A30:   
    .byte 0x0a, 0x04, 0x00
    .byte 0x00, 0x6f, 0x86, 0x00, 0x00, 0x72, 0x88, 0x00
    .byte 0x00, 0x77, 0x89, 0x00, 0x00, 0x85, 0x8a, 0x00
    .byte 0x02, 0x31, 0x4e, 0x00, 0x02, 0x34, 0x4d, 0x00
    .byte 0x02, 0x46, 0x50, 0x00, 0x02, 0x74, 0x7a, 0x00
    .byte 0x02, 0x77, 0x79, 0x00, 0x02, 0x8c, 0x8d, 0xff
    .byte 0xff, 0x0b, 0x20, 0x00, 0x02, 0x1b, 0x68, 0x00
    .byte 0x02, 0x23, 0x69, 0x00, 0x02, 0x2a, 0x64, 0x00
    .byte 0x02, 0x5f, 0x6a, 0x00, 0x02, 0x6e, 0x70, 0x00
    .byte 0x05, 0x28, 0x6c, 0x00, 0x05, 0x2d, 0x62, 0xff
    .byte 0xff, 0x0b, 0x02, 0x00, 0x03, 0x0c, 0x2f, 0x00
    .byte 0x03, 0x14, 0x30, 0x00, 0x03, 0x2d, 0x2e, 0x00
    .byte 0x03, 0x3b, 0x3f, 0xff, 0xff, 0x0c, 0x10, 0x00
    .byte 0x06, 0x10, 0x48, 0x00, 0x06, 0x13, 0x49, 0x00
    .byte 0x06, 0x2f, 0x4a, 0xff, 0xff, 0x0c, 0x08, 0x00
    .byte 0x00, 0x96, 0x22, 0x00, 0x00, 0x98, 0x20, 0xff
    .byte 0xff, 0xff, 0xff
EventData_8084AAE:
    .byte 0x01, 0x28, 0x01, 0x0f, 0x03
    .byte 0x19, 0x02, 0x3c, 0x02, 0x16, 0x04, 0x4e, 0x06
    .byte 0x10, 0x08, 0x5b, 0x00, 0x3f, 0x10, 0x6b, 0x00
    .byte 0x27, 0x01, 0x07, 0x03, 0x15, 0x02, 0x26, 0x05
    .byte 0x05, 0x04, 0x3a, 0x04, 0x04, 0x08, 0x56, 0x02
    .byte 0x08, 0x10, 0x16, 0x05, 0x05, 0x20, 0x42, 0x02
    .byte 0x12, 0x01, 0x19, 0x04, 0x2a, 0x02, 0x1d, 0x00
    .byte 0x56, 0x04, 0x49, 0x01, 0x1b, 0x08, 0x60, 0x06
    .byte 0x19, 0x10, 0x33, 0x05, 0x14, 0x20, 0x51, 0x00
    .byte 0x26, 0x40, 0x0a, 0x00, 0x00, 0x00, 0x00
EventData_8084AFA:
    .byte 0x00
    .byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
    .byte 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10
    .byte 0x11, 0x12, 0x00
EventData_8084B0E:
    .byte 0x02, 0x0a, 0x0f, 0x19, 0x1d
    .byte 0x28, 0x32, 0x33, 0x3d, 0x49, 0x4e, 0x51, 0x5b
    .byte 0x60, 0x66, 0xff
EventData_8084B1E:
    .byte 0x0e, 0x3a, 0x4a, 0x56, 0x64, 0x6b, 0x6b, 0x6b
EventData_8084B26:
    .byte 0x04, 0x23, 0x37, 0x53, 0x13, 0x3d, 0x6b, 0x6b
EventData_8084B2E:
    .byte 0x18, 0x1a, 0x44, 0x5b, 0x28, 0x4e, 0x09, 0x64
EventData_8084B36:
    .byte 0x02, 0x12, 0x20, 0x34, 0x51, 0x6b, 0x6b, 0x6b

;=====================================
; InitChargedNormalBeam: 84d74
; ProcessChargedNormalBeam: 84e18
; InitNormalBeam: 84e88
; ProcessNormalBeam: 84f34
; [OK]
;=====================================
.org 0x80859D0
    .fill 0x22C,0x0     ;zero out vanilla functions

.org 0x80859D0
;InitChargedNormalBeam:
HandleProjectile_84D74:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckVerticalCollisionAtPosition
    cmp     r0,0
    beq     @@_8084D8E
    mov     r2,3
    bl      sub_808642E ; 0x808642E
    b       @@_8084E2E
@@_8084D8E:
    ldrb    r0,[r4,0x12]
    cmp     r0,0
    beq     @@_8084DA6
    cmp     r0,1
    beq     @@_8084DAC
    mov     r0,0x18
    bl      MoveProjectile
    mov     r2,0xF
    bl      sub_8086414 ; 0x8086414
    b       @@_8084DB8
@@_8084DA6:
    bl      @@_8084DC0 ; 0x8084DC0
    b       @@_8084DB2
@@_8084DAC:
    mov     r0,0x10
    bl      MoveProjectile
@@_8084DB2:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
@@_8084DB8:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8084E2E
@@_8084DC0:
    push    r4,r14
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xA]
    mov     r0,0x10
    tst     r0,r4
    bne     @@_8084DD6
    mov     r0,0xC8
    bl      PlaySound
    mov     r0,0x10
    b       @@_8084DDE
@@_8084DD6:
    mov     r0,0xF1
    bl      PlaySound
    mov     r0,0xC
@@_8084DDE:
    mov     r1,0x10
    bl      sub_8084F6C ; 0x8084F6C
    sub     r0,1
    cmp     r0,4
    bhi     @@_8084E20
    lsl     r0,r0,2
    ldr     r1,=@@_8084E5C ; 0x8084E5C
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8084DF4:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8084DFC:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8084E06
    ; OAM, seems to be 0x790 behind in MF_J
    ldr     r0,=0x858DF9C ; 0x858D80C
    b       @@_8084E2C
@@_8084E06:
    ldr     r0,=0x858E9A8 ; 0x858E218
    b       @@_8084E2C
@@_8084E0A:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8084E12:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8084E1C
    ldr     r0,=0x858DFB4 ; 0x858D824
    b       @@_8084E2C
@@_8084E1C:
    ldr     r0,=0x858E9B8 ; 0x858E228
    b       @@_8084E2C
@@_8084E20:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8084E2A
    ldr     r0,=0x858DF84 ; 0x858D7F4
    b       @@_8084E2C
@@_8084E2A:
    ldr     r0,=0x858E998 ; 0x858E208
@@_8084E2C:
    str     r0,[r3,4]
@@_8084E2E:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8084E5C:
    .word @@_8084E20 ; 0x08084e20
    .word @@_8084DFC ; 0x08084dfc
    .word @@_8084DF4 ; 0x08084df4
    .word @@_8084E12 ; 0x08084e12
    .word @@_8084E0A ; 0x08084e0a

HandleProjectile_84E70:
    push    r4,r14         
    ldr     r4,=CurrProjectileData ; 03000B60h  
    ldr     r0,=CurrClipdataAffectingAction ; 03000053h  
    mov     r1,6h          
    strb    r1,[r0]        
    bl      ProjectileCheckVerticalCollisionAtPosition ; 0808222Ch      
    cmp     r0,0h          
    beq     @@_8084E8A ; 08084E8Ah      
    mov     r2,3h          
    bl      sub_808642E ; 0808642Eh  ; in init charged wave beam
    b       @@_8084F28 ; 08084F28h  ; in init normal beam
@@_8084E8A:
    ldrb    r0,[r4,12h]    
    cmp     r0,0h          
    beq     @@_8084EA0 ; 08084EA0h      
    cmp     r0,1h          
    beq     @@_8084EA6 ; 08084EA6h      
    mov     r0,18h         
    bl      MoveProjectile ; 08082120h      
    bl      sub_80863FC ; 080863FCh  
    b       @@_8084EB2 ; 08084EB2h   
@@_8084EA0:   
    bl      @@_8084EBA ; 08084EBAh      
    b       @@_8084EAC ; 08084EACh  
@@_8084EA6:    
    mov     r0,10h         
    bl      MoveProjectile ; 08082120h   
@@_8084EAC:   
    ldrb    r0,[r4,12h]    
    add     r0,1h          
    strb    r0,[r4,12h]  
@@_8084EB2:  
    ldrb    r0,[r4,1Eh]    
    add     r0,1h          
    strb    r0,[r4,1Eh]    
    b       @@_8084F28 ; 08084F28h   
@@_8084EBA:   
    push    r4,r14         
    ldr     r0,=Equipment ; 03001310h  
    ldrb    r4,[r0,0Ah]    
    mov     r0,10h         
    tst     r0,r4          
    bne     @@_8084ED0 ; 08084ED0h      
    mov     r0,0C8h        
    bl      PlaySound ; 0800270Ch      
    mov     r0,8h          
    b       @@_8084ED8 ; 08084ED8h    
@@_8084ED0:  
    mov     r0,0CDh        
    bl      PlaySound ; 0800270Ch      
    mov     r0,0Ch   
@@_8084ED8:      
    mov     r1,10h         
    bl      sub_8084F6C ; 08084F6Ch      
    sub     r0,1h          
    cmp     r0,4h          
    bhi     @@_8084F1A ; 08084F1Ah      
    lsl     r0,r0,2h       
    ldr     r1,=@@_8084F58 ; 08084F58h  
    add     r0,r0,r1       
    ldr     r0,[r0]        
    mov     r15,r0 
@@_8084EEE:        
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8084EF6:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8084F00
    ldr     r0,=0x858DF54 ; 0x858D7C4   ; OAM
    b       @@_8084F26
@@_8084F00:
    ldr     r0,=0x858E978 ; 0x858E1E8
    b       @@_8084F26
@@_8084F04:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8084F0C:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8084F16
    ldr     r0,=0x858DF6C ; 0x858D7DC
    b       @@_8084F26
@@_8084F16:
    ldr     r0,=0x858E988 ; 0x858E1F8
    b       @@_8084F26
@@_8084F1A:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8084F24
    ldr     r0,=0x858DF3C ; 0x858D7AC
    b       @@_8084F26
@@_8084F24:
    ldr     r0,=0x858E968 ; 0x858E1D8
@@_8084F26:
    str     r0,[r3,4]
@@_8084F28:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8084F58:
    .word @@_8084F1A ; 0x08084f1a, 
    .word @@_8084EF6 ; 0x08084ef6
    .word @@_8084EEE ; 0x08084eee
    .word @@_8084F0C ; 0x08084f0c
    .word @@_8084F04 ; 0x08084f04

sub_8084F6C:
    push    r14
    ldr     r3,=CurrProjectileData
    mov     r2,0
    strb    r2,[r3,0xE]
    strh    r2,[r3,0xC]
    sub     r2,r2,r0
    strh    r2,[r3,0x16]
    strh    r0,[r3,0x18]
    strh    r2,[r3,0x1A]
    strh    r0,[r3,0x1C]
    mov     r2,0x10
    strb    r2,[r3,0x14]
    strb    r2,[r3,0x15]
    ldrb    r2,[r3]
    orr     r1,r2
    mov     r0,0xFB
    and     r1,r0
    strb    r1,[r3]
    ldrb    r0,[r3,0x10]
    pop     r1
    bx      r1
    .pool

;=====================================
; InitBomb 85740:32 -> 0A [OK]
;=====================================
;.org 0x8085740
;    .byte 0x0a
.org 0x808639C
    mov     r0,0xA

;=====================================
;InitChargedChargeBeam: 85a0e
;ProcessChargedChargeBeam: 85b24
;InitChargeBeam: 85c30
;ProcessChargeBeam: 85d48
;InitChargedWideBeam: 85e44
;ProcessChargedWideBeam: 85f00
;InitWideBeam: 85f8c
;ProcessWideBeam: 86040
;InitChargedPlasmaBeam: 860c4
;ProcessChargedPlasmaBeam: 86184
;InitPlasmaBeam: 86210
;ProcessPlasmaBeam: 862cc
;InitChargedWaveBeam: 86350
;ProcessChargedWaveBeam: 86458
;InitWaveBeam: 864d4
;ProcessWaveBeam: 865dc
; [OK]
;=====================================
.org 0x8086668
    .fill 0xC3E,0x0     ;zero out original functions

.org 0x8086668
;InitChargedChargeBeam:
HandleProjectile_85A0C:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_8085A6E
    ldrb    r3,[r4]
    mov     r0,4
    and     r0,r3
    cmp     r0,0
    beq     @@_8085A34
    ldr     r0,=ProjectileData
    ldrb    r1,[r4,0x1F]
    lsl     r1,r1,5
    add     r1,r1,r0
    ldrb    r0,[r1,0x12]
    cmp     r0,3
    bls     @@_8085A34
    mov     r0,0xFB
    and     r0,r3
    strb    r0,[r4]
@@_8085A34:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckVerticalCollisionAtPosition
    cmp     r0,0
    beq     @@_8085A64
    ldrb    r1,[r4]
    mov     r2,4
    mov     r0,r2
    and     r0,r1
    cmp     r0,0
    beq     @@_8085A5E
    ldr     r0,=ProjectileData
    ldrb    r1,[r4,0x1F]
    lsl     r1,r1,5
    add     r1,r1,r0
    ldrb    r0,[r1,0x12]
    cmp     r0,3
    bhi     @@_8085A5E
    strb    r2,[r1,0x12]
@@_8085A5E:
    bl      sub_808642E ; 0x808642E
    b       @@_8085B36
@@_8085A64:
    ldrb    r0,[r4,0x12]
    cmp     r0,2
    bhi     @@_8085A6E
    bl      MoveWideBeamParts
@@_8085A6E:
    ldrb    r0,[r4,0x12]
    cmp     r0,4
    bhi     @@_8085AAE
    lsl     r0,r0,2
    ldr     r1,=@@_8085B68 ; 0x8085B68
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8085A7E:
    bl      @@_8085ABA ; 0x8085ABA
    b       @@_8085AA6
@@_8085A84:
    mov     r0,0x10
    bl      MoveProjectile
    b       @@_8085AA6
@@_8085A8C:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085A92:
    mov     r0,0x18
    bl      MoveProjectile
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    bne     @@_8085AB2
    mov     r2,0x10
    bl      sub_8086414 ; 0x8086414
    b       @@_8085AB2
@@_8085AA6:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
    b       @@_8085AB2
@@_8085AAE:
    mov     r0,0
    strb    r0,[r4]
@@_8085AB2:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8085B36
@@_8085ABA:
    push    r4,r14
    mov     r0,0xC
    mov     r2,0
    strb    r2,[r4,0xE]
    strh    r2,[r4,0xC]
    mov     r1,0x10
    strb    r1,[r4,0x14]
    strb    r1,[r4,0x15]
    sub     r2,r2,r0
    strh    r2,[r4,0x16]
    strh    r0,[r4,0x18]
    strh    r2,[r4,0x1A]
    strh    r0,[r4,0x1C]
    ldrb    r2,[r4,0x13]
    cmp     r2,0
    bne     @@_8085AE8
    mov     r0,0xED
    bl      PlaySound
    ldrb    r0,[r4]
    mov     r1,0xFB
    and     r1,r0
    b       @@_8085AEC
@@_8085AE8:
    ldrb    r0,[r4]
    orr     r1,r0
@@_8085AEC:
    strb    r1,[r4]
    ldrb    r2,[r4,0x13]
    ldrb    r0,[r4,0x10]
    sub     r0,1
    cmp     r0,4
    bhi     @@_8085B2A
    ldr     r1,=@@_8085B7C ; 0x8085B7C
    lsl     r0,r0,2
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8085B02:
    ldrb    r0,[r4]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r4]
@@_8085B0A:
    cmp     r2,0
    bne     @@_8085B12
    ; OAM seems to be 0x790 behind in MF_J
    ldr     r0,=0x858E1B0 ; 0x858DA20 in MF_U ; OAM pointer
    b       @@_8085B34
@@_8085B12:
    ldr     r0,=0x858E1F0 ; 0x858DA60 in MF_U ; OAM pointer
    b       @@_8085B34
@@_8085B16:
    ldrb    r0,[r4]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r4]
@@_8085B1E:
    cmp     r2,0
    bne     @@_8085B26
    ldr     r0,=0x858E1C8 ; 0x858DA38 in MF_U ; OAM pointer
    b       @@_8085B34
@@_8085B26:
    ldr     r0,=0x858E200 ; 0x858DA70 in MF_U ; OAM pointer
    b       @@_8085B34
@@_8085B2A:
    cmp     r2,0
    bne     @@_8085B32
    ldr     r0,=0x858E198 ; 0x858DA08 in MF_U ; OAM pointer
    b       @@_8085B34
@@_8085B32:
    ldr     r0,=0x858E1E0 ; 0x858DA50 in MF_U ; OAM pointer
@@_8085B34:
    str     r0,[r4,4]
@@_8085B36:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8085B68:
    .word @@_8085A7E ; 0x08085a7e
    .word @@_8085A84 ; 0x08085a84
    .word @@_8085A8C ; 0x08085a8c
    .word @@_8085A92 ; 0x08085a92
    .word @@_8085AA6 ; 0x08085aa6
@@_8085B7C:
    .word @@_8085B2A ; 0x08085b2a
    .word @@_8085B0A ; 0x08085b0a
    .word @@_8085B02 ; 0x08085b02
    .word @@_8085B1E ; 0x08085b1e
    .word @@_8085B16 ; 0x08085b16

HandleProjectile_85B90:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_8085BF2
    ldrb    r3,[r4]
    mov     r0,4
    and     r0,r3
    cmp     r0,0
    beq     @@_8085BB8
    ldr     r0,=ProjectileData
    ldrb    r1,[r4,0x1F]
    lsl     r1,r1,5
    add     r1,r1,r0
    ldrb    r0,[r1,0x12]
    cmp     r0,3
    bls     @@_8085BB8
    mov     r0,0xFB
    and     r0,r3
    strb    r0,[r4]
@@_8085BB8:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckVerticalCollisionAtPosition
    cmp     r0,0
    beq     @@_8085BE8
    ldrb    r1,[r4]
    mov     r2,4
    mov     r0,r2
    and     r0,r1
    cmp     r0,0
    beq     @@_8085BE2
    ldr     r0,=ProjectileData
    ldrb    r1,[r4,0x1F]
    lsl     r1,r1,5
    add     r1,r1,r0
    ldrb    r0,[r1,0x12]
    cmp     r0,3
    bhi     @@_8085BE2
    strb    r2,[r1,0x12]
@@_8085BE2:
    bl      sub_808642E ; 0x808642E
    b       @@_8085CAE
@@_8085BE8:
    ldrb    r0,[r4,0x12]
    cmp     r0,2
    bhi     @@_8085BF2
    bl      MoveWideBeamParts
@@_8085BF2:
    ldrb    r0,[r4,0x12]
    cmp     r0,4
    bhi     @@_8085C26
    lsl     r0,r0,2
    ldr     r1,=@@_8085CE0 ; 0x8085CE0
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8085C02:
    bl      @@_8085C32 ; 0x8085C32
    b       @@_8085C1E
@@_8085C08:
    mov     r0,0x10
    bl      MoveProjectile
    b       @@_8085C1E
@@_8085C10:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085C16:
    mov     r0,0x18
    bl      MoveProjectile
    b       @@_8085C2A
@@_8085C1E:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
    b       @@_8085C2A
@@_8085C26:
    mov     r0,0
    strb    r0,[r4]
@@_8085C2A:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8085CAE
@@_8085C32:
    push    r4,r14
    mov     r0,0xC
    mov     r2,0
    strb    r2,[r4,0xE]
    strh    r2,[r4,0xC]
    mov     r1,0x10
    strb    r1,[r4,0x14]
    strb    r1,[r4,0x15]
    sub     r2,r2,r0
    strh    r2,[r4,0x16]
    strh    r0,[r4,0x18]
    strh    r2,[r4,0x1A]
    strh    r0,[r4,0x1C]
    ldrb    r2,[r4,0x13]
    cmp     r2,0
    bne     @@_8085C60
    mov     r0,0xCA
    bl      PlaySound
    ldrb    r0,[r4]
    mov     r1,0xFB
    and     r1,r0
    b       @@_8085C64
@@_8085C60:
    ldrb    r0,[r4]
    orr     r1,r0
@@_8085C64:
    strb    r1,[r4]
    ldrb    r2,[r4,0x13]
    ldrb    r0,[r4,0x10]
    sub     r0,1
    cmp     r0,4
    bhi     @@_8085CA2
    ldr     r1,=@@_8085CF4 ; 0x8085CF4
    lsl     r0,r0,2
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8085C7A:
    ldrb    r0,[r4]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r4]
@@_8085C82:
    cmp     r2,0
    bne     @@_8085C8A
    ; OAM seems to be 0x790 behind in MF_J
    ldr     r0,=0x858E138 ; 0x858D9A8
    b       @@_8085CAC
@@_8085C8A:
    ldr     r0,=0x858E178 ; 0x858D9E8
    b       @@_8085CAC
@@_8085C8E:
    ldrb    r0,[r4]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r4]
@@_8085c96:
    cmp     r2,0
    bne     @@_8085C9E
    ldr     r0,=0x858E150 ; 0x858D9C0
    b       @@_8085CAC
@@_8085C9E:
    ldr     r0,=0x858E188 ; 0x858D9F8
    b       @@_8085CAC
@@_8085CA2:
    cmp     r2,0
    bne     @@_8085CAA
    ldr     r0,=0x858E120 ; 0x858D990
    b       @@_8085CAC
@@_8085CAA:
    ldr     r0,=0x858E168 ; 0x858D9D8
@@_8085CAC:
    str     r0,[r4,4]
@@_8085CAE:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8085CE0:
    .word @@_8085C02 ; 0x08085c02
    .word @@_8085C08 ; 0x08085c08
    .word @@_8085C10 ; 0x08085c10
    .word @@_8085C16 ; 0x08085c16
    .word @@_8085C1E ; 0x08085c1e
@@_8085CF4:
    .word @@_8085CA2 ; 0x08085ca2
    .word @@_8085C82 ; 0x08085c82
    .word @@_8085C7A ; 0x08085c7a
    .word @@_8085c96 ; 0x08085c96
    .word @@_8085C8E ; 0x08085c8e

HandleProjectile_85D08:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_8085D1C
    ldrb    r0,[r4,0x12]
    cmp     r0,8
    bhi     @@_8085D1C
    bl      MoveWideBeamParts
@@_8085D1C:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckVerticalCollisionAtPosition
    cmp     r0,0
    beq     @@_8085D32
    mov     r2,5
    bl      sub_808642E ; 0x808642E
    b       @@_8085DDA
@@_8085D32:
    ldrb    r0,[r4,0x12]
    cmp     r0,0
    beq     @@_8085D52
    cmp     r0,1
    beq     @@_8085D58
    cmp     r0,8
    bhi     @@_8085D44
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085D44:
    mov     r0,0x18
    bl      MoveProjectile
    mov     r2,0x11
    bl      sub_8086414 ; 0x8086414
    b       @@_8085D64
@@_8085D52:
    bl      @@_8085D6C ; 0x8085D6C
    b       @@_8085D5E
@@_8085D58:
    mov     r0,0x10
    bl      MoveProjectile
@@_8085D5E:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085D64:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8085DDA
@@_8085D6C:
    push    r4,r14
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xA]
    mov     r0,0x10
    tst     r0,r4
    bne     @@_8085D82
    mov     r0,0xEE
    bl      PlaySound
    mov     r0,0x14
    b       @@_8085D8A
@@_8085D82:
    mov     r0,0xF1
    bl      PlaySound
    mov     r0,0xC
@@_8085D8A:
    mov     r1,0x10
    bl      sub_8084F6C ; 0x8084F6C
    sub     r0,1
    cmp     r0,4
    bhi     @@_8085DCC
    lsl     r0,r0,2
    ldr     r1,=@@_8085E08 ; 0x8085E08
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8085DA0:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8085DA8:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085DB2
    ; 
    ldr     r0,=0x858E3E4 ; 0x858DC54
    b       @@_8085DD8
@@_8085DB2:
    ldr     r0,=0x858E9A8 ; 0x858E218
    b       @@_8085DD8
@@_8085DB6:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8085DBE:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085DC8
    ldr     r0,=0x858E3FC ; 0x858DC6C
    b       @@_8085DD8
@@_8085DC8:
    ldr     r0,=0x858E9B8 ; 0x858E228
    b       @@_8085DD8
@@_8085DCC:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085DD6
    ldr     r0,=0x858E3CC ; 0x858DC3C
    b       @@_8085DD8
@@_8085DD6:
    ldr     r0,=0x858E998 ; 0x858E208
@@_8085DD8:
    str     r0,[r3,4]
@@_8085DDA:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8085E08:
    .word @@_8085DCC ; 0x08085dcc
    .word @@_8085DA8 ; 0x08085da8
    .word @@_8085DA0 ; 0x08085da0
    .word @@_8085DBE ; 0x08085dbe
    .word @@_8085DB6 ; 0x08085db6

; Handle uncharged wide beam?
HandleProjectile_85E1C:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_8085E30
    ldrb    r0,[r4,0x12]
    cmp     r0,8
    bhi     @@_8085E30
    bl      MoveWideBeamParts
@@_8085E30:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckVerticalCollisionAtPosition
    cmp     r0,0
    beq     @@_8085E46
    mov     r2,5
    bl      sub_808642E ; 0x808642E
    b       @@_8085EEC
@@_8085E46:
    ldrb    r0,[r4,0x12]
    cmp     r0,0
    beq     @@_8085E64
    cmp     r0,1
    beq     @@_8085E6A
    cmp     r0,8
    bhi     @@_8085E58
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085E58:
    mov     r0,0x18
    bl      MoveProjectile
    bl      sub_80863FC ; 0x80863FC
    b       @@_8085E76
@@_8085E64:
    bl      @@_8085E7E ; 0x8085E7E
    b       @@_8085E70
@@_8085E6A:
    mov     r0,0x10
    bl      MoveProjectile
@@_8085E70:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085E76:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8085EEC
@@_8085E7E:
    push    r4,r14
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xA]
    mov     r0,0x10
    tst     r0,r4
    bne     @@_8085E94
    mov     r0,0xC9
    bl      PlaySound
    mov     r0,0x10
    b       @@_8085E9C
@@_8085E94:
    mov     r0,0xCD
    bl      PlaySound
    mov     r0,0xC
@@_8085E9C:
    mov     r1,0x10
    bl      sub_8084F6C ; 0x8084F6C
    sub     r0,1
    cmp     r0,4
    bhi     @@_8085EDE
    lsl     r0,r0,2
    ldr     r1,=@@_8085F1C ; 0x8085F1C
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8085EB2:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8085EBA:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085EC4
    ; OAM seems to be 0x790 behind in MF_J
    ldr     r0,=0x858E38C ; 0x858DBFC
    b       @@_8085EEA
@@_8085EC4:
    ldr     r0,=0x858E978 ; 0x858E1E8
    b       @@_8085EEA
@@_8085EC8:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8085ED0:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085EDA
    ldr     r0,=0x858E3AC ; 0x858DC1C
    b       @@_8085EEA
@@_8085EDA:
    ldr     r0,=0x858E988 ; 0x858E1F8
    b       @@_8085EEA
@@_8085EDE:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085EE8
    ldr     r0,=0x858E36C ; 0x858DBDC
    b       @@_8085EEA
@@_8085EE8:
    ldr     r0,=0x858E968 ; 0x858E1D8
@@_8085EEA:
    str     r0,[r3,4]
@@_8085EEC:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8085F1C:
    .word @@_8085EDE ; 0x08085ede
    .word @@_8085EBA ; 0x08085eba
    .word @@_8085EB2 ; 0x08085eb2
    .word @@_8085ED0 ; 0x08085ed0
    .word @@_8085EC8 ; 0x08085ec8

HandleProjectile_85F30:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_8085F44
    ldrb    r0,[r4,0x12]
    cmp     r0,8
    bhi     @@_8085F44
    bl      MoveWideBeamParts
@@_8085F44:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckVerticalCollisionAtPosition
    cmp     r0,0
    beq     @@_8085F5A
    mov     r2,6
    bl      sub_808642E ; 0x808642E
    b       @@_8086002
@@_8085F5A:
    ldrb    r0,[r4,0x12]
    cmp     r0,0
    beq     @@_8085F7A
    cmp     r0,1
    beq     @@_8085F80
    cmp     r0,8
    bhi     @@_8085F6C
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085F6C:
    mov     r0,0x18
    bl      MoveProjectile
    mov     r2,0x12
    bl      sub_8086414 ; 0x8086414
    b       @@_8085F8C
@@_8085F7A:
    bl      @@_8085F94 ; 0x8085F94
    b       @@_8085F86
@@_8085F80:
    mov     r0,0x10
    bl      MoveProjectile
@@_8085F86:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
@@_8085F8C:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8086002
@@_8085F94:
    push    r4,r14
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xA]
    mov     r0,0x10
    tst     r0,r4
    bne     @@_8085FAA
    mov     r0,0xEF
    bl      PlaySound
    mov     r0,0x14
    b       @@_8085FB2
@@_8085FAA:
    mov     r0,0xF1
    bl      PlaySound
    mov     r0,0xC
@@_8085FB2:
    mov     r1,0x10
    bl      sub_8084F6C ; 0x8084F6C
    sub     r0,1
    cmp     r0,4
    bhi     @@_8085FF4
    lsl     r0,r0,2
    ldr     r1,=@@_8086030 ; 0x8086030
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8085FC8:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8085FD0:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085FDA
    ; This OAM seems to be 0x790 behind in MF_J
    ldr     r0,=0x858E5E4 ; 0x858DE54
    b       @@_8086000
@@_8085FDA:
    ldr     r0,=0x858E9A8 ; 0x858E218
    b       @@_8086000
@@_8085FDE:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8085FE6:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085FF0
    ldr     r0,=0x858E5FC ; 0x858DE6C
    b       @@_8086000
@@_8085FF0:
    ldr     r0,=0x858E9B8 ; 0x858E228
    b       @@_8086000
@@_8085FF4:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8085FFE
    ldr     r0,=0x858E5CC ; 0x858DE3C
    b       @@_8086000
@@_8085FFE:
    ldr     r0,=0x858E998 ; 0x858E208
@@_8086000:
    str     r0,[r3,4]
@@_8086002:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8086030:
    .word @@_8085FF4 ; 0x08085ff4
    .word @@_8085FD0 ; 0x08085fd0
    .word @@_8085FC8 ; 0x08085fc8
    .word @@_8085FE6 ; 0x08085fe6
    .word @@_8085FDE ; 0x08085fde

HandleProjectile_86044:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_8086058
    ldrb    r0,[r4,0x12]
    cmp     r0,8
    bhi     @@_8086058
    bl      MoveWideBeamParts
@@_8086058:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckVerticalCollisionAtPosition
    cmp     r0,0
    beq     @@_808606E
    mov     r2,6
    bl      sub_808642E ; 0x808642E
    b       @@_8086114
@@_808606E:
    ldrb    r0,[r4,0x12]
    cmp     r0,0
    beq     @@_808608C
    cmp     r0,1
    beq     @@_8086092
    cmp     r0,8
    bhi     @@_8086080
    add     r0,1
    strb    r0,[r4,0x12]
@@_8086080:
    mov     r0,0x18
    bl      MoveProjectile
    bl      sub_80863FC ; 0x80863FC
    b       @@_808609E
@@_808608C:
    bl      @@_80860A6 ; 0x80860A6
    b       @@_8086098
@@_8086092:
    mov     r0,0x10
    bl      MoveProjectile
@@_8086098:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
@@_808609E:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8086114
@@_80860A6:
    push    r4,r14
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xA]
    mov     r0,0x10
    tst     r0,r4
    bne     @@_80860BC
    mov     r0,0xCB
    bl      PlaySound
    mov     r0,0xC
    b       @@_80860C4
@@_80860BC:
    mov     r0,0xCD
    bl      PlaySound
    mov     r0,0xC
@@_80860C4:
    mov     r1,0x10
    bl      sub_8084F6C ; 0x8084F6C
    sub     r0,1
    cmp     r0,4
    bhi     @@_8086106
    lsl     r0,r0,2
    ldr     r1,=@@_8086144 ; 0x8086144
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_80860DA:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_80860E2:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_80860EC
    ldr     r0,=0x858E59C ; 0x858DE0C
    b       @@_8086112
@@_80860EC:
    ldr     r0,=0x858E978 ; 0x858E1E8
    b       @@_8086112
@@_80860F0:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_80860F8:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8086102
    ldr     r0,=0x858E5B4 ; 0x858DE24
    b       @@_8086112
@@_8086102:
    ldr     r0,=0x858E988 ; 0x858E1F8
    b       @@_8086112
@@_8086106:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8086110
    ldr     r0,=0x858E584 ; 0x858DDF4
    b       @@_8086112
@@_8086110:
    ldr     r0,=0x858E968 ; 0x858E1D8
@@_8086112:
    str     r0,[r3,4]
@@_8086114:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_8086144:
    .word @@_8086106 ; 0x08086106
    .word @@_80860E2 ; 0x080860e2
    .word @@_80860DA ; 0x080860da
    .word @@_80860F8 ; 0x080860f8
    .word @@_80860F0 ; 0x080860f0

HandleProjectile_86158:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_808616C
    ldrb    r0,[r4,0x12]
    cmp     r0,2
    bls     @@_808616C
    bl      MoveWaveBeamParts
@@_808616C:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckHittingSolid
    ldrb    r0,[r4,0x12]
    cmp     r0,0
    beq     @@_80861A4
    cmp     r0,1
    beq     @@_80861AA
    cmp     r0,2
    beq     @@_80861B2
    mov     r0,0x1C
    bl      MoveProjectile
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xA]
    mov     r0,4
    tst     r0,r1
    bne     @@_808619C
    mov     r2,0x11
    bl      sub_8086414 ; 0x8086414
    b       @@_80861C0
@@_808619C:
    mov     r2,0x13
    bl      sub_8086414 ; 0x8086414
    b       @@_80861C0
@@_80861A4:
    bl      @@_80861C8 ; 0x80861C8
    b       @@_80861B8
@@_80861AA:
    mov     r0,0x10
    bl      MoveProjectile
    b       @@_80861B8
@@_80861B2:
    mov     r0,0x18
    bl      MoveProjectile
@@_80861B8:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
    b       @@_8086264
@@_80861C0:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_8086264
@@_80861C8:
    push    r4,r14
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xA]
    mov     r0,0x10
    tst     r0,r4
    bne     @@_80861EE
    mov     r0,4
    tst     r0,r4
    bne     @@_80861E4
    mov     r0,0xF0
    bl      PlaySound
    mov     r0,0x14
    b       @@_80861F6
@@_80861E4:
    mov     r0,0xF0
    bl      PlaySound
    mov     r0,0x14
    b       @@_80861F6
@@_80861EE:
    mov     r0,0xF1
    bl      PlaySound
    mov     r0,0xC
@@_80861F6:
    mov     r1,0x18
    bl      sub_8084F6C ; 0x8084F6C
    sub     r0,1
    cmp     r0,4
    bhi     @@_808624C
    lsl     r0,r0,2
    ldr     r1,=@@_80862A0 ; 0x80862A0
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_808620C:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8086214:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8086228
    mov     r0,4
    tst     r4,r0
    bne     @@_8086224
    ; I'll assume the OAM is 0x790 behind in MF_J, like before
    ldr     r0,=0x858E3E4 ; 0x858DC54
    b       @@_8086262
@@_8086224:
    ldr     r0,=0x858E73C ; 0x858DFAC
    b       @@_8086262
@@_8086228:
    ldr     r0,=0x858E9A8 ; 0x858E218
    b       @@_8086262
@@_808622C:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_8086234:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8086248
    mov     r0,4
    tst     r4,r0
    bne     @@_8086244
    ldr     r0,=0x858E3FC ; 0x858DC6C
    b       @@_8086262
@@_8086244:
    ldr     r0,=0x858E754 ; 0x858DFC4
    b       @@_8086262
@@_8086248:
    ldr     r0,=0x858E9B8 ; 0x858E228
    b       @@_8086262
@@_808624C:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8086260
    mov     r0,4
    tst     r4,r0
    bne     @@_808625C
    ldr     r0,=0x858E3CC ; 0x858DC3C
    b       @@_8086262
@@_808625C:
    ldr     r0,=0x858E724 ; 0x858DF94
    b       @@_8086262
@@_8086260:
    ldr     r0,=0x858E998 ; 0x858E208
@@_8086262:
    str     r0,[r3,4]
@@_8086264:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_80862A0:
    .word @@_808624C ; 0x0808624c
    .word @@_8086214 ; 0x08086214
    .word @@_808620C ; 0x0808620c
    .word @@_8086234 ; 0x08086234
    .word @@_808622C ; 0x0808622c

HandleProjectile_862B4:
    push    r4,r14
    ldr     r4,=CurrProjectileData
    ldrb    r0,[r4,0x13]
    cmp     r0,0
    beq     @@_80862C8
    ldrb    r0,[r4,0x12]
    cmp     r0,2
    bls     @@_80862C8
    bl      MoveWaveBeamParts
@@_80862C8:
    ldr     r0,=CurrClipdataAffectingAction
    mov     r1,6
    strb    r1,[r0]
    bl      ProjectileCheckHittingSolid
    ldrb    r0,[r4,0x12]
    cmp     r0,0
    beq     @@_80862EC
    cmp     r0,1
    beq     @@_80862F2
    cmp     r0,2
    beq     @@_80862FA
    mov     r0,0x1C
    bl      MoveProjectile
    bl      sub_80863FC ; 0x80863FC
    b       @@_8086308
@@_80862EC:
    bl      @@_8086310 ; 0x8086310
    b       @@_8086300
@@_80862F2:
    mov     r0,0x10
    bl      MoveProjectile
    b       @@_8086300
@@_80862FA:
    mov     r0,0x18
    bl      MoveProjectile
@@_8086300:
    ldrb    r0,[r4,0x12]
    add     r0,1
    strb    r0,[r4,0x12]
    b       @@_80863AC
@@_8086308:
    ldrb    r0,[r4,0x1E]
    add     r0,1
    strb    r0,[r4,0x1E]
    b       @@_80863AC
@@_8086310:
    push    r4,r14
    ldr     r0,=Equipment
    ldrb    r4,[r0,0xA]
    mov     r0,0x10
    tst     r0,r4
    bne     @@_8086336
    mov     r0,4
    tst     r0,r4
    bne     @@_808632C
    mov     r0,0xCC
    bl      PlaySound
    mov     r0,0x10
    b       @@_808633E
@@_808632C:
    mov     r0,0xCC
    bl      PlaySound
    mov     r0,0x14
    b       @@_808633E
@@_8086336:
    mov     r0,0xCD
    bl      PlaySound
    mov     r0,0xC
@@_808633E:
    mov     r1,0x18
    bl      sub_8084F6C ; 0x8084F6C
    sub     r0,1
    cmp     r0,4
    bhi     @@_8086394
    lsl     r0,r0,2
    ldr     r1,=@@_80863E8 ; 0x80863E8
    add     r0,r0,r1
    ldr     r0,[r0]
    mov     r15,r0
@@_8086354:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_808635C:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8086370
    mov     r0,4
    tst     r4,r0
    bne     @@_808636C
    ldr     r0,=0x858E38C ; 0x858DBFC
    b       @@_80863AA
@@_808636C:
    ldr     r0,=0x858E704 ; 0x858DF74
    b       @@_80863AA
@@_8086370:
    ldr     r0,=0x858E978 ; 0x858E1E8
    b       @@_80863AA
@@_8086374:
    ldrb    r0,[r3]
    mov     r1,0x20
    orr     r1,r0
    strb    r1,[r3]
@@_808637C:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_8086390
    mov     r0,4
    tst     r4,r0
    bne     @@_808638C
    ; That OAM seems to be 0x790 behind in MF_J
    ldr     r0,=0x858E3AC ; 0x858DC1C
    b       @@_80863AA
@@_808638C:
    ldr     r0,=0x858E714 ; 0x858DF84
    b       @@_80863AA
@@_8086390:
    ldr     r0,=0x858E988 ; 0x858E1F8
    b       @@_80863AA
@@_8086394:
    mov     r0,0x10
    tst     r4,r0
    bne     @@_80863A8
    mov     r0,4
    tst     r4,r0
    bne     @@_80863A4
    ldr     r0,=0x858E36C ; 0x858DBDC
    b       @@_80863AA
@@_80863A4:
    ldr     r0,=0x858E6F4 ; 0x858DF64
    b       @@_80863AA
@@_80863A8:
    ldr     r0,=0x858E968 ; 0x858E1D8
@@_80863AA:
    str     r0,[r3,4]
@@_80863AC:
    pop     r4
    pop     r0
    bx      r0
    .pool

@@_80863E8:
    .word @@_8086394 ; 0x08086394
    .word @@_808635C ; 0x0808635c
    .word @@_8086354 ; 0x08086354
    .word @@_808637C ; 0x0808637c
    .word @@_8086374 ; 0x08086374

sub_80863FC:
    push    r14
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xA]
    mov     r0,0x10
    tst     r0,r1
    beq     @@_8086410
    mov     r0,0xE
    mov     r1,3
    bl      SetBeamTrailGfx
@@_8086410:
    pop     r0
    bx      r0

sub_8086414:
    push    r14
    ldr     r0,=Equipment
    ldrb    r1,[r0,0xA]
    mov     r0,0x10
    tst     r0,r1
    beq     @@_8086422
    mov     r2,0x14
@@_8086422:
    mov     r0,r2
    mov     r1,3
    bl      SetBeamTrailGfx
    pop     r0
    bx      r0

sub_808642E:
    push    r14
    ldrh    r0,[r4,8]
    ldrh    r1,[r4,0xA]
    bl      SetParticleEffect
    mov     r0,0
    strb    r0,[r4]
    pop     r0
    bx      r0
    .pool

;=====================================
; Tileset entries [OK]
;=====================================
; Animated tileset in tileset entry 0x4F?
.org 0x83C248C ; 0x83bfec4 ; diff: 25C8
    .byte 0x03

;=====================================
; Navigation room hatch lock events [OK]
;=====================================
; MF_U: 3C88F8, MF_J: 3CAEC0, diff: 25C8
.org 0x83CAF91 ; 0x83c89c9 in MF_U
    .byte 0xc0, 0xff, 0x03, 0x3b, 0x80, 0x5a, 0x02, 0x3d
    .byte 0x40, 0x65, 0x01

;=====================================
; Room connections? Door related?
;=====================================
.org 0x83CB201 ; 0x83c8c39 in MF_U
    .byte 0x3e
.org 0x83CB211 ; 0x83c8c49 in MF_U
    .byte 0x3e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

;=====================================
; Wall jump demo (4) fix [OK]
;=====================================
; demo 4 inputs
.org 0x83E60CC ; 0x83e3af0
    .byte 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10

.org 0x83E60DC ; 0x83e3b00
    .byte 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10

.org 0x83E60EC ; 0x83e3b10
    .byte 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10

; demo 4 input durations
.org 0x83E6110 ; 0x83e3b34
    .byte 0x07

.org 0x83E6118 ; 0x83e3b3c
    .byte 0x06

.org 0x83E612E ; 0x83e3b52
    .byte 0x01, 0x00, 0x04, 0x00, 0x05

;=====================================
; Event location and nav info [OK]
;=====================================
; MF_U: 575A60, MF_J: 578164, diff: 0x2704
.org 0x857818F ; 0x8575a8b
    .byte 0x0c

.org 0x85782AF ; 0x8575bab
    .byte 0x0c

.org 0x85782F7 ; 0x8575bf3
    .byte 0x0c

.org 0x8578357 ; 0x8575c53
    .byte 0x0c

.org 0x85783E7 ; 0x8575ce3
    .byte 0x0c

.org 0x857842F ; 0x8575d2b
    .byte 0x0c

.org 0x8578453 ; 0x8575d4f
    .byte 0x0c

.org 0x85784A7 ; 0x8575da3
    .byte 0x0c

;=====================================
; ProcessProjectilePointers: / Projectile subroutine pointers [OK]
;=====================================
.org 0x87EE918 ; 0x879c27c in MF_U
    .word HandleProjectile_84E70 + 1 ; 0x08084e71 ; normal beam?
    .word HandleProjectile_85B90 + 1 ; 0x08085b91 ; charge beam?
    .word HandleProjectile_85E1C + 1 ; 0x08085e1d ; wide beam?
    .word HandleProjectile_86044 + 1 ; 0x08086045 ; plasma beam?
    .word HandleProjectile_862B4 + 1 ; 0x080862b5 ; wave beam?
    .word HandleProjectile_84D74 + 1 ; 0x08084d75 ; charged normal beam?
    .word HandleProjectile_85A0C + 1 ; 0x08085a0d ; charged charge beam?
    .word HandleProjectile_85D08 + 1 ; 0x08085d09 ; charged wide beam?
    .word HandleProjectile_85F30 + 1 ; 0x08085f31 ; charged plasma beam?
    .word HandleProjectile_86158 + 1 ; 0x08086159 ; charged wave beam?

; If you see this, have a nice day!
