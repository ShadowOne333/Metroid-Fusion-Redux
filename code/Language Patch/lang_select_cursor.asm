; modify code that moves language select cursor
.org 0x80A1F1C
    ; r0 = 30016AC
    push    r4-r6,r14
    mov     r4,r0
    ldrb    r2,[r4,9]       ; r2 = [30016B5]
    cmp     r2,0
    bne     @@_80A1FC0      ; if [30016B5] == 0
    ldr     r3,=0x30014B8
    ldrb    r0,[r3,0x16]        ; r0 = CursorPos
    lsr     r5,r0,4             ; r5 = WindowPos
    mov     r6,0xF
    and     r6,r0               ; r6 = RelPos
    ldr     r0,=ChangedInput
    ldrh    r1,[r0]
    mov     r0,0x80
    and     r0,r1
    cmp     r0,0
    beq     @@CheckUp           ; if down pressed
    cmp     r6,2
    beq     @@CheckWindowPosDown    ; if RelPos < 2
    add     r6,1                        ; RelPos++
    ldrh    r0,[r4,2]
    add     r0,0x10
    strh    r0,[r4,2]                   ; CursorY += 10
    b       @@CursorMoved
@@CheckWindowPosDown:
    cmp     r5,4
    beq     @@CheckOtherInput       ; else if WindowPos < 4
    add     r5,1                        ; WindowPos++
    b       @@WindowMoved
@@CheckUp:
    mov     r0,0x40
    and     r0,r1
    cmp     r0,0
    beq     @@CheckOtherInput   ; else if up pressed
    cmp     r6,0
    beq     @@CheckWindowPosUp      ; if RelPos > 0
    sub     r6,1                        ; RelPos--
    ldrh    r0,[r4,2]
    sub     r0,0x10
    strh    r0,[r4,2]                   ; CursorY -= 10
    b       @@CursorMoved
@@CheckWindowPosUp:
    cmp     r5,0
    beq     @@CheckOtherInput       ; else if WindowPos > 0
    sub     r5,1                        ; WindowPos--
@@WindowMoved:
    mov     r0,r5
    bl      LoadLanguageText
@@CursorMoved:
    lsl     r0,r5,4
    orr     r0,r6
    ldr     r1,=0x30014B8
    strb    r0,[r1,0x16]        ; [CursorPos] = r0
    mov     r0,0xFD
    lsl     r0,r0,1
    bl      PlaySound           ; play sound 1FA
@@CheckOtherInput:
    ldr     r0,=ChangedInput
    ldrh    r2,[r0]
    mov     r0,2
    and     r0,r2
    cmp     r0,0
    bne     @@_80A1FEA          ; if B not pressed
    mov     r0,9
    and     r0,r2
    cmp     r0,0                    ; if neither A nor start pressed
    beq     @@Return                    ; return
    strb    r1,[r4,7]               ; CursorAnimCounter = 0
    strb    r1,[r4,6]               ; CursorAnimState = 0
    ldr     r0,=0x1FB
    bl      PlaySound               ; play sound 1FB
    ldr     r0,=0x8745EB8
    str     r0,[r4,0x14]            ; [30016C0] = 8745EB8
    b       @@_80A1FEA
    .pool
@@_80A1FC0:
    cmp     r2,1
    bne     @@_80A1FF4      ; else if [30016B5] == 1
    ldrb    r0,[r4,6]
    lsl     r0,r0,3             ; r0 = CursorAnimState * 8
    ldr     r1,[r4,0x14]
    add     r1,r1,r0
    ldrb    r0,[r1,4]           ; r0 = [[30016C0] + CursorAnimState * 8 + 4]
    ldrb    r2,[r4,7]           ; r2 = CursorAnimCounter
    cmp     r0,r2
    bne     @@_80A1FDC          ; if end of cursor animation:
    ldrb    r1,[r1,0xC]
    cmp     r1,0
    bne     @@_80A1FDC              ; if last animation
    strb    r1,[r4,7]                   ; CursorAnimCounter = 0
@@_80A1FDC:
    ldr     r0,=0x30014B8
    ldrb    r0,[r0,0xC]         ; r0 = [30014C4]
    cmp     r0,0xB              ; if [30014C4] != B
    bne     @@Return                ; return
    mov     r0,0
    strb    r0,[r4,7]           ; CursorAnimCounter = 0
    strb    r0,[r4,6]           ; CursorAnimState = 0
@@_80A1FEA:
    mov     r0,0x64
    strb    r0,[r4,9]           ; [30016B5] = 64
    b       @@Return            ; return
@@_80A1FF4:
    ldrb    r0,[r4,6]       ; else ([30016B5] > 1)
    lsl     r0,r0,3
    ldr     r1,[r4,0x14]
    add     r1,r1,r0
    ldrb    r0,[r1,4]           ; r0 = [[30016C0] + CursorAnimState * 8 + 4]
    ldrb    r2,[r4,7]           ; r2 = CursorAnimCounter
    cmp     r0,r2               ; if animation not over
    bne     @@Return                ; return
    ldrb    r1,[r1,0xC]
    cmp     r1,0                ; if not last animation
    bne     @@Return                ; return
    strb    r1,[r4,7]           ; CursorAnimCounter = 0
@@Return:
    pop     r4-r6
    pop     r0
    bx      r0
    .pool
