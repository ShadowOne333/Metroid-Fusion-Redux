; Room changes carried over from Special Edition

;-------------------------------------
; Dropped room changes from SE
;-------------------------------------
; MAIN DECK
; Rooms 0D and 55 were left untouched. Room 0D had a modification to BG 1 to see more of the starry background, and Room 55 was changed to not cheese the final SA-X fight anymore, I decided to keep them intact so the change in room layout for the SA-X doesn't collide with the original/normal room layout.
; Rooms 11, 4D, 4E, 4F and 50 (Restricted Lab rooms) had all its red doors changed to green doors. For me these don't make sense from a story standpoint, since this lab/area should have the highest type of security (Lvl 4 doors/Red).

; SECTOR 3 (PYR)
; Rooms 12 and 15 had a green door changed to blue

; SECTOR 6 (NOC)
; Room 14 changed left red door to gray door, leads to Room 16
; Room 16 changed the right red door changed to gray

;-------------------------------------
; Room entries
;-------------------------------------
; Main Deck room 26 extended the passageway on the top right to properly connect to the hallway tiles from Room C9 (or 54?)
; Sector 1 rooms 30/31 added numbers
; Sector 2 room 1B fixed a missing tile, and rooms 34/35 added numbers
; Sector 3 room 06 removed one forced Missile Tank, and rooms 25/26 added numbers
; Sector 4 rooms 2B/2C added numbers
; Sector 5 room 0B added the removed Missile Tank from Sector 3, and rooms 1F/25 added numbers
; Sector 6 rooms 24/25 added numbers
;-------------------------------------
; Main Deck room entries
.org 0x83C5B08	; 0x83C3540 in U
	.dw main_deck_room26_layout1	; Moved to 0x879ECC8 by MAGE
.org 0x83C5B0C	; 0x83C3544 in U
	.dw main_deck_room26_layout0	; Moved to 0x8476DD0 by MAGE
;-------------------------------------
; Sector 1 room entries
.org 0x83C71C8	; 0x83C4C00 in U
	.dw sector1_room30_layout	; Moved to 0x8476D18 by MAGE
.org 0x83C7204	; 0x83C4C3C in U
	.dw sector1_room31_layout	; Moved to 0x8476D44 by MAGE

;-------------------------------------
; Area room entry pointers
; Changed due to adding a door in Sector 2, room 0D
.org 0x87EDF4C	; 0x879B89C in U
	.dw sector2_doors	; Moved to 0x879F088 by MAGE

; Sector 2 room entries
.org 0x83C7640	; 0x83C5078 in U
	.dw sector2_room0D_layout	; Moved to 0x879EE8C by MAGE

.org 0x83C7980	; 0x83C53B8 in U
	.dw sector2_room1B_layout1	; Moved to 0x8476EB8 by MAGE (79ECC8)
.org 0x83C7988	; 0x83C53C0 in U
	.dw sector2_room1B_layout0	; Moved to 0x84D49DC by MAGE
; Change three bytes, which most likely correspond to Sector 2's Room 1B BG2 to remove the wrong purple tile near the missile tank
.org 0x84D6FC9	; 0x84D48ED in U
	.db 0x83,0x8C,0x98

.org 0x83C7F60	; 0x83C5998 in U
	.dw sector2_room34_layout	; Moved to 0x8476D70 by MAGE
.org 0x83C7F9C	; 0x83C59D4 in U
	.dw sector2_room35_layout	; Moved to 0x8476E8C by MAGE
;-------------------------------------
; Sector 3 Minimap change to remove the forced Missile Tank in room 18
.org 0x857585C
	.import "data/minimaps/sector3_minimap.bin"
; Sector 3 room entries
.org 0x84FC8E4	; 0x84FA208 in U
sector3_room06_layout:
	.import "data/rooms/sector3_room06_layout.bin"
.org 0x83C8A28	; 0x83C6460 in U
	.dw sector3_room25_layout	; Moved to 0x847707C by MAGE
.org 0x83C8A64	; 0x83C649C in U
	.dw sector3_room26_layout	; Moved to 0x84770AC by MAGE
;-------------------------------------
; Sector 5 Minimap change to add back the forced Missile Tank from Sector 3 into Room 0B of Sector 5
.org 0x857603C
	.import "data/minimaps/sector5_minimap.bin"
; Sector 5 room entries
.org 0x83C8D38	; Room 0B, add back Missile Tank moved from Sector 3
	.dw sector5_room0B_layout	; Moved to 0x879EC68 by MAGE
.org 0x83C91E4	; 0x83C6C1C in U
	.dw sector5_room1F_layout	; Moved to 0x847715C by MAGE
.org 0x851EDBC	; Room 21, remove the weird Power Bomb block
	.db 0x8A,0x10,0x89,0x00,0xBE,0x10
	.db 0x00,0x02,0x81,0x0A,0x00,0x00
.org 0x83C934C	; 0x83C6D84 in U
	.dw sector5_room25_layout	; Moved to 0x8477130 by MAGE
;-------------------------------------
; Sector 4 room entries
.org 0x83CA0E4	; 0x83C7B1C in U
	.dw sector4_room2B_layout	; Moved to 0x84770D8 by MAGE
.org 0x83CA120	; 0x83C7B58 in U
	.dw sector4_room2C_layout	; Moved to 0x8477104 by MAGE
;-------------------------------------
; Sector 6 room entries
.org 0x83CAA80	; 0x83C84B8 in U
	.dw sector6_room24_layout	; Moved to 0x8477188 by MAGE
.org 0x83CAABC	; 0x83C84F4 in U
	.dw sector6_room25_layout	; Moved to 0x84771B4 by MAGE
;-------------------------------------
; Blank out the following addresses
; These could be used for free space
;4A1C42 - 4A1C65
;4A1D49 - 4A1D6C
;4D49D8 - 4D4B98
;4DB229 - 4DB24C
;4DB32E - 4DB351
;502CE9 - 502D10
;502DFE - 502E21
;51C445 - 51C468
;51CF4A - 51CF6D
;541B8A - 541BAD
;541C99 - 541CBC
;556CA9 - 556CCC
;556DB6 - 556DD9
;-------------------------------------
.org 0x87F1ED0
main_deck_room26_layout1:
	.import "data/rooms/main_deck_room26_layout1.bin"
main_deck_room26_layout0:
	.import "data/rooms/main_deck_room26_layout0.bin"
sector1_room30_layout:
	.import "data/rooms/sector1_room30_layout.bin"
sector1_room31_layout:
	.import "data/rooms/sector1_room31_layout.bin"
sector2_room0D_layout:
	.import "data/rooms/sector2_room0D_layout.bin"
sector2_room1B_layout1:
	.import "data/rooms/sector2_room1B_layout1.bin"
sector2_room1B_layout0:
	.import "data/rooms/sector2_room1B_layout0.bin"
sector2_room34_layout:
	.import "data/rooms/sector2_room34_layout.bin"
sector2_room35_layout:
	.import "data/rooms/sector2_room35_layout.bin"
sector3_room25_layout:
	.import "data/rooms/sector3_room25_layout.bin"
sector3_room26_layout:
	.import "data/rooms/sector3_room26_layout.bin"
sector5_room0B_layout:
	.import "data/rooms/sector5_room0B_layout.bin"
sector5_room1F_layout:
	.import "data/rooms/sector5_room1F_layout.bin"
sector5_room25_layout:
	.import "data/rooms/sector5_room25_layout.bin"
sector4_room2B_layout:
	.import "data/rooms/sector4_room2B_layout.bin"
sector4_room2C_layout:
	.import "data/rooms/sector4_room2C_layout.bin"
sector6_room24_layout:
	.import "data/rooms/sector6_room24_layout.bin"
sector6_room25_layout:
	.import "data/rooms/sector6_room25_layout.bin"
;-------------------------------------
; Sector 2 doors
sector2_doors:
	.import "data/doors/sector2_door_data.bin"
;-------------------------------------


