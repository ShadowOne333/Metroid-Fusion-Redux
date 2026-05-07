;.gba
;.open "MF_J.gba","MF_J_language.gba",0x8000000
;.open "fusion.gba","Metroid Fusion.gba",0x8000000
;-------------------------------------------------------------------
.definelabel SaveFileData,0x3000BC8
.definelabel ChangedInput,0x3001220
.definelabel DMA3SourceAddress,0x40000D4
.definelabel PlaySound,0x8002754
;-------------------------------------------------------------------
; modified code
.include "code/Language Patch/language.asm"
.include "code/Language Patch/lang_select_cursor.asm"

; new code/data
.org 0x822B9E8  ; unused sound
    .include "code/Language Patch/language_new.asm"

;-------------------------------------------------------------------
; The "Your rate for" part in the ending's "Your rate for collecting items is" text is only one line in some languages, but MF J still uses the English graphics for them.
; This patch fixes that part of the text from not appearing on MF_J (Thanks Spine Shark)

; Assembly variant
.org 0x80A5384
b 0x80A53A4

; Hex tweak variant
;A5384: 05 48 -> 0E E0
;-------------------------------------------------------------------
;.close
