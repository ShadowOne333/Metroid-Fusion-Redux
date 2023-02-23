; Special Edition room ports to MF_J

;-------------------------------------
;	Minimaps
;-------------------------------------
; Minimaps data, pointers changed to this location
.org ; 0x83C028C pointer at 0x83C3D75
.org ; 0x83C03C0 pointer at 0x83C7DED
.org 

;-------------------------------------
; 	Door data
;-------------------------------------
; Door data for Main Deck moved to 0x842F8E0
; Pointer at 0x879B894

; Door data for Sector 6 (?) moved to 0x8416770
; Pointer at 0x879B8AC

;-------------------------------------
;	Room layouts
;-------------------------------------
; Room layouts moved to addresses around 0x83F6A38
; Begin at the third pointer located at 0x83C2CD4, near the Room entries section of the ROM

;-------------------------------------
; Special Edition room changes
; Dark rooms are made darker by changing palette 18A3 to 0000

; Main Deck 
	Room 0D, background 2 modified the starry sky can be seen
	Room 11, red doors changed to green doors
	Room 13, added more blue to BG1
	Room 22, BG1 made blue instead of black (made by changing 0009 to 0C01)
	Room 26, extended the passageway on the top right to properly connect to the hallway tiles from Room C9 (or 54?)
	Room 2E, less saturated colour palette
	Room 30, removes enemy in the middle
	Room 37, modify black palette (0000 to 0840)
	Room 41, changes ONLY left red door to green door
	Room 43, modifies BG1 palette (0000 to 0C01 and 0043 to 0C01)
	Room 4A, change colour from 0043 to 0840
	Room 4B, same as Room 43
	Room 4D, 4E, 4F, 50, changed red doors to green doors
	Room 55, modified to not be able to cheese the SA-X fight anymore

; Sector 1
	Room 4, change BG1 palette from 0000 to 0403 (3 times), same for the other rooms with the same BG1
	Room 30, added "2 >" symbols for the passage to Sector 2
	Room 31, added "3 <" symbols for the passage to Sector 3

; Sector 2
	Room 1B, fix a wrong tile in the top right room (near bomb tile)
	Room 24, extra enemy on top was removed?
	Room 34, added number next to door to Sector 1
	Room 35, added number next to door to Sector 4

; Sector 3
	Room 06, Missile Tank on bottom left was removed
	Room 12, green door changed to blue
	Room 15, green door changed to blue
	Room 25, added number next to door to Sector 5
	Room 26, added number next to door to Sector 1

; Sector 4
	Room 2B, added number text to door to Sector 6
	Room 2C, added number text to door to Sector 2

; Sector 5
	; All of the blue rooms have a less saturated colour palette, same as with the Main Deck Room 2E
	; This includes Rooms 7, 8, 9, B, D, E, 15, 16, 1A, 2A, 2C and 33
	Room 1F, added number text to door to Sector 6
	Room 25, added number text to door to Sector 3
	Eoom 2B, changed background colour from 1807 to 0C01

; Sector 6
	Room 3, changed palette to look darker. All yellows and pinks changed to dark blue tones. Same for Rooms 4, 5, 6, 7, A, E, 10
	Room 9, C, D, F, 12, 13, 14, 1E, 21, changed background colour from 0000 to 0023
	Room 14, changed left red door to gray door, leads to Room 16
	Room 16, palette greatly darkened, and background changed like in Room 9. Right red door changed to gray
	Room 22, 26, 27 changed background colour from 1807 to 0C01
	Room 24, added number text to door to Sector 4
	Room 25, added number text to door to Sector 5




