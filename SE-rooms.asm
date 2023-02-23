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
