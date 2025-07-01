; Modify items found in each Sector/Area by quantity

; For example, Main Deck has 3 Energy Tanks, 7 Missile Tanks and 3 Power Bombs:
; 0x57868C -> 03 07 03

.org 0857868Ch
	; Main Deck items - 3 ET, 7 MT, 3 PB
	; One extra Power Bomb Tank was added to the unused docking area
	.db 0x03,0x07,0x04

	; Sector 1 items - 3 ET, 6 MT, 3 PB
	.db 0x03,0x06,0x03

	; Sector 2 items - 3 ET, 9 MT, 5 PB
	.db 0x03,0x09,0x05

	; Sector 3 items - 3 ET, 7 MT, 6 PB
	; One obligatory Missile Tank was moved to Sector 5, so we reduce one here
	.db 0x03,0x06,0x06

	; Sector 4 items - 2 ET, 9 MT, 4 PB
	.db 0x02,0x09,0x04

	; Sector 5 items - 3 ET, 4 MT, 8 PB
	; Missile Tank from Sector 3 was added here, we add it to the total Missile Tank count
	.db 0x03,0x05,0x08

	; Sector 6 items - 3 ET, 6 MT, 3 PB
	.db 0x03,0x06,0x03

	; Global item count
	.db 0x14,0x30,0x21
