; Improve the Sound engine of Fusion to get better music samples

; 0193F600 -> 0197F600 - The 3 is the nibble that sets the music frequency
; 0 = SOUND_MODE_FREQ_NONE
; 1 = SOUND_MODE_FREQ_05734
; 2 = SOUND_MODE_FREQ_07884
; 3 = SOUND_MODE_FREQ_10512
; 4 = SOUND_MODE_FREQ_13379
; 5 = SOUND_MODE_FREQ_15768
; 6 = SOUND_MODE_FREQ_18157
; 7 = SOUND_MODE_FREQ_21024
; 8 and above glitches the audio

; Modify the Sample Rate of the music from 10kHz to 21Khz
soundImprovement:
.org 0x800250C	; 0x80024C4 in MF_U
	.dw 0x0197F600	; 00 F6 93 01 - 0x0193F600

; Modifying the sample rate (frequency) also modifies how certain Sound Effects play (pitch)
; These changes all the sound effects so they don't rely on sample rate changes and instead play normally.
; In MF_U:	0x080A5710 - 0x080A8CBC
; In MF_J:	0x080A79FC - 0x080AAFA8
.org 0x080A79FC	; 0x080A5710 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7A14	; 0x080A5728 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7A2C	; 0x080A5740 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7A44	; 0x080A5758 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7A74	; 0x080A5788 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7BD0	; 0x080A58E4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7C6C	; 0x080A5980 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7C84	; 0x080A5998 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7D74	; 0x080A5A88 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7D80	; 0x080A5A94 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7DC8	; 0x080A5ADC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7DEC	; 0x080A5B00 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7E1C	; 0x080A5B30 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A7E88	; 0x080A5B9C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8158	; 0x080A5E6C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8218	; 0x080A5F2C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8224	; 0x080A5F38 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A823C	; 0x080A5F50 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8248	; 0x080A5F5C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8350	; 0x080A6064 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A84C4	; 0x080A61D8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A84D0	; 0x080A61E4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A84DC	; 0x080A61F0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8B18	; 0x080A6820 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8B30	; 0x080A6838 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8B3C	; 0x080A6844 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8B48	; 0x080A6850 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8B60	; 0x080A6868 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8B78	; 0x080A6880 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8B84	; 0x080A688C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8BA8	; 0x080A68B0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8BB4	; 0x080A68BC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8BC0	; 0x080A68C8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8BCC	; 0x080A68D4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BE4	; 0x080A68EC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8BFC	; 0x080A6904 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8C20	; 0x080A6928 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8C2C	; 0x080A6934 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8D04	; 0x080A6A0C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8D10	; 0x080A6A18 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8D58	; 0x080A6A60 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8DE8	; 0x080A6B2C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8DF4	; 0x080A6B50 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8E3C	; 0x080A6B98 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8E60	; 0x080A6BA4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8EA8	; 0x080A6BB0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8EB4	; 0x080A6BBC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8EC0	; 0x080A6BC8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A8ECC	; 0x080A6BEC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8ED8	; 0x080A6D0C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8EFC	; 0x080A6D18 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A901C	; 0x080A6D24 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9028	; 0x080A6D30 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9034	; 0x080A6D3C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9040	; 0x080A6D48 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A904C	; 0x080A6D60 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9058	; 0x080A6D6C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9070	; 0x080A6D78 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A907C	; 0x080A6D84 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9088	; 0x080A6D90 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9094	; 0x080A6E38 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A90A0	; 0x080A6E44 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9148	; 0x080A6E50 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9154	; 0x080A6F58 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9160	; 0x080A6FAC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9268	; 0x080A7174 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A92BC	; 0x080A71B0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9484	; 0x080A721C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A94C0	; 0x080A72A0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A94FC	; 0x080A74B0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9550	; 0x080A74D4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A95D4	; 0x080A74E0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A97E4	; 0x080A74EC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9808	; 0x080A74F8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9814	; 0x080A7570 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9820	; 0x080A757C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A982C	; 0x080A7588 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A98A4	; 0x080A7594 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A98B0	; 0x080A7624 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A98BC	; 0x080A7630 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A98C8	; 0x080A7648 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9958	; 0x080A76CC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9964	; 0x080A7720 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A997C	; 0x080A7738 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9988	; 0x080A7744 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9A18	; 0x080A77D4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9A6C	; 0x080A77E0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9A84	; 0x080A77EC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9A90	; 0x080A7864 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9B20	; 0x080A7870 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9B2C	; 0x080A7900 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9B38	; 0x080A790C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9BB0	; 0x080A7918 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9BBC	; 0x080A7924 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9C4C	; 0x080A7930 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9C58	; 0x080A79CC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9C64	; 0x080A7A38 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9C70	; 0x080A7A68 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9C7C	; 0x080A7A74 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9D18	; 0x080A7A80 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9D84	; 0x080A7A8C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9DB4	; 0x080A7B40 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9DC0	; 0x080A7B4C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9DCC	; 0x080A7B58 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9DD8	; 0x080A7BF4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9DF0	; 0x080A7C00 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9DFC	; 0x080A7EC4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9EA4	; 0x080A7ED0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9EB0	; 0x080A7EDC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9EBC	; 0x080A7F84 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9F58	; 0x080A81D0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A9F64	; 0x080A82C0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA228	; 0x080A8350 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA234	; 0x080A8398 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA240	; 0x080A8404 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA2E8	; 0x080A8410 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA534	; 0x080A841C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA624	; 0x080A8428 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA6B4	; 0x080A8434 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA6FC	; 0x080A8440 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA768	; 0x080A844C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA774	; 0x080A8458 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA780	; 0x080A8494 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA78C	; 0x080A84A0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA798	; 0x080A84AC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA7A4	; 0x080A84B8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA7B0	; 0x080A84C4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA7BC	; 0x080A84D0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA7F8	; 0x080A84DC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA804	; 0x080A84E8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA810	; 0x080A84F4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA81C	; 0x080A8500 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA828	; 0x080A850C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA834	; 0x080A8530 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA840	; 0x080A8548 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA84C	; 0x080A8AF4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA858	; 0x080A8B00 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA864	; 0x080A8B0C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA870	; 0x080A8B18 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA894	; 0x080A8B24 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AA8AC	; 0x080A8B30 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAE58	; 0x080A8B3C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAE64	; 0x080A8B48 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAE70	; 0x080A8B54 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAE7C	; 0x080A8B60 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAE88	; 0x080A8B6C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAE94	; 0x080A8B78 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAEA0	; 0x080A8B84 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAEAC	; 0x080A8B90 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAEB8	; 0x080A8B9C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAEC4	; 0x080A8BA8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAED0	; 0x080A8BB4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAEDC	; 0x080A8BC0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAEE8	; 0x080A8BCC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAEF4	; 0x080A8BD8 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF00	; 0x080A8BE4 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF0C	; 0x080A8BF0 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF18	; 0x080A8BFC in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF24	; 0x080A8C08 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF30	; 0x080A8C14 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF3C	; 0x080A8C20 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF48	; 0x080A8C2C in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF54	; 0x080A8C38 in MF_U
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF60
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF6C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF78
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF84
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF90
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080AAF9C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound
