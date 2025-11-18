;---------------------------------------------
;	Color Improvement hack by Piggy Chan!
;	Ported to MF_J by ShadowOne333
;----------------------------------------------

;-------------------------------------
;	Sprite palettes
;-------------------------------------

; First block of palettes (CHECK)
.org 0x08290084	; 0x0828DD7C in (U), beginning of suit palettes
	.import "code/ColorImprovement/palettes/Pal1.pal"

; Fusion suit saving pal 0 row 0 and onwards
.org 0x08291A04	; 0x0828F6FC in (U)
	.import "code/ColorImprovement/palettes/Pal1-1.pal"

; Second block of palettes (Unknown)
.org 0x082B7168	; 0x082B4E60 in (U)
	.import "code/ColorImprovement/palettes/Pal2.pal"

; SA-X palette
.org 0x082EA068	; 0x082E7D60 in (U)
	.import "code/ColorImprovement/palettes/Pal3.pal"

; SA-X Lab palette
.org 0x082EB4E0	; 0x082E91D8 in (U)
	.import "code/ColorImprovement/palettes/Pal4.pal"

; Hornoad palette
.org 0x082ECD74	; 0x082EAA6C in (U)
	.import "code/ColorImprovement/palettes/Pal5.pal"

; Halzyn palette
.org 0x082EEC2C	; 0x082EC924 in (U)
	.import "code/ColorImprovement/palettes/Pal6.pal"

; Moto palette
.org 0x082F1628	; 0x082EF320 in (U)
	.import "code/ColorImprovement/palettes/Pal7.pal"

; Save pad palette
.org 0x082F3580	; 0x082F1278 in (U)
	.import "code/ColorImprovement/palettes/Pal8.pal"

; Gunship palette
.org 0x082F68A4	; 0x082F459C in (U)
	.import "code/ColorImprovement/palettes/Pal9.pal"

; Unknown entity 1 palette
.org 0x082F6A60	; 0x082F4758 in (U)
	.import "code/ColorImprovement/palettes/Pal10.pal"

; Yameba palette
.org 0x082F7D68	; 0x082F5A60 in (U)
	.import "code/ColorImprovement/palettes/Pal11.pal"

; Security pad palette
.org 0x082F96F8	; 0x082F73F0 in (U)
	.import "code/ColorImprovement/palettes/Pal12.pal"

; Unknown entity 2 palette
.org 0x082F9BD6	; 0x082F78CE in (U)
	.import "code/ColorImprovement/palettes/Pal13.pal"

; Area banner palette
.org 0x082FA5D4	; 0x082F82CC in (U)
	.import "code/ColorImprovement/palettes/Pal14.pal"

; Zombie palette
.org 0x082FCEE0	; 0x082FABD8 in (U)
	.import "code/ColorImprovement/palettes/Pal15.pal"

; Geemer palette
.org 0x082FE918	; 0x082FC610 in (U)
	.import "code/ColorImprovement/palettes/Pal16.pal"

; Arachnus palette
.org 0x08303420	; 0x08301118 in (U)
	.import "code/ColorImprovement/palettes/Pal17.pal"

; Morph Ball ability palette
.org 0x08307E0C	; 0x08305B04 in (U)
	.import "code/ColorImprovement/palettes/Pal18.pal"

; Hi Jump ability palette
.org 0x0830AFD0	; 0x08308CC8 in (U)
	.import "code/ColorImprovement/palettes/Pal19.pal"

; Speed Booster ability palette
.org 0x0830D870	; 0x0830B568 in (U)
	.import "code/ColorImprovement/palettes/Pal20.pal"

; Space Jump ability palette
.org 0x08310110	; 0x0830DE08 in (U)
	.import "code/ColorImprovement/palettes/Pal21.pal"

; Gravity Suit ability palette
.org 0x083129B0	; 0x083106A8 in (U)
	.import "code/ColorImprovement/palettes/Pal22.pal"

; Screw Attack ability palette
.org 0x08315250	; 0x08312F48 in (U)
	.import "code/ColorImprovement/palettes/Pal23.pal"

; Waver palette
.org 0x08319770	; 0x08317468 in (U)
	.import "code/ColorImprovement/palettes/Pal24.pal"

; Sciser palette
.org 0x0831A9CC	; 0x083186C4 in (U)
	.import "code/ColorImprovement/palettes/Pal25.pal"

