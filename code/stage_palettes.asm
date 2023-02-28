; Modify levels palettes to not have that weird outline

; Beginning of room palette data
;-------------------------------------
; Data room palette
.org 0x840849A
	.dh 0x02DF
.org 0x84084DC
; Check palette in-game
	.dh 0x7FFF,0x4E71,0x4E71,0x3168,0x3168,0x2505
.org 0x84084FC
; Check palette in-game
	.dh 0x7FFD,0x6715,0x5270,0x41EC,0x312A,0x2086,0x2400
.org 0x840853A
; Check palette in-game
	.dh 0x0000,0x7FFF,0x4E71,0x3168,0x2505,0x4E71,0x3168
	.dh 0x03E0,0x03E0,0x03E0,0x279F,0x1EDF,0x05DA,0x00D2
	.dh 0x0009,0x0000

; SA-X chase room palette
.org 0x84086DA
	.dh 0x360A

;-------------------------------------
; Sector 1 entrance palette
.org 0x840889A
	.dh 0x1610
.org 0x84088B0
	.dh 0x0042
.org 0x84088BA
	.dh 0x0042
.org 0x840891A
	.dh 0x518C
.org 0x840893A
	.dh 0x41E9
.org 0x8408948
	.dh 0x0042

; Sector 2 entrance palette
.org 0x8408A5A
	.dh 0x2AAB
.org 0x8408A70
	.dh 0x0840
.org 0x8408A7A
	.dh 0x0840
.org 0x8408ADA
	.dh 0x518C
.org 0x8408AFA
	.dh 0x41E9
.org 0x8408B08
	.dh 0x0840

; Sector 3 entrance palette
.org 0x8408C1A
	.dh 0x1CF5
.org 0x8408C30
	.dh 0x0403
.org 0x8408C3A
	.dh 0x0403
.org 0x8408C9A
	.dh 0x518C
.org 0x8408CBA
	.dh 0x41E9
.org 0x8408CC8
	.dh 0x0403

; Sector 4 entrance palette
.org 0x8408DDA
	.dh 0x5CA3
.org 0x8408DF0
	.dh 0x0C20
.org 0x8408DFA
	.dh 0x0C20
.org 0x8408E88
	.dh 0x0C20
.org 0x8408E5A
	.dh 0x518C
.org 0x8408E7A
	.dh 0x41E9

; Sector 5 entrance palette
.org 0x8408F9A
	.dh 0x6250
.org 0x8408FB0
	.dh 0x0842
.org 0x8408FBA
	.dh 0x0842
.org 0x840901A
	.dh 0x518C
.org 0x840903A
	.dh 0x41E9
.org 0x8409048
	.dh 0x0842

; Sector 6 entrance palette
.org 0x840913A
	.dh 0x000E	; 0x41E9
.org 0x840915A
	.dh 0x5D31
.org 0x8409170
	.dh 0x0C01
.org 0x840917A
	.dh 0x0C01
.org 0x84091DA
	.dh 0x518C
.org 0x84091FA
	.dh 0x41E9
.org 0x8409208
	.dh 0x0C01

; Security room palette
.org 0x840931A
	.dh 0x4E4F
.org 0x8409328
	.dh 0x0842

; Recharge room palette
.org 0x840955A
	.dh 0x46B4

; Blue and green hex palette
.org 0x84097BA
	.dh 0x564D
.org 0x84097D6
	.dh 0x0C01
.org 0x84097F6
	.dh 0x254E
.org 0x8409936
	.dh 0x0C01
.org 0x8409956
	.dh 0x0C01
.org 0x8409976
	.dh 0x0C01
.org 0x8409996
	.dh 0x0C01
.org 0x84099B6
	.dh 0x0C01
.org 0x84099D6
	.dh 0x0C01
.org 0x84099F6
	.dh 0x0C01

; Blue and green hex palette SA-X
.org 0x8409A56
	.dh 0x0C01
.org 0x8409A3A
	.dh 0x566D
.org 0x8409BB6
	.dh 0x0C01
.org 0x8409BD6
	.dh 0x0C01
.org 0x8409BF6
	.dh 0x0C01
.org 0x8409C16
	.dh 0x0C01
.org 0x8409C36
	.dh 0x0C01
.org 0x8409C56
	.dh 0x0C01
.org 0x8409C76
	.dh 0x0C01

; Navigation room palette
.org 0x8409C9A
	.dh 0x01F0

; Sector connection palette
.org 0x8409EDA
	.dh 0x4680

; Save room palette
.org 0x840A19A
	.dh 0x1EB8

; Fake Chozo statue room palette
.org 0x840A3DA
	.dh 0x2655
.org 0x840A3FA
	.dh 0x0842
.org 0x840A43A
	.dh 0x520B

; Green pipes palette
.org 0x840A59A
	.dh 0x4A10
.org 0x840A5DA
	.dh 0x55CE	; 0x0DCE
.org 0x840A5F6
	.dh 0x01CE

;-------------------------------------
; Room palettes
;-------------------------------------

; Operations room palette
.org 0x846D612
	.dh 0x468A

; Unused hangar palette
.org 0x846D892
	.dh 0x4A4C

; Docking Bay palette
.org 0x846DB92
	.dh 0x4A4C
.org 0x846DBC0
	.dh 0x0062,0x0041	; 0x4A4C,0x0000

; Destroyed Docking Bay palette
.org 0x846DD52
	.dh 0x10AF
.org 0x846DD80
	.dh 0x1004,0x0802

; Reactor core palette
.org 0x846DF32
	.dh 0x4A62
.org 0x846DF48
	.dh 0x0840

; Overgrown reactor core palette
.org 0x846E232
	.dh 0x4220
.org 0x846E248
	.dh 0x0840

; Main Deck Sector 1 elevator palette
.org 0x846E3D2
	.dh 0x5610
.org 0x846E3E0
	.dh 0x0C01
.org 0x846E3F2
	.dh 0x41E9
.org 0x846E400
	.dh 0x0C01
.org 0x846E432
	.dh 0x518C

; Main Deck Sector 2 elevator palette
.org 0x846E692
	.dh 0x5610
.org 0x846E6A0
	.dh 0x0C01
.org 0x846E6C0
	.dh 0x0C01
.org 0x846E6B2
	.dh 0x41E9
.org 0x846E6F2
	.dh 0x518C

; Main Deck Sector 3 elevator palette
.org 0x846E952
	.dh 0x5610
.org 0x846E972
	.dh 0x41E9
.org 0x846E980
	.dh 0x0C01
.org 0x846E9B2
	.dh 0x518C

; Main Deck Sector 4 elevator palette
.org 0x846EC12
	.dh 0x5610
.org 0x846EC20
	.dh 0x0C01
.org 0x846EC32
	.dh 0x41E9
.org 0x846EC40
	.dh 0x0C01
.org 0x846EC72
	.dh 0x518C

; Main Deck Sector 5 elevator palette
.org 0x846EED2
	.dh 0x5610
.org 0x846EEF2
	.dh 0x41E9
.org 0x846EEE0
	.dh 0x0C01
.org 0x846EF00
	.dh 0x0C01
.org 0x846EF32
	.dh 0x518C

; Main Deck Sector 6 elevator palette
.org 0x846F192
	.dh 0x5610
.org 0x846F1A0
	.dh 0x0C01
.org 0x846F1B2
	.dh 0x41E9
.org 0x846F1C0
	.dh 0x0C01
.org 0x846F1F2
	.dh 0x518C

; SA-X elevator room palette
.org 0x846F452
	.dh 0x4A35
.org 0x846F474
	.dh 0x7FFF,0x4E71,0x3168,0x2505
.org 0x846F4D2
	.dh 0x518C
.org 0x846F4F2
	.dh 0x41E9
.org 0x846F500
	.dh 0x1400

; Habitation and operations elevator room palette
.org 0x846F712
	.dh 0x4A94
.org 0x846F72A
	.dh 0x0C01
.org 0x846F752
	.dh 0x498C
.org 0x846F780
	.dh 0x0C01
.org 0x846F772
	.dh 0x49E9

