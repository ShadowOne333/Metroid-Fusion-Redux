; Revert back the "Unlock All Gallery Images" hack so players can unlock the Gallery Images as intended originally

.org 0x807F96E
	mov r0,#0
.org 0x807FA0C
	ldrh r0,[r0,#0xC]
.org 0x807FA14
	strh r0,[r0]
	lsl r3,r0,#8
