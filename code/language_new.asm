SetLanguageText1:
    .import "data/set_language_text_1.bin"
SetLanguageText2:
    .import "data/set_language_text_2.bin"
SetLanguageText3:
    .import "data/set_language_text_3.bin"
SetLanguageText4:
    .import "data/set_language_text_4.bin"
SetLanguageText5:
    .import "data/set_language_text_5.bin"

EasyNormalText:
    .import "data/easy_normal_text.bin"
EasyNormalHardText:
    .import "data/easy_normal_hard_text.bin"

MainDeckTextOAM:
    .dh 2
    .dh 0x4000,0x8000,0x008A
    .dh 0x0000,0x4020,0x008E

LoadLanguageText:
    ; r0 = WindowPos
    push    r14
    ; clear existing text
    ldr     r2,=DMA3SourceAddress
    mov     r1,0
    add     sp,-4
    str     r1,[sp]
    mov     r1,r13
    add     sp,4
    str     r1,[r2]
    ldr     r1,=0x600C800
    str     r1,[r2,4]
    ldr     r1,=0x85000800
    str     r1,[r2,8]
    ldr     r1,[r2,8]
    ; load new text
    ldr     r1,=@@LanguageText
    lsl     r0,r0,2
    add     r0,r1,r0
    ldr     r0,[r0]
    ldr     r1,=0x30014B8
    str     r0,[r1,4]
    mov     r0,3
    bl      0x80A29E0
    pop     r0
    bx      r0
    .pool
@@LanguageText:
    .dw SetLanguageText1
    .dw SetLanguageText2
    .dw SetLanguageText3
    .dw SetLanguageText4
    .dw SetLanguageText5

SetChosenLanguage:
    ldr     r2,=0x30014B8
    mov     r0,0xC
    strh    r0,[r2,0xA]     ; ???
    ldrb    r3,[r2,0x16]    ; r0 = cursor position
    lsr     r0,r3,4
    mov     r1,0xF
    and     r1,r3
    add     r0,r0,r1        ; r0 = language
    ldrb    r2,[r2,0xD]     ; r2 = selected file
    lsl     r1,r2,2
    add     r1,r1,r2
    lsl     r1,r1,2         ; r1 = file * 0x14
    ldr     r2,=SaveFileData
    add     r1,r2,r1
    strb    r0,[r1,0x12]    ; save file language
    bx      r14
    .pool