; Gold Sciser palette
.org 0x0831C420	; 0x0831A118 in (U)
	.import "code/ColorImprovement/palettes/Pal26.pal"

; Sidehopper palette
.org 0x0831CC88	; 0x0831A980 in (U)
	.import "code/ColorImprovement/palettes/Pal27.pal"

; Dessgeega palette
.org 0x0831D8A0	; 0x0831B598 in (U)
	.import "code/ColorImprovement/palettes/Pal28.pal"

; X-barrier core normal palette
.org 0x0831E4F8; 0x0831C1F0 in (U)
	.import "code/ColorImprovement/palettes/Pal29.pal"

; Navigation pad palette
.org 0x0831FE78	; 0x0831DB70 in (U)
	.import "code/ColorImprovement/palettes/Pal30.pal"

; Message box palette
.org 0x083216D8	; 0x0831F3D0 in (U)
	.import "code/ColorImprovement/palettes/Pal31.pal"

; Data pad palette
.org 0x08323320	; 0x08321018 in (U)
	.import "code/ColorImprovement/palettes/Pal32.pal"

; Zebesian wall palette
.org 0x08324EF4	; 0x08322BEC in (U)
	.import "code/ColorImprovement/palettes/Pal33.pal"

; Recharge pad palette
.org 0x083274F8	; 0x083251F0 in (U)
	.import "code/ColorImprovement/palettes/Pal34.pal"

; Atmospheric stabilizer palette
.org 0x083292F8	; 0x08326FF0 in (U)
	.import "code/ColorImprovement/palettes/Pal35.pal"

; Chozo Statue palette
.org 0x0832A618	; 0x08328310 in (U)
	.import "code/ColorImprovement/palettes/Pal36.pal"

; Charge beam core X palette
.org 0x0832D00C	; 0x0832AD04 in (U)
	.import "code/ColorImprovement/palettes/Pal37.pal"

; Wide beam core X palette
.org 0x0832FCF0	; 0x0832D9E8 in (U)
	.import "code/ColorImprovement/palettes/Pal38.pal"

; Plasma beam core X palette
.org 0x08332590	; 0x08330288 in (U)
	.import "code/ColorImprovement/palettes/Pal39.pal"

; Wave beam core X palette
.org 0x08334E30	; 0x08332B28 in (U)
	.import "code/ColorImprovement/palettes/Pal40.pal"

; Ice beam core X palette
.org 0x083376D0	; 0x083353C8 in (U)
	.import "code/ColorImprovement/palettes/Pal41.pal"

; Kago palette
.org 0x08339B94	; 0x0833788C in (U)
	.import "code/ColorImprovement/palettes/Pal42.pal"

; Gate palette
.org 0x0833AAC4	; 0x083387BC in (U)
	.import "code/ColorImprovement/palettes/Pal43.pal"

; Zoro palette
.org 0x0833E11C	; 0x0833BE14 in (U)
	.import "code/ColorImprovement/palettes/Pal44.pal"

; Blue Zoro palette
.org 0x0833E13C	; 0x0833BE34 in (U)
	.import "code/ColorImprovement/palettes/Pal45.pal"

; Kihunter palette
.org 0x0833FE44	; 0x0833DB3C in (U)
	.import "code/ColorImprovement/palettes/Pal46.pal"

; Reo palette
.org 0x08341300	; 0x0833EFF8 in (U)
	.import "code/ColorImprovement/palettes/Pal47.pal"

; Namihe and fune palette
.org 0x08343210	; 0x08340F08 in (U)
	.import "code/ColorImprovement/palettes/Pal48.pal"

; BOX palette
.org 0x08349398	; 0x08347090 in (U)
	.import "code/ColorImprovement/palettes/Pal49.pal"

; Geruda palette
.org 0x0834AC54	; 0x0834894C in (U)
	.import "code/ColorImprovement/palettes/Pal50.pal"

; Control pad palette
.org 0x0834BFAC	; 0x08349CA4 in (U)
	.import "code/ColorImprovement/palettes/Pal51.pal"

; Habitation pad palette (Extra 0E past the end)
.org 0x0834CC0C ; 0x0834A904 in (U)
	.import "code/ColorImprovement/palettes/Pal52.pal"

