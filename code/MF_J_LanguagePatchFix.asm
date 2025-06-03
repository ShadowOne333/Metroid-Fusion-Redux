; Intended for Biospark's MF_J language selection patch

; Fix language getting reset by demos
.org 0x808119A
    nop     ; don't reset language to 0

; Fix gallery not updated properly when playing with Kanji
; UNTESTED!
.org 0x807FCBE
    cmp     r0,1
    bne     @@_807FCC4
    add     r2,3
@@_807FCC4:
    add     r2,r9 ; r9 == difficulty

; Fix "file start over" text
; Pointer to new text
.org 0x87F1270
    .dw StartOverText

;.org 0x87F1460 ; end of ROM free space
.org 0x822BC50 ; unused sound, behind the language patch code
StartOverText:
    .import "code/FileStartOverText.bin"

; Fix difficulty selection cursor getting initialized with wrong offset
.org 0x80A006C
    mov     r2,0x81
