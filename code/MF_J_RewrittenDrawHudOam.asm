; Rewrites the DrawHudOam function to make it easier to rearrange the HUD elements
; while also reducing its size and CPU cycles by about 3/4.
; You can edit the HUD OAM attributes at the end of this file.
; By SpineShark

;.gba
;.open "MF_U.gba","RewrittenDrawHudOam.gba",0x8000000

.definelabel FrameCounter8Bit, 0x3000C19
.definelabel OamDataIWRAM, 0x3000E1C
.definelabel NextOamSlot, 0x3001222

;.org 0x80720A4	; MF_U
.org 0x8072750	; MF_J
;.area 0x254,0
.area 0x98,0
DrawHudOam:
    push    r4-r7,lr
; r5 = OAM data source
; r6 = OAM data destination
; r7 = current OAM slot
    ldr     r6,=OamDataIWRAM
    mov     r7,0
; Draw health bar
    add     r5,=@@EnergyCounterOAM
    ldmia   r5!,r0-r3
    stmia   r6!,r0-r3
    add     r7,2

; Check if any type of missile equipped
    ldr     r4,=Equipment
    ldrb    r4,[r4,0xB] ; r4 = MissileBombStatus
    mov     r1,0xF
    tst     r4,r1 :: beq @@CheckPowerBombs
; Draw missile ammo counter
    add     r5,=@@MissileCounterOAM
    ldmia   r5!,r0,r1 
    stmia   r6!,r0,r1 
    add     r7,1

@@CheckPowerBombs:
    mov     r1,0x20
    tst     r4,r1 :: beq @@Minimap
; Draw power bomb ammo counter
    add     r5,=@@PowerBombCounterOAM
    ldmia   r5!,r0,r1 
    stmia   r6!,r0,r1 
    add     r7,1

@@Minimap:
    ldr     r4,=FrameCounter8Bit
    ldrb    r0,[r4]
    mov     r1,8
    tst     r0,r1 :: beq @@Unlit
    add     r5,=@@MinimapBlinkyLitUpOAM
    b       @@Load
@@Unlit:
    add     r5,=@@MinimapBlinkyUnlitOAM
@@Load:
    ldmia   r5!,r0,r1
    add     r5,=@@MinimapOAM
    ldmia   r5!,r2,r3
    stmia   r6!,r0-r3
    add     r7,2

@@Return:
    ldr     r4,=NextOamSlot
    strb    r7,[r4]
    pop     r4-r7,pc
    .pool


; Here's a simplified explaination of how OAM attributes work:
;
; attribute 1
;    |    attribute 2
;    |       |    attribute 3
;    |       |       |    attribute 4
;    |       |       |    |
; 0xS1YY, 0xS2XX, 0xPTTT, 0
;
; S1 ... sprite shape part 1
; YY ... Y position (note that positive Y points down on the GBA)
; S2 ... sprite shape part 2
; P .... palette number
; TTT .. tile number
;
; Please visit https://gbadev.net/gbadoc/sprites.html for a detailed explaination.

.align 4
@@EnergyCounterOAM:
    .dh 0x4002, 0x8000, 0x3050, 0 ; left part
    .dh 0x4002, 0x8020, 0x3054, 0 ; right part
@@MissileCounterOAM:
    .dh 0x0002, 0x4044, 0x3058, 0
@@PowerBombCounterOAM:
    .dh 0x0002, 0x4054, 0x305A, 0
@@MinimapBlinkyLitUpOAM:
    .dh 0x000A, 0x00DE, 0x60C5, 0
@@MinimapBlinkyUnlitOAM:
    .dh 0x000A, 0x00DE, 0x60C6, 0
@@MinimapOAM:
    .dh 0x00FA, 0x80D6, 0x60DC, 0

.endarea

;.close