; Operations room pad palette
.org 0x0834E0A4	; 0x0834BD9C in (U)
	.import "code/ColorImprovement/palettes/Pal53.pal"

; Scientist palette
.org 0x0834F684	; 0x0834D37C in (U)
	.import "code/ColorImprovement/palettes/Pal54.pal"

; Skultera palette
.org 0x08350FFC	; 0x0834ECF4 in (U)
	.import "code/ColorImprovement/palettes/Pal55.pal"

; Zeela palette
.org 0x08352454	; 0x0835014C in (U)
	.import "code/ColorImprovement/palettes/Pal56.pal"

; Red Zeela palette
.org 0x083539C4	; 0x083516BC in (U)
	.import "code/ColorImprovement/palettes/Pal57.pal"

; Sova palette
.org 0x08355224	; 0x08352F1C in (U)
	.import "code/ColorImprovement/palettes/Pal58.pal"

; Yard palette
.org 0x08356FCC	; 0x08354CC4 in (U)
	.import "code/ColorImprovement/palettes/Pal59.pal"

; Evir palette
.org 0x08358878	; 0x08356570 in (U)
	.import "code/ColorImprovement/palettes/Pal60.pal"

; Bull palette
.org 0x083596D4	; 0x083573CC in (U)
	.import "code/ColorImprovement/palettes/Pal61.pal"

; Memu palette
.org 0x0835A1DC	; 0x08357ED4 in (U)
	.import "code/ColorImprovement/palettes/Pal62.pal"

; Geruboss palette
.org 0x0835AA6C	; 0x08358764 in (U)
	.import "code/ColorImprovement/palettes/Pal63.pal"

; Choot palette
.org 0x0835BAD8	; 0x083597D0 in (U)
	.import "code/ColorImprovement/palettes/Pal64.pal"

; Zebesian palette
.org 0x0835D52C	; 0x0835B224 in (U)
	.import "code/ColorImprovement/palettes/Pal65.pal"

; Gold Zebesian palette
.org 0x0835FEF8	; 0x0835DBF0 in (U)
	.import "code/ColorImprovement/palettes/Pal66.pal"

; Blue X palette
.org 0x083611A0	; 0x0835EE98 in (U)
	.import "code/ColorImprovement/palettes/Pal67.pal"

; Missile hatch palette
.org 0x08361F08	; 0x0835FC00 in (U)
	.import "code/ColorImprovement/palettes/Pal68.pal"

; X-barrier core super palette
.org 0x08362814	; 0x0836050C in (U)
	.import "code/ColorImprovement/palettes/Pal69.pal"

; X-barrier core power palette
.org 0x08363994	; 0x0836168C in (U)
	.import "code/ColorImprovement/palettes/Pal70.pal"

; Ripper palette
.org 0x083645A8	; 0x083622A0 in (U)
	.import "code/ColorImprovement/palettes/Pal71.pal"

; Zoro cocoon palette
.org 0x08365634	; 0x0836332C in (U)
	.import "code/ColorImprovement/palettes/Pal72.pal"

; Gadora palette
.org 0x08367054	; 0x08364D4C in (U)
	.import "code/ColorImprovement/palettes/Pal73.pal"

; Destroyed data pad palette
.org 0x08367C60	; 0x08365958 in (U)
	.import "code/ColorImprovement/palettes/Pal74.pal"

; Nettori palette
.org 0x0836BEDC	; 0x08369BD4 in (U)
	.import "code/ColorImprovement/palettes/Pal75.pal"

; Nettori medium health palette
.org 0x0836C788	; 0x0836A480 in (U)
	.import "code/ColorImprovement/palettes/Pal76.pal"

; Nettori low health palette
.org 0x0836C7A8	; 0x0836A4A0 in (U)
	.import "code/ColorImprovement/palettes/Pal77.pal"

; Nettori animated palette
.org 0x0836C7C8	; 0x0836A4C0 in (U)
	.import "code/ColorImprovement/palettes/Pal78.pal"

; Zazabi palette
.org 0x08374020	; 0x08371D18 in (U)
	.import "code/ColorImprovement/palettes/Pal79.pal"

; Elevator pad palette
.org 0x083757D8	; 0x083734D0 in (U)
	.import "code/ColorImprovement/palettes/Pal80.pal"

; Serris palette
.org 0x08379A00	; 0x083776F8 in (U)
	.import "code/ColorImprovement/palettes/Pal81.pal"

