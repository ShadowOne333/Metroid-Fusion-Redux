; [MF_U] Stops low health alarm in Metroid Fusion
;71DA2: 1D 2E -> 14 E0

; For Fusion (J) (0x2C)
.org 0x807244E	; 1D 2E -> 14 E0
	b 0x807247A
