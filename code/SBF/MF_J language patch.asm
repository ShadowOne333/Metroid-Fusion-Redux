; Made by Xenesis

LangJapanese         equ 0x0
LangJapaneseHiragana equ 0x1
LangEnglish          equ 0x2
LangGerman           equ 0x3
LangFrench           equ 0x4
LangSpanish	     equ 0x6
LangItalian	     equ 0x5
HardSetLang          equ LangEnglish

.org 0x0809F838
	mov	r0,HardSetLang

.org 0x080A2A30
	mov	r0,HardSetLang

.org 0x080A2538
	mov	r0,HardSetLang

.org 0x080812F8
	mov	r0,HardSetLang

.org 0x0809FC1C
	mov	r0,HardSetLang