; Owtch palette
.org 0x0837B2D8	; 0x08378FD0 in (U)
	.import "code/ColorImprovement/palettes/Pal82.pal"

; Pillar palette
.org 0x0837C600	; 0x0837A2F8 in (U)
	.import "code/ColorImprovement/palettes/Pal83.pal"

; Genesis palette
.org 0x0837DECC	; 0x0837BBC4 in (U)
	.import "code/ColorImprovement/palettes/Pal84.pal"

; Puyo palette
.org 0x0837F0E0	; 0x0837CDD8 in (U)
	.import "code/ColorImprovement/palettes/Pal85.pal"

; Big flashing number palette
.org 0x08380DAC	; 0x0837EAA4 in (U)
	.import "code/ColorImprovement/palettes/Pal86.pal"

; Flashing number palette
.org 0x08381AB4	; 0x0837F7AC in (U)
	.import "code/ColorImprovement/palettes/Pal87.pal"

; Zebesian Aqua palette
.org 0x08382E00	; 0x08380AF8 in (U)
	.import "code/ColorImprovement/palettes/Pal88.pal"

; Etecoon and dachora palette
.org 0x08385BB0	; 0x083838A8 in (U)
	.import "code/ColorImprovement/palettes/Pal89.pal"

; Powamp palette
.org 0x083887B4	; 0x083864AC in (U)
	.import "code/ColorImprovement/palettes/Pal90.pal"

; Zozoro palette
.org 0x08389A20	; 0x08387718 in (U)
	.import "code/ColorImprovement/palettes/Pal91.pal"

; SA-X monster palette
.org 0x0838F2BC	; 0x0838CFB4 in (U)
	.import "code/ColorImprovement/palettes/Pal92.pal"

; BOX 2 palette
.org 0x0839705C	; 0x08394D54 in (U)
	.import "code/ColorImprovement/palettes/Pal93.pal"

; Omega Metroid palette
.org 0x0839B450	; 0x08399148 in (U)
	.import "code/ColorImprovement/palettes/Pal94.pal"

; Gunship end palette
.org 0x083A0860	; 0x0839E558 in (U)
	.import "code/ColorImprovement/palettes/Pal95.pal"

; Frozen Ridley palette
.org 0x083A2A88	; 0x083A0780 in (U)
	.import "code/ColorImprovement/palettes/Pal96.pal"

; Varia Suit ability palette
.org 0x083A7700	; 0x083A53F8 in (U)
	.import "code/ColorImprovement/palettes/Pal97.pal"

; Omega Metroid husk palette
.org 0x083A9260	; 0x083A6F58 in (U)
	.import "code/ColorImprovement/palettes/Pal98.pal"

; Metroid husk palette
.org 0x083AB20C	; 0x083A8F04 in (U)
	.import "code/ColorImprovement/palettes/Pal99.pal"

; Ridley palette
.org 0x083B0314	; 0x083AE00C in (U)
	.import "code/ColorImprovement/palettes/Pal100.pal"

; Ridley pre-spawn palette
.org 0x083B2B40	; 0x083B0838 in (U)
	.import "code/ColorImprovement/palettes/Pal101.pal"

; Yakuza palette
.org 0x083B74D8	; 0x083B51D0 in (U)
	.import "code/ColorImprovement/palettes/Pal102.pal"

; Nightmare palette
.org 0x083BE8D4	; 0x083BC5CC in (U)
	.import "code/ColorImprovement/palettes/Pal103.pal"

; Unknown entity 3 palette
.org 0x083C1D5A	; 0x083BF792 in (U)
	.import "code/ColorImprovement/palettes/Pal104.pal"

; Common sprite palette
.org 0x083E66B8	; 0x083E40DC in (U)
	.import "code/ColorImprovement/palettes/Pal105.pal"

;-------------------------------------
;	Room palettes
;-------------------------------------

; Data room palette
.org 0x08408478	; 0x08405E9C in (U)
	.import "code/ColorImprovement/palettes/Pal106.pal"

; Unknown room 1 palette (?)
.org 0x08408638	; 0x0840605C in (U)
	.import "code/ColorImprovement/palettes/Pal106-1.pal"

; SA-X chase room palette
.org 0x084086B8	; 0x084060DC in (U)
	.import "code/ColorImprovement/palettes/Pal107.pal"

; Sector 1 entrance palette
.org 0x08408878	; 0x0840629C in (U)
	.import "code/ColorImprovement/palettes/Pal108.pal"

; Sector 2 entrance palette
.org 0x08408A38	; 0x0840645C in (U)
	.import "code/ColorImprovement/palettes/Pal109.pal"

; Sector 3 entrance palette
.org 0x08408BF8	; 0x0840661C in (U)
	.import "code/ColorImprovement/palettes/Pal110.pal"

; Sector 4 entrance palette
.org 0x08408DB8	; 0x084067DC in (U)
	.import "code/ColorImprovement/palettes/Pal111.pal"

; Sector 5 entrance palette
.org 0x08408F78	; 0x0840699C in (U)
	.import "code/ColorImprovement/palettes/Pal112.pal"

; Sector 6 entrance palette
.org 0x08409138	; 0x08406B5C in (U)
	.import "code/ColorImprovement/palettes/Pal113.pal"

; Security room palette
.org 0x084092F8	; 0x08406D1C in (U)
	.import "code/ColorImprovement/palettes/Pal114.pal"

; Recharge room palette
.org 0x08409538	; 0x08406F5C in (U)
	.import "code/ColorImprovement/palettes/Pal115.pal"

; Unknown room 3 palette (?)
.org 0x084096F8	; 0x0840711C in (U)
	.import "code/ColorImprovement/palettes/Pal115-1.pal"

; Blue and green hex palette
.org 0x08409778	; 0x0840719C in (U)
	.import "code/ColorImprovement/palettes/Pal116.pal"

; Blue and green hex SA-X palette
.org 0x084099F8	; 0x0840741C in (U)
	.import "code/ColorImprovement/palettes/Pal117.pal"

; Navigation room palette
.org 0x08409C78	; 0x0840769C in (U)
	.import "code/ColorImprovement/palettes/Pal118.pal"

; Sector connection room palette
.org 0x08409EB8	; 0x084078DC in (U)
	.import "code/ColorImprovement/palettes/Pal119.pal"

; Save room palette
.org 0x0840A178	; 0x08407A9C in (U)
	.import "code/ColorImprovement/palettes/Pal120.pal"

; Fake Chozo Statue room palette
.org 0x0840A3B8	; 0x08407CDC in (U)
	.import "code/ColorImprovement/palettes/Pal121.pal"

; Green pipes room palette
.org 0x0840A578	; 0x08407E9C in (U)
	.import "code/ColorImprovement/palettes/Pal122.pal"

; Common BG palette
.org 0x0840A738	; 0x0840805C in (U)
	.import "code/ColorImprovement/palettes/Pal123.pal"

; Animated hatch palette
.org 0x0840A938	; 0x0840825C in (U)
	.import "code/ColorImprovement/palettes/Pal124.pal"

; Animated locked hatch palette
.org 0x0840A9F8	; 0x0840831C in (U)
	.import "code/ColorImprovement/palettes/Pal125.pal"

;-------------------------------------
;	Area palettes
;-------------------------------------

; Operations room palette
.org 0x0846D5F0	; 0x0846AF14 in (U)
	.import "code/ColorImprovement/palettes/Pal126.pal"

; Unused hangar room palette
.org 0x0846D870	; 0x0846B194 in (U)
	.import "code/ColorImprovement/palettes/Pal127.pal"

; Docking bay room palette
.org 0x0846DB70	; 0x0846B494 in (U)
	.import "code/ColorImprovement/palettes/Pal128.pal"

; Destroyed Docking bay room palette
.org 0x0846DD30	; 0x0846B654 in (U)
	.import "code/ColorImprovement/palettes/Pal129.pal"

; Reactor core room palette
.org 0x0846DEF0	; 0x0846B814 in (U)
	.import "code/ColorImprovement/palettes/Pal130.pal"

; Overgrown reactor core room palette
.org 0x0846E1F0	; 0x0846BB14 in (U)
	.import "code/ColorImprovement/palettes/Pal131.pal"

; Main Deck Sector 1 Elevator room palette
.org 0x0846E3B0	; 0x0846BCD4 in (U)
	.import "code/ColorImprovement/palettes/Pal132.pal"

; Main Deck Sector 2 Elevator room palette
.org 0x0846E670	; 0x0846BF94 in (U)
	.import "code/ColorImprovement/palettes/Pal133.pal"

; Main Deck Sector 3 Elevator room palette
.org 0x0846E930	; 0x0846C254 in (U)
	.import "code/ColorImprovement/palettes/Pal134.pal"

; Main Deck Sector 4 Elevator room palette
.org 0x0846EBF0	; 0x0846C514 in (U)
	.import "code/ColorImprovement/palettes/Pal135.pal"

; Main Deck Sector 5 Elevator room palette
.org 0x0846EEB0	; 0x0846C7D4 in (U)
	.import "code/ColorImprovement/palettes/Pal136.pal"

; Main Deck Sector 6 Elevator room palette
.org 0x0846F170	; 0x0846CA94 in (U)
	.import "code/ColorImprovement/palettes/Pal137.pal"

; SA-X Elevator room palette
.org 0x0846F430	; 0x0846CD54 in (U)
	.import "code/ColorImprovement/palettes/Pal138.pal"

; Habitation and operations elevator room palette
.org 0x0846F6F0	; 0x0846D014 in (U)
	.import "code/ColorImprovement/palettes/Pal139.pal"

; Main Deck near Arachnus palette
.org 0x0846F8B0	; 0x0846D1D4 in (U)
	.import "code/ColorImprovement/palettes/Pal140.pal"

; Yakuza room palette
.org 0x0846FA70	; 0x0846D394 in (U)
	.import "code/ColorImprovement/palettes/Pal141.pal"

; Restricted lab palette
.org 0x0846FC30	; 0x0846D554 in (U)
	.import "code/ColorImprovement/palettes/Pal142.pal"

; Restricted lab Metroid tubes palette
.org 0x08470010	; 0x0846D934 in (U)
	.import "code/ColorImprovement/palettes/Pal143.pal"

; Restricted lab destroyed tubes palette
.org 0x084701D0	; 0x0846DAF4 in (U)
	.import "code/ColorImprovement/palettes/Pal144.pal"

; Arachnus room palette
.org 0x08470390	; 0x0846DCB4 in (U)
	.import "code/ColorImprovement/palettes/Pal145.pal"

; Before Quarantine bay room palette
.org 0x08470550	; 0x0846DE74 in (U)
	.import "code/ColorImprovement/palettes/Pal146.pal"

; Quarantine bay room palette
.org 0x08470810	; 0x0846E134 in (U)
	.import "code/ColorImprovement/palettes/Pal147.pal"

; Main Deck dark tunnel palette
.org 0x084709D0	; 0x0846E2F4 in (U)
	.import "code/ColorImprovement/palettes/Pal148.pal"

; Main Deck near Yakuza room palette
.org 0x08470B90	; 0x0846E4B4 in (U)
	.import "code/ColorImprovement/palettes/Pal149.pal"

; Main Deck yellow and gray room palette
.org 0x08470DD0	; 0x0846E6F4 in (U)
	.import "code/ColorImprovement/palettes/Pal150.pal"

; Habitation Deck room palette
.org 0x08470F90	; 0x0846E8B4 in (U)
	.import "code/ColorImprovement/palettes/Pal151.pal"

; Operations Deck palette
.org 0x08471150	; 0x0846EA74 in (U)
	.import "code/ColorImprovement/palettes/Pal152.pal"

; Operations Deck power outage palette
.org 0x08471390	; 0x0846ECB4 in (U)
	.import "code/ColorImprovement/palettes/Pal153.pal"

; Restricted Lab connection palette
.org 0x08471650	; 0x0846EF74 in (U)
	.import "code/ColorImprovement/palettes/Pal154.pal"

; Main Deck red hallway palette
.org 0x08471810	; 0x0846F134 in (U)
	.import "code/ColorImprovement/palettes/Pal155.pal"

;-------------------------------------
;	Special rooms palettes
;-------------------------------------

; We'll start importing palettes in bulk from here

;-------------------------------------

; Unused Ridley room palette
.org 0x0849AB64	; 0x08498488 in (U)
	.import "code/ColorImprovement/palettes/Pal156-160.pal"

; Sector 1 near Ridley palette
.org 0x0849AD24	; 0x08498648 in (U)
	;.import "code/ColorImprovement/palettes/Pal157.pal"

; Sector 1 lava room palette
.org 0x0849AEE4	; 0x08498808 in (U)
	;.import "code/ColorImprovement/palettes/Pal158.pal"

; Sector 1 natural palette
.org 0x0849B1A4	; 0x08498AC8 in (U)
	;.import "code/ColorImprovement/palettes/Pal159.pal"

; Ridley room palette
.org 0x0849B364	; 0x08498C88 in (U)
	;.import "code/ColorImprovement/palettes/Pal160.pal

;-------------------------------------
;	Special rooms palettes #2
;-------------------------------------

; Sector 2 lightly overgrown palette
.org 0x084CEC9C	; 0x084CC5C0 in (U)
	.import "code/ColorImprovement/palettes/Pal161-167.pal"

; Sector 2 overgrown green vents palette
.org 0x084CEE5C	; 0x084CC780 in (U)
	;.import "code/ColorImprovement/palettes/Pal162.pal"

; Nettori room palette
.org 0x084CF01C	; 0x084CC940 in (U)
	;.import "code/ColorImprovement/palettes/Pal163.pal"

; Dead Nettori room palette
.org 0x084CF1DC	; 0x084CCB00 in (U)
	;.import "code/ColorImprovement/palettes/Pal164.pal"

; Sector 2 near Zazabi palette
.org 0x084CF39C	; 0x084CCCC0 in (U)
	;.import "code/ColorImprovement/palettes/Pal165.pal"

; Sector 2 overgrown with vines palette
.org 0x084CF55C	; 0x084CCE80 in (U)
	;.import "code/ColorImprovement/palettes/Pal166.pal"

; Sector 2 vines removed palette
.org 0x084CF71C	; 0x084CD040 in (U)
	;.import "code/ColorImprovement/palettes/Pal167.pal

;-------------------------------------
;	Special rooms palettes #3
;-------------------------------------

; Main boiler melt down palette
.org 0x084F4414	; 0x084F1D38 in (U)
	.import "code/ColorImprovement/palettes/Pal168-174.pal"

; Main boiler palette
.org 0x084F4674	; 0x084F1F98 in (U)
	;.import "code/ColorImprovement/palettes/Pal169.pal"

; Sector 3 orange and yellow palette
.org 0x084F48D4	; 0x084F21F8 in (U)
	;.import "code/ColorImprovement/palettes/Pal170.pal"

; Sector 3 dirty orange and yellow palette
.org 0x084F4A94	; 0x084F23B8 in (U)
	;.import "code/ColorImprovement/palettes/Pal171.pal"

; Main boiler control room palette
.org 0x084F4C54	; 0x084F2578 in (U)
	;.import "code/ColorImprovement/palettes/Pal172.pal"

; Sector 3 red and orange palette
.org 0x084F4E94	; 0x084F27B8 in (U)
	;.import "code/ColorImprovement/palettes/Pal173.pal"

; Sector 3 heated room palette
.org 0x084F5134	; 0x084F2A58 in (U)
	;.import "code/ColorImprovement/palettes/Pal174.pal"

; Palette changes end at 0x084F2CE0

;-------------------------------------
;	Special rooms palettes #4
;-------------------------------------

; Sector 5 blue and green palette
.org 0x08512F44	; 0x08510868 in (U)
	.import "code/ColorImprovement/palettes/Pal175-177.pal"

; Sector 5 frozen blue and green palette
.org 0x08513104	; 0x08510A28 in (U)
	;.import "code/ColorImprovement/palettes/Pal176.pal"

; Nightmare room palette
.org 0x085132C4	; 0x08510BE8 in (U)
	;.import "code/ColorImprovement/palettes/Pal177.pal

;-------------------------------------
;	Special rooms palettes #5
;-------------------------------------

; Upper Sector 4 palette
.org 0x085379CC	; 0x085352F0 in (U)
	.import "code/ColorImprovement/palettes/Pal178-182.pal"

; Lower Sector 4 palette
.org 0x08537CAC	; 0x085355D0 in (U)
	;.import "code/ColorImprovement/palettes/Pal179.pal"

; Serris room palette
.org 0x08537E6C	; 0x08535790 in (U)
	;.import "code/ColorImprovement/palettes/Pal180.pal"

; Pump control unit palette
.org 0x0853802C	; 0x08535950 in (U)
	;.import "code/ColorImprovement/palettes/Pal181.pal"

; Serris skeleton room palette
.org 0x085381EC	; 0x08535B10 in (U)
	;.import "code/ColorImprovement/palettes/Pal182.pal

;-------------------------------------
;	Special rooms palettes #6
;-------------------------------------

; Sector 6 purple and green palette
.org 0x0854F7B8	; 0x0854D0DC in (U)
	.import "code/ColorImprovement/palettes/Pal183-185.pal"

; BOX 2 room palette
.org 0x0854FA58	; 0x0854D37C in (U)
	;.import "code/ColorImprovement/palettes/Pal184.pal"

; Sector 6 caves palette
.org 0x0854FC18	; 0x0854D53C in (U)
	;.import "code/ColorImprovement/palettes/Pal185.pal

;-------------------------------------
;	Special rooms palettes #7
;-------------------------------------

; Pause screen minimap palette
.org 0x08567E84	; 0x085657A8 in (U)
	.import "code/ColorImprovement/palettes/Pal186-189.pal"

; Pause screen BG palette
.org 0x08567EE4	; 0x08565808 in (U)
	;.import "code/ColorImprovement/palettes/Pal187.pal"

; Computer conversation BG palette
.org 0x08568084	; 0x085659A8 in (U)
	;.import "code/ColorImprovement/palettes/Pal188.pal"

; Pause screen OBJ palette
.org 0x08568224	; 0x08565B48 in (U)
	;.import "code/ColorImprovement/palettes/Pal189.pal

;-------------------------------------
;	Special rooms palettes #8
;-------------------------------------

; Computer conversation X-barrier palette; 0x08576804 in (U)
; Computer conversation yellow X palette; 0x08576844 in (U)
; Computer conversation animals palette; 0x08576884 in (U)
; Computer conversation blue X palette; 0x085768C4 in (U)

; Palette data for the Computer conversation pop-up graphics?
.org 0x0857E3D4	; 0x0857BCD4 in (U)
	.dh 0x48FB,0x48FB,0x48FB,0x48FB,0x48FB
.org 0x0857E3F4	; 0x0857BCF4 in (U)
	.dh 0x0280,0x0280,0x0280,0x0280,0x0280

;-------------------------------------
;	Beam palettes
;-------------------------------------

; Normal beam palette
.org 0x0858BBF4	; 0x0858B464 in (U)
	.import "code/ColorImprovement/palettes/Pal190-195.pal"

; Charge beam palette
.org 0x0858BC14	; 0x0858B484 in (U)
	;.import "code/ColorImprovement/palettes/Pal191.pal"

; Wide beam palette
.org 0x0858BC34	; 0x0858B4A4 in (U)
	;.import "code/ColorImprovement/palettes/Pal192.pal"

; Plasma beam palette
.org 0x0858BC54	; 0x0858B4C4 in (U)
	;.import "code/ColorImprovement/palettes/Pal193.pal"

; Wave beam palette
.org 0x0858BC74	; 0x0858B4E4 in (U)
	;.import "code/ColorImprovement/palettes/Pal194.pal"

; Ice beam palette
.org 0x0858BC94	; 0x0858B504 in (U)
	;.import "code/ColorImprovement/palettes/Pal195.pal

;-------------------------------------
;	Intro palettes
;-------------------------------------

; Intro hornoad encounter OBJ palette
.org 0x085A27C8	; 0x085A1D78 in (U)
	.import "code/ColorImprovement/palettes/Pal196.pal"

; Intro hornoad encounter BG palette
.org 0x085A9894	; 0x085A8E44 in (U)
	.import "code/ColorImprovement/palettes/Pal197.pal"

; Intro ship landing BG palette
.org 0x08600234	; 0x085FF708 in (U)
	.import "code/ColorImprovement/palettes/Pal198.pal"

; Navigation room monologues palette?
.org 0x0867839E	; 0x08677872 in (U)
	.import "code/ColorImprovement/palettes/Pal199.pal"

; Unknown scene 1 palette
.org 0x0867873C	; 0x08677C10 in (U)
	.import "code/ColorImprovement/palettes/Pal200.pal"

; Unknown scene 2 palette
.org 0x086793D4	; 0x086788A8 in (U)
	.import "code/ColorImprovement/palettes/Pal201.pal"

; Unknown menu palette
.org 0x0873D704	; 0x0873DAC8 in (U)
	.import "code/ColorImprovement/palettes/Pal202.pal"

