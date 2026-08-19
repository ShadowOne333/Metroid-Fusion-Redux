; Improve the Sound engine of Fusion to get better music samples
soundImprovement:
.org 0x80024C4
	.dw 0x0197F600	; 00 F6 93 01 - 0x0193F600

; Modifying the Sample Rate (Frequency) alone is not enough, since modifying the sample rate also modifies how certain Sound Effects.
; These changes make it so that all the sound effects don't rely on sample rate changes and instead play normally.
;:	0x080A5710 - 0x080A8CBC
; In MF_J:	0x080A79FC - 0x080AAFA8
.org 0x080A5710
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org  0x080A5728
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5740
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5758
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5788
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A58E4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5980
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5998
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5A88
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5A94
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5ADC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5B00
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5B30
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5B9C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5E6C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5F2C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5F38
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5F50
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A5F5C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6064
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A61D8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A61E4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A61F0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6820
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6838
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6844
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6850
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6868
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6880
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A688C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A68B0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A68BC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A68C8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A68D4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A68EC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6904
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6928
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6934
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6A0C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6A18
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6A60
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6B2C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6B50
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6B98
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6BA4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6BB0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6BBC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6BC8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x080A6BEC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D0C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D18
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D24
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D30
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D3C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D48
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D60
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D6C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D78
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D84
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6D90
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6E38
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6E44
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6E50
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6F58
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A6FAC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7174
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A71B0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A721C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A72A0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A74B0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A74D4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A74E0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A74EC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A74F8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7570
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A757C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7588
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7594
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7624
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7630
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7648
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A76CC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7720
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7738
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7744
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A77D4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A77E0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A77EC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7864
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7870
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7900
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A790C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7918
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7924
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7930
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A79CC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7A38
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7A68
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7A74
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7A80
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7A8C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7B40
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7B4C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7B58
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7BF4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7C00
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7EC4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7ED0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7EDC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A7F84
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A81D0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A82C0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8350
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8398
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8404
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8410
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A841C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8428
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8434
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8440
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A844C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8458
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8494
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84A0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84AC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84B8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84C4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84D0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84DC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84E8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A84F4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8500
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A850C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8530
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8548
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8AF4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B00
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B0C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B18
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B24
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B30
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B3C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B48
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B54
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B60
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B6C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B78
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B84
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B90
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8B9C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BA8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BB4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BC0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BCC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BD8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BE4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BF0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8BFC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8C08
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8C14
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8C20
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8C2C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound

.org 0x080A8C38
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound
