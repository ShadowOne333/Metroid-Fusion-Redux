; Sequence Breaking Fusion ported to japanese Fusion by SpineShark
; Special thanks to:
;       Kazuto for the Sequence Breaking Fusion hack
;       Yohann and Meinos Belfort for turning the IPS patch into hexdump ASM
;       Biospark for the data maps, function dumper and tank fix
;       ShadowOne333 for the partial SBF port
;.gba
;.open "MF_J.gba","SequenceBreakingFusion_J_v1.0.gba",0x8000000

;=====================================
; Sequence breaking patches
;=====================================
.include "code/Sequence Breaking Fusion/SBF_J_v1.0.asm"
;.include "code/SBF/zazabi_fix.asm"
.include "code/Sequence Breaking Fusion/MissilePBTankFix.asm"
.include "code/Sequence Breaking Fusion/SBF_J_noAnimalSkip.asm"
.include "code/Sequence Breaking Fusion/SBF_J_DontSkipAnimalsMonologue.asm"
.include "code/Sequence Breaking Fusion/SBF_J_DontSkipAnimalsMonologue_FS.asm"

;=====================================
; Optional things
;=====================================
; Skip intro patch
;.org 0x80886F6
;    mov     r0,0xC

; Debug menu patch
;.org 0x080771EA
;    mov     r0,r9
;    strb    r0,[r4,2]

; Language patch
; You can change the language in the file, default = english
;.include "MF_J language patch.asm"

;.close
