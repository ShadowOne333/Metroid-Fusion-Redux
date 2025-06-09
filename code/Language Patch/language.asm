; Set language to english during game initialization
.org 0x807F7B8
    mov     r0,2

;-------------------------------------
; Skip reseting language for SRAM reset menu
.org 0x808199C
    b       0x80819AE

;-------------------------------------
; Fix SRAM reset text
.org 0x858ABCC
    .import "code/Language Patch/reset_sram_1.bin"
.org 0x858AFA0
    .import "code/Language Patch/reset_sram_2.bin"

;-------------------------------------
; Pretend language is 0 when loading difficulty text
.org 0x80A338A
    mov     r4,0

;-------------------------------------
; Fix difficulty/area for save files
; Fix OAM for "sector n"
.org 0x8744B6C
    .dh 0x0002,0x4000,0x8000,0x0080,0x8000,0x0023,0x0084
    .dh 0x0002,0x4000,0x8000,0x0080,0x8000,0x0023,0x0085
    .dh 0x0002,0x4000,0x8000,0x0080,0x8000,0x0023,0x0086
    .dh 0x0002,0x4000,0x8000,0x0080,0x8000,0x0023,0x0087
    .dh 0x0002,0x4000,0x8000,0x0080,0x8000,0x0023,0x0088
    .dh 0x0002,0x4000,0x8000,0x0080,0x8000,0x0023,0x0089
;-------------------------------------
; Fix pointer for main deck text OAM
.org 0x8745D80
    .dw MainDeckTextOAM

;-------------------------------------
; Fix game over screen text (palette at 0x873BDD0)

; Fix position of Samus' head
;0x3000E1C -> 67 00 33, 67 is Y-Pos, 33 is X-Pos
; Changing the 33 to 23 gives it the same position as in MF_U
.org 0x809EFEA
	.db 0x2B	; Originally 0x3B
; Import graphics
.org 0x873B6F0
	.import "code/Language Patch/game_over_text.bin"

;-------------------------------------
; Fix the start over text

; Overwrite existing file?
; ([Metroid] doesn't disappear) 
;	Yes    No
; German text pointer -> 08747098
; English text pointer -> 08746B2A
.org 0x87F1270	;0x8746FEB
	.dw start_over

; Free space for the new text
.org 0x87EC850
start_over:
	.loadtable "code/text.tbl"
	.strn "Existing file will",0x00,0xFE
	.strn "be erased. OK?",0x00,0xFE
	.strn "(",0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04
	.strn "will remain)",0x00,0xFE
	.str "Yes",0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,"No"
	
;-------------------------------------
; Fix indentation of Metroid symbol
.org 0x80A29A6
    mov     r1,0xE4

;-------------------------------------
; Skip checking save file's language
.org 0x809FBD0
    b       0x809FBEC

;-------------------------------------
; Load proper language select text
.org 0x809FDD4
    ldr     r0,=SetLanguageText1
    str     r0,[r2,4]       ; [30014BC] = text pointer
    bl      0x80A0A7C
    .pool

;-------------------------------------
; Fix text indentation for language select text
.org 0x87F0FD4
    .dw 0x8745F9C

;-------------------------------------
; Fix behavior of language select cursor
.include "code/Language Patch//lang_select_cursor.asm"

;-------------------------------------
; Set language after choosing
.org 0x809FE40
    bl      SetChosenLanguage
    bl      0x80A0C5A

;-------------------------------------
; Fix text loaded for difficulty select
.org 0x809FFD4
    ldr     r0,=0x87F1118
    ldrh    r1,[r5,8]       ; r1 = text number
    lsl     r1,r1,2
    add     r1,r1,r0
    ldr     r0,[r1]
    str     r0,[r5,4]       ; [30014BC] = text pointer 
    bl      0x80A0C5A
    .pool

;-------------------------------------
; Fix difficulty select text pointers
.org 0x87F1180
    .dw EasyNormalText
    .dw EasyNormalHardText

;------------------------------------- 
; Fix default difficulty chosen
.org 0x80A001C
    strb    r2,[r5,0x17]    ; [30014CF] = 1
    b       0x80A0034
.org 0x80A0072
    b       0x80A007A

;------------------------------------- 
; Skip overwriting save file's language with english when loading
.org 0x80A01E2
    b       0x80A01F2

;-------------------------------------
; Fix file delete text indentation
.org 0x8745F6F
    .db 0xA0                ; move cursor left 6 pixels
.org 0x8745F8A
    .dh 0xB,0xB,0xF

;-------------------------------------
