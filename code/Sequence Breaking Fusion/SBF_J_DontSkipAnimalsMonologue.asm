; Prevent animals monologue from being skipped by early power bombs/plasma beam.

; repoint monologue events list
.org 0x80753C8
    .dw MonologueEvents
.org 0x80754CC
    .dw MonologueEvents

; check the new entries
.org 0x8075444
    cmp r1,0x7 ; originally cmp r1,0x5
    ble #0x8075396	; Original code added since the compiler puts 00 00 after the previous code