; Main Deck near Arachnus palette
.org 0x846F8D2
	.dh 0x46B9
.org 0x846F912
	.dh 0x4E50

; Yakuza room palette
.org 0x846FA92
	.dh 0x0E30
.org 0x846FAB2
	.dh 0x3206

; Restricted Lab palette
.org 0x846FC52
	.dh 0x34E0

; Restricted Lab Metroid tubes palette
.org 0x8470032
	.dh 0x4DC0

; Restricted Lab destroyed shaft palette
.org 0x84701F2
	.dh 0x082C

; Arachnus room palette
.org 0x84703B2
	.dh 0x2CED
.org 0x84703CC
	.dh 0x1400
.org 0x8470412
	.dh 0x2D44

; Before Quarantine Bay palette
.org 0x8470572
	.dh 0x00C7
.org 0x847058C
	.dh 0x0042

; Quarantine Bay palette
.org 0x8470832
	.dh 0x092E
.org 0x847084C
	.dh 0x0042
.org 0x8470892
	.dh 0x04E9
.org 0x84708B2
	.dh 0x49EC,0x7FFF,0x6B14,0x5A70
	.dh 0x4E0D,0x3526,0x20C2,0x1460
	.dh 0x5201,0x4580
.org 0x8470A00
	.dh 0x0000

; Main Deck dark tunnel palette
.org 0x8470A52
	.dh 0x0000

; Main Deck near Yakuza palette
.org 0x8470BB2
	.dh 0x3163
.org 0x8470C52
	.dh 0x3163

; Main Deck yellow and gray palette
.org 0x8470DF2
	.dh 0x2EF8
.org 0x8470E12
	.dh 0x4E50

; Habitation Deck palette
.org 0x8470FB2
	.dh 0x4A77

; Operations Deck palette
.org 0x8471172
	.dh 0x5293
.org 0x847118A
	.dh 0x0840
.org 0x84711A0
	.dh 0x0840

; Operations Deck power outage palette
.org 0x84713B2
	.dh 0x2D6B
.org 0x84713CA
	.dh 0x0840
.org 0x84713E0
	.dh 0x0840

; Restricted Lab connection palette
.org 0x8471672
	.dh 0x522A

; Main Deck red hallway palette
.org 0x8471832
	.dh 0x4A35
.org 0x84718B4
	.dh 0x7FFF,0x4E71,0x3168,0x2505

;-------------------------------------
; Sector 1 palettes
;-------------------------------------

; Sector 1 near Ridley palette
.org 0x849AD46
	.dh 0x420F

; Sector 1 lava room palette
.org 0x849AF06
	.dh 0x0802
.org 0x849AF22
	.dh 0x0C6A
.org 0x849AF26
	.dh 0x0802
.org 0x849AF42
	.dh 0x0C6A
.org 0x849AF46
	.dh 0x0802
.org 0x849AF62
	.dh 0x0C6A

; Sector 1 natural palette
.org 0x849B1C6
	.dh 0x0403
.org 0x849B1E2
	.dh 0x200C
.org 0x849B1E6
	.dh 0x0403
.org 0x849B202
	.dh 0x200C
.org 0x849B206
	.dh 0x0403
.org 0x849B222
	.dh 0x200C

; Ridley room palette
.org 0x849B386
	.dh 0x420F

;-------------------------------------
; Sector 2 palettes
;-------------------------------------

; Sector 2 lightly overgrown palette
.org 0x84CECBE
	.dh 0x4AB3
.org 0x84CECE0
	.dh 0x5550,0x44EB,0x3869,0x2846
.org 0x84CED3E
	.dh 0x0000,0x7FFF,0x4E71,0x3168
	.dh 0x2505,0x4E71,0x3168

; Sector 2 overgrown green vents palette
.org 0x84CEE7E
	.dh 0x4AB3
.org 0x84CEEA0
	.dh 0x5550,0x44EB,0x3869,0x2846

; Nettori room palette
.org 0x84CF03E
	.dh 0x168A

; Dead Nettori room palette
.org 0x84CF1FE
	.dh 0x11D9

; Sector 2 near Zazabi palette
.org 0x84CF3BE
	.dh 0x5AAF

; Sector 2 overgrown with vines palette
.org 0x84CF57E
	.dh 0x1269
.org 0x84CF5A0
	.dh 0x5550,0x44EB,0x3869,0x2846

; Sector 2 vines removed palette
.org 0x84CF73E
	.dh 0x1269
.org 0x84CF760
	.dh 0x5550,0x44EB,0x3869,0x2846

;-------------------------------------
; Sector 3 palettes
;-------------------------------------

; Main boiler melt down palette
.org 0x84F4452
	.dh 0x00F8

; Main boiler palette
.org 0x84F46B2
	.dh 0x00F8

; Sector 3 orange and yellow palette
.org 0x84F48F6
	.dh 0x0023
.org 0x84F4936
	.dh 0x0023
.org 0x84F4952
	.dh 0x2653
.org 0x84F4956
	.dh 0x0023
.org 0x84F496E
	.dh 0x2653

; Sector 3 dirty orange and yellow palette
.org 0x84F4AB4
	.dh 0x0023
.org 0x84F4AD2
	.dh 0x2653
.org 0x84F4AE4
	.dh 0x0023
.org 0x84F4AF6
	.dh 0x0023
.org 0x84F4B12
	.dh 0x2653
.org 0x84F4B16
	.dh 0x0023
.org 0x84F4B2E
	.dh 0x2653
.org 0x84F4B58	; 
	.dh 0x7FFF,0x4E71,0x3168,0x2505
	.dh 0x4E71,0x7FFF,0x7FFF,0x4E71
	.dh 0x3168
.org 0x84F4B92
	.dh 0x2653

; Main boiler control room palette
.org 0x84F4C76
	.dh 0x6118
.org 0x84F4C96
	.dh 0x4A4C

; Sector 3 red and orange palette
.org 0x84F4EB6
	.dh 0x0403
.org 0x84F4ED6
	.dh 0x0403
.org 0x84F4EF6
	.dh 0x0403
.org 0x84F4F12
	.dh 0x0435
.org 0x84F4F16	; 
	.dh 0x1885,0x24C8,0x350B,0x414E
	.dh 0x5191,0x61D4,0x294A,0x39CE
	.dh 0x5294,0x24A9,0x28AC,0x34F0
	.dh 0x4513
.org 0x84F4F4A	; 
	.dh 0x093D,0x0076,0x0850,0x0007
	.dh 0x34E9,0x7BF8,0x0000,0x4E71
	.dh 0x4E71,0x7FFF,0x4E71,0x3168
	.dh 0x2505,0x7FFF,0x4E71,0x3168

; Sector 3 heated room palette
.org 0x84F5156
	.dh 0x0C01
.org 0x84F5176
	.dh 0x0C01
.org 0x84F5196
	.dh 0x0C01
.org 0x84F51B2
	.dh 0x0435
.org 0x84F51B6	; 
	.dh 0x1885,0x24C8,0x350B,0x414E
	.dh 0x5191,0x61D4,0x294A,0x39CE
	.dh 0x5294,0x24A9,0x28AC,0x34F0
	.dh 0x4513
.org 0x84F51D6	; 
	.dh 0x0C01,0x1400,0x1C44,0x2C86
	.dh 0x30E9,0x454E,0x5E13,0x6F1B
	.dh 0x7FFF,0x7FFF,0x093D,0x0076
	.dh 0x0850,0x0007,0x34E9

;-------------------------------------
; Sector 5 palettes
;-------------------------------------

; Sector 5 blue and green palette
.org 0x8512F66
	.dh 0x4E4D
.org 0x8512FC8	; 
	.dh 0x7FFF,0x4E71,0x4E71,0x3168
	.dh 0x3168,0x2505
.org 0x8513006	; 
	.dh 0x0000,0x7FFF,0x4E71,0x3168
	.dh 0x2505,0x4E71,0x3168

; Desaturated colours for frozen rooms
; Sector 5 frozen blue and green palette
.org 0x8513126	; 
	.dh 0x49EC,0x7FFF,0x6B14,0x5A70
	.dh 0x4E0D,0x3526,0x20C2,0x3D41
	.dh 0x38A1
.org 0x8513148	; 
	.dh 0x6B14,0x5A70,0x4E0D,0x3526
	.dh 0x20C2,0x1460,0x73FF,0x6B14
	.dh 0x5A70
.org 0x85131A6	; 
	.dh 0x0000,0x7FFF,0x4E71,0x3168
	.dh 0x2505,0x4E71,0x3168
.org 0x85131BA	;
	.dh 0x6B14,0x5A70,0x4E0D,0x3526
	.dh 0x20C2

; Nightmare room palette
.org 0x85132E6
	.dh 0x4A4C
.org 0x8513306	; 
	.dh 0x0000,0x7FFF,0x4E71,0x3168
	.dh 0x2505,0x4E71,0x3168
.org 0x8513346	;
	.dh 0x3DAA

;-------------------------------------
; Sector 4 palettes
;-------------------------------------

; Upper Sector 4 palette
.org 0x85379EE
	.dh 0x5293	; 0x0012
.org 0x8537A0E
	.dh 0x764B

; Lower Sector 4 palette
.org 0x8537CCE
	.dh 0x31E5
.org 0x8537D4E
	.dh 0x31E5

; Serris room palette
.org 0x8537E8E
	.dh 0x31E5

; Pump control room palette
.org 0x853804E
	.dh 0x1ED4
.org 0x853806E
	.dh 0x3E70

; Serris skeleton room palette
.org 0x853820E
	.dh 0x5293
.org 0x85382EE
	.dh 0x3DAE

;-------------------------------------
; Sector 6 palettes
;-------------------------------------

; Sector 6 purple and green palette
.org 0x854F7DA	; 
; Select the original yellow-hue instead of all purple like in SE
	; Purple
	;.dh 0x0C01,0x4466,0x594E,0x4CCA
	;.dh 0x34A7,0x594E,0x4CCA,0x4888
	;.dh 0x4047,0x3C26,0x4847,0x6849
	; Yellow
	.dh 0x0C01,0x0F7B,0x4553,0x680E
	.dh 0x3007,0x135A,0x1A96,0x25D2
	.dh 0x2D0D,0x3849,0x5049,0x6849
.org 0x854F808	; 
	.dh 0x4C47,0x6849,0x02B8,0x01AF
.org 0x854F81C	;
; Keep yellow hue for the background
	; Purple
	;.dh 0x3404,0x4426,0x2403,0x1402
	; Yellow
	.dh 0x0A4E,0x09CB,0x0948,0x08C5
	.dh 0x3B20,0x2600,0x10E0,0x0122
	.dh 0x0264,0x0346,0x0B70,0x13F6

; BOX 2 room palette
.org 0x854FA7A	; 
; Select the original yellow-hue instead of all purple like in SE
	; Purple
	;.dh 0x0C01,0x4466,0x594E,0x4CCA
	;.dh 0x34A7,0x594E,0x4CCA,0x4888
	;.dh 0x4047,0x3C26,0x4847,0x6849
	; Yellow
	.dh 0x0C01,0x0F7B,0x4553,0x680E
	.dh 0x3007,0x135A,0x1A96,0x25D2
	.dh 0x2D0D,0x3849,0x5049,0x6849
.org 0x854FAA8	; 
	.dh 0x4C47,0x6849,0x02B8,0x01AF
	.dh 0x001F,0x03E0,0x7C00,0x7FFF
.org 0x854FABC	;
; Keep yellow hue for the background
	; Purple
	;.dh 0x3404,0x4426,0x2403,0x1402
	; Yellow
	.dh 0x0A4E,0x09CB,0x0948,0x08C5
	.dh 0x3B20,0x2600,0x10E0,0x0122
	.dh 0x0264,0x0346,0x0B70,0x13F6

; Sector 6 caves palette
.org 0x854FC3A	;
	.dh 0x0023
.org 0x854FC56
	.dh 0x35D1
.org 0x854FC7A
	.dh 0x4143

