; Restore the unused docking bay in the Main Deck

;-------------------------------------
; Update max Power Bomb amout for Main Deck area from 32 to 33
; This also takes the new PB tank into account for 100%
.org 0x85786A3	; Power Bomb tanks, NumTanksInArea (Main Deck)
	.db 0x21
;-------------------------------------
; Data for the Main Deck doors
; Reused for minimap and layout data as free space
.org 0x83C25F8	; Remove original data, 0x83C0030
.area 0x9A8,0xFF	; Limit area, 0x83C09D8
; Import minimap, Main Deck's Room 2 and Room 6 layout data here since it's free space now and it fits.
minimap:
	.import "data/minimaps/main_deck_minimap.bin"
room2_layout:
	.import "data/rooms/main_deck_room2_layout.bin"
room6_layout:
	.import "data/rooms/main_deck_room6_layout.bin"
.endarea
;-------------------------------------
; Main Deck room 2 sprite layout start
.org 0x8471E34	; 0x846F758 in (U)
.area 0x8E,0xFF	; 0x846F7E6
	;.db "mage",0x8E,0x00
.endarea
;-------------------------------------
; Main Deck room 6 sprite layout start
.org 0x84725A4	; 0x846FEC8
.area 0xE9,0xFF	; 0x846FFB1
	;.db 0x00,0x00,0x00,0x00
	;.db "mage",0xE5,0x00
.endarea
;-------------------------------------
.org 0x847273F	; 0x8470063
	.db 0x83,0x51,0x05,0x6A,0x6B,0x6C,0x6D,0xA7
	.db 0x88,0x00,0x06,0xA6,0x6A,0x6B,0x6C,0x6D
	.db 0x51,0x84,0x84,0x01,0xB7,0x88,0x00,0x01
	.db 0xB6,0x85,0x84,0x04,0x03,0x03,0x02,0x05
	.db 0x8B,0x00,0x08,0x0A,0x01,0x03,0x03,0x13
	.db 0x13,0x12,0x15,0x8B,0x00,0x08,0x1A,0x11
	.db 0x13,0x13,0x23,0x23,0x22,0x25,0x8B,0x00
	.db 0x08,0x2A,0x21,0x23,0x23,0x33,0x33,0x32
	.db 0x35,0x8B,0x00,0x04,0x3A,0x31,0x33,0x33
	.db 0x84,0x85,0x03,0x97,0xE5,0xE6,0x86,0x00
	.db 0x01,0x96,0x85,0x85,0x05,0x66,0x67,0x68
	.db 0x69,0xA7,0x85,0x00,0x0E,0xE5,0xE6,0x00
	.db 0xA6,0x76,0x77,0x78,0x79,0x51,0x76,0x77
	.db 0x78,0x79,0xA7,0x88,0x00,0x0B,0xA6,0x86
	.db 0x87,0x88,0x89,0x51,0x86,0x87,0x88,0x89
	.db 0xA7,0x88,0x00,0x04,0xB6,0x84,0x99,0x8E
	.db 0x84,0x51,0x06,0x8E,0x98,0xB7,0x00,0xE5
	.db 0xE6,0x87,0x00,0x02,0xA6,0x9E
;-------------------------------------
; Change pointers to new data location

; Main Deck - Room 2 layout data pointer (Add PB tank)
.org 0x83C52A0	; 0x83C2CD8, points to 0846F758 in (U)
	.dw room2_layout

; Main Deck - Room 6 layout data pointer
.org 0x83C5390	; 0x83C2DC8
; Pointer for MF_J is 0x0847254A
	.dw room6_layout	; 0x0879ECC8 <- 0x0846FEC8 in (U)

; Main Deck door data pointer
.org 0x87EDF44	; 0x879B894
; Pointer for MF_J is 0x083C25F8
	.dw door_data	; 0x0879EDC8 <- 0x083C0030 in (U)

; Main Deck Minimap data pointer
.org 0x87EE50C	; 0x879BE5C
; Pointer for MF_J is 0x08575424
	.dw minimap	; 0x083C0030 <- 0x08572D48 in (U)
;-------------------------------------
; Import data for Main Deck Room 6 and Door Data
.org 0x87F1510	; 0x879ECC8
door_data:
	.import "data/doors/main_deck_door_data.bin"

