; Various bugfixes for Biospark's MF_J language selection patch
; Made by SpineShark

; Fix language getting reset by demos
.org 0x808119A
    nop

; Fix difficulty selection cursor getting initialized with wrong offset
.org 0x80A006C
    mov     r2,0x81

; Fix wrong images getting unlocked in gallery when playing in
; a non-japanese language
.org 0x80A3FC4
    cmp     r0,1
    beq     0x80A4008

; Fix 1% item collection endings not unlocking in gallery when 0% collected
.org 0x80A3FCA
    ble     0x80A400C

; Fix incorrect ending item collection % when playing on hard difficulty
; in a non-japanese language
.org 0x80A441A
    b       0x80A442C

; Fix 1% item collection endings not shown when 0% collected
.org 0x80A5138
    bgt     0x80A513C

; Fix wrong ending image being shown when playing in a non-japanese language
.org 0x80A5144
    b       0x80A5158

; Fix untranslated "file start over" text
.org 0x87F1270
    .dw StartOverText

.org 0x822BC50 ; unused sound, behind the language patch code
StartOverText:
    .import "code/Language Patch/FileStartOverText.bin"

