; Lets you skip Adam conversations by pressing START
; For japanese version
; By SpineShark
;.gba
;.open "MF_J.gba","MF_J_AdamSkip.gba",0x8000000

;.definelabel Freespace, filesize("MF_J.gba") + 0x8000000
.definelabel Freespace2, 0x80870A0
.definelabel ButtonInput, 0x300121C
.definelabel NonGameplayRam, 0x30014B8

; hijack near beginning of NavigationConversationSubroutine (7AB78)
.org 0x807AB92
    mov     pc,r0

.org 0x807ABA8 ; reuse existing ldr & pool
    .dw Freespace2|1

.org Freespace2
    ldr     r4,=NonGameplayRam
    ldrb    r0,[r4,7] ; r0 must be preserved if using regular return!
; check if Start button pressed
    ldr     r1,=ButtonInput
    ldrb    r1,[r1]
    mov     r2,8
    tst     r1,r2 
    bne     @@StartPressed

@@RegularReturn:
; continue directly after hijack
    ldr     r1,=0x807AB94|1
    mov     pc,r1

@@StartPressed:
; don't allow skipping at certain conversation stages (to prevent glitches)
    cmp     r0,1 :: beq @@SkipConvo
    cmp     r0,2 :: beq @@SkipConvo
    cmp     r0,7 :: bhi @@SkipConvo
    b       @@RegularReturn

@@SkipConvo:
    ldr     r0,=0x30016F0   ;\
    mov     r1,7            ; force-close the text panel
    strb    r1,[r0]         ; (prevents a softlock)
    mov     r1,0            ; |
    strb    r1,[r0,1]       ;/
    mov     r5,0
    ldr     r0,=0x807AD1E|1
    mov     pc,r0 
    .pool 

;.close
