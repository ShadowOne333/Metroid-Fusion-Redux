; Main file for Metroid Fusion (J) patches.
; Metroid Fusion (J) ROM Map: https://labk.org/maps/app/?game=mf&region=J&map=data
.gba
.open "fusion.gba","Metroid Fusion.gba",0x8000000

; Language selection code by biospark
.include "MF_J_language.asm"

; Better Morph Roll code
; Makes the morphball only do its "rolling" animation if the ball is moving
.include "code/better_morph_roll.asm"

; Better Suits Palette changes.
; Modifies the suits slightly to better match their official artwork, with emphasis on the Fusion Varia Suit.
.include "code/better_suits.asm"

; Equipment Screen Fix code
; Gets rid of ugly spaces between items on the Equipment screen when you get items out of order.
.include "code/equipment_screen_fix.asm"

; Faster Door Transitions code by somerando(caauyjdp)
; Door transitions are now faster, and this fixes an issue where vertical scrolling during door transition would get stuck in a loop when needing to scroll an odd number of pixels
.include "code/faster_door_transitions.asm"

; Keep Speed / Smooth Landing code
; Horizontal speed doesn't get reset to 0 every time Samus lands on a surface. Ie: you hit the ground running, and maintain speed boost after jumping and landing, like in project base, however it does reset the speed boost counter.
.include "code/keep_speed.asm"

; Miscellaneous patches ported to Japanese Fusion by ShadowOne333
; Includes hacks like single wall jumping, Walljumping frame fix, endgame ship OAM fix, IBJ, and others.
; Authors: Kazuto, biospark, and others
.include "code/misc.asm"

; Better Stage outlines
; Based on Special Edition, this modifies the red outlines that appear throughout to suitable colours depending on the environment
.include "code/stage_palettes.asm"

; Unused Docking Bay
; Restores a previously unused area (Docking Bay) found in the Main Deck, just north of the starting area
.include "code/unused_dock.asm"

; Zazabi's AI fix
; Modifies Zazabi's AI to make it vulnerable to all Charged beams and all Missile types. Overwrites existing code in Zazabi AI.
.include "code/zazabi_fix.asm"

.close
