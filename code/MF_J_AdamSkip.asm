; Lets you skip Adam conversations by pressing START (version 3)
; For japanese version
; By SpineShark
;.gba
;.open "MF_J.gba","MF_J_AdamSkip.gba",0x8000000

;.definelabel Freespace, filesize("MF_J.gba") + 0x8000000
.definelabel Freespace_AdamConv, 0x80870A0

.definelabel Language, 0x3000014
.definelabel ButtonInput, 0x300121C
.definelabel NonGameplayRam, 0x30014B8

;.definelabel PlayMusic, 0x800359C
.definelabel SoundEventUpdate, 0x8070810
.definelabel NavigationTextPointers, 0x87EE7A0

; Hijack near beginning of NavigationConversationSubroutine (7AB78)
.org 0x807AB92
    mov     pc,r0

.org 0x807ABA8 ; Reuse existing ldr & pool
    .dw Freespace_AdamConv|1

.org Freespace_AdamConv
    ldr     r4,=NonGameplayRam
    ldrb    r0,[r4,7] ; r0 must be preserved if using regular return!
; Check if START button pressed
    ldr     r1,=ButtonInput
    ldrb    r1,[r1]
    mov     r2,8
    tst     r1,r2 
    bne     @@StartPressed

@@RegularReturn:
; Continue directly after hijack
    ldr     r1,=0x807AB94|1
    mov     pc,r1

@@StartPressed:
; Don't allow skipping at certain conversation stages (to prevent glitches)
    cmp     r0,1 :: beq @@SkipConvo
    cmp     r0,2 :: beq @@SkipConvo
    cmp     r0,7 :: bhi @@SkipConvo
    b       @@RegularReturn

@@SkipConvo:
    ldr     r0,=NonGameplayRam + 0x238  ;\
    mov     r1,7                        ; |
    strb    r1,[r0]                     ; } Force-close the textbox
    mov     r1,0                        ; | (prevents a softlock)
    strb    r1,[r0,1]                   ;/
    mov     r1,5                        ; } Force-close second textbox
    strb    r1,[r0,4]                   ;/  (prevents another softlock)
    bl      @TryPlayConversationMusic
    mov     r5,0
    ldr     r0,=0x807AD1E|1
    mov     pc,r0 
    .pool 


@TryPlayConversationMusic:
    push    lr
; Check if language and conversation number are in bounds (just in case)
    ldr     r0,=Language
    ldrb    r0,[r0]
    cmp     r0,6 :: bhi @@Return
    ldr     r1,=NonGameplayRam + 0x220
    ldrb    r1,[r1]
    sub     r1,1
    lsl     r1,r1,1
    cmp     r1,0x71 :: bhi @@Return
; Get the pointer to the current conversation text
    ldr     r2,=NavigationTextPointers
    lsl     r0,r0,2
    add     r0,r2 
    ldr     r0,[r0] 
    lsl     r1,r1,2
    add     r0,r1 
    ldr     r0,[r0]
; Check if it's the first conversation (has the unique identifier 0xB003)
    ldrh    r1,[r0]
    ldr     r2,=0xB003
    cmp     r1,r2 :: beq @@FirstConvo
; Go through the conversation text looking for music change events
; If found, save the music ID; if there are multiple events, take the last ID
    mov     r2,0
    b       @@LoopEntry
@@Loop:
    add     r0,2
@@LoopEntry:
    ldrb    r1,[r0,1]
    cmp     r1,0xFF :: beq @@End
    cmp     r1,0x90 :: bne @@Loop
    ldrb    r2,[r0]
    b       @@Loop

@@FirstConvo:
; Set up the music after the first conversation
    mov     r0,0x2A
    mov     r1,2
    ldr     r2,=PlayMusic|1
    bl      @CallR2
    mov     r0,0
    mov     r1,0xB
    ldr     r2,=SoundEventUpdate|1
    bl      @CallR2
    b       @@Return

@@End:
; Play new music track if there was one
    cmp     r2,0 :: beq @@Return
    mov     r0,r2
    mov     r1,2
    ldr     r2,=PlayMusic|1
    bl      @CallR2

@@Return:
    pop     pc
    .pool


.align 4
@CallR2:
    mov     pc,r2
    nop


;.close
