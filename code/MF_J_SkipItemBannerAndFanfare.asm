; [MF_J] Allows you to skip most message banners.
; Item fanfares, if playing, get skipped too.
; By SpineShark, Japanese port by ShadowOne333

;.gba
;.open "MF_U.gba","SkipMessageBanners.gba",0x8000000

;.definelabel Freespace, filesize("MF_U.gba") + 0x8000000
.definelabel Freespace_SkipBannerFanfare, 0x8081770
.definelabel unk_39cc, 0x8003A30	; 0x80039CC in MF_U


; Ability collection popup can be closed almost instantly
.org 0x802AC6E ; B9 -> 00
; 0x802AAAE in MF_U
	.db 0

; Misc popups can be closed almost instantly
.org 0x802ACBC ; B4 -> 00
; 0x802AAFC in MF_U
	.db 0

; Item tank collection popup can be closed almost instantly
.org 0x802ACC6 ; 5A -> 00
; 0x802AB06 in MF_U
	.db 0

; Hijack in MessageBannerStatic function
.org 0x802AD16
; 0x802AB56 in MF_U
	ldr 	r0,[@HijackAddress]
	mov 	pc,r0
@ReturnAddress:

; Make some space to store the hijack address
.org 0x802AD56
; 0x802AB96 in MF_U
.area 6, 0
	pop 	r4,r5,pc
@HijackAddress:
	.dw 	@CheckStopItemFanfare|1
.endarea


.org Freespace_SkipBannerFanfare
; If an item fanfare is playing, stop it and resume the previous music track
@CheckStopItemFanfare:
	push	r2,r4
	mov 	r0,0x19			; } Instructions overwritten by hijack
	strb 	r0,[r1]			;/
	ldr 	r4,=0x3005498	;\
	ldrb 	r0,[r4]			; } If the fanfare is still playing, this flag should always be 0x80 (hopefully)
	cmp 	r0,0x80			;/
	bne 	@@Return
	ldr 	r0,=unk_39cc	;\
	mov 	lr,r0			; } Resume queued track if 0x80 flag set
	.dh 	0xF800			;/
	mov 	r0,0			;\
	strb 	r0,[r4]			; } Reset flag
@@Return:
	pop 	r2,r4
	ldr 	r0,=@ReturnAddress|1
	mov 	pc,r0
	.pool


;.close

