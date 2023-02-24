;[MF_U] Enable Debug Menu (Courtesy of Interdpth & P.JBoy) 
; 08076A2E: A5 -> A3

.org 0x080771EA
	.db 0xA3

;-------------------------------------
; Disable Samus and Ammo options for Debug Menu

;$08077278=20FFh ;Lock the cursor
;.org 0x08077A34
;	.dh 0x20FF
;$0807DF8A=2800h ;\
;.org 0x0807E752
;	.dh 0x2800
;$0807DF8E=2000h ;/Lock the "SAMUS"
;.org 0x0807E756
;	.dh 0x2000

; PENDING!!!
;$0807E5A6=46C0h ;\
;.org 0x0807EED8	; (?)
;	nop
;$0807E5A8=46C0h ;|
;.org 0x0807EEDA	; (?)
;	nop
;$0807E5F2=46C0h ;|Lock ENERGY and E_MAX
;.org 0x0807EEC4	; (?)
;	nop
;$0807E5F4=46C0h ;/
;.org 0x0807EEC6	; (?)
;	nop

;$0807E5B4=46COh ;\
;.org 0x0807EEE4	; (?)
;	nop
;$0807E5B6=46C0h ;|
;.org 0x0807EEE6	; (?)
;	nop
;$0807E602=46COh ;|Lock MISSILE and M_MAX
;.org 0x0807EE	; (?)
;	nop
;$0807E604=46C0h ;/
;.org 0x0807EE	; (?)
;	nop

;$0807E5C4=46C0h ;\
;.org 0x0807EEF4	; (?)
;	nop
;$0807E5C6=46C0h ;|
;.org 0x0807EEF6	; (?)
;	nop
;$0807E610=46C0h ;|Lock P_BOMB and PB_MAX
;.org 0x0807EE	; (?)
;	nop
;$0807E612=46C0h ;/
;.org 0x0807EE	; (?)
;	nop
