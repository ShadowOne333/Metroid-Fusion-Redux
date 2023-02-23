;.gba
;.open "MF_J.gba","MF_J_language.gba",0x8000000
;.open "fusion.gba","Metroid Fusion.gba",0x8000000

.definelabel SaveFileData,0x3000BC8
.definelabel ChangedInput,0x3001220
.definelabel DMA3SourceAddress,0x40000D4
.definelabel PlaySound,0x8002754

; modified code
.include "code/language.asm"
.include "code/lang_select_cursor.asm"

; new code/data
.org 0x822B9E8  ; unused sound
    .include "code/language_new.asm"

;.close
