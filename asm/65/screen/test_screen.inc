;.section "Test screen" free
; Data from 1577 to 1579 (3 bytes)
.section "screen_test_screen_load" free
screen_test_screen_load:
	.db $CD $2B $08

; Data from 157A to 157C (3 bytes)
	.db $CD $E3 $0A

; Data from 157D to 157F (3 bytes)
	.db $21 $0A $15

; Data from 1580 to 1580 (1 bytes)
	.db $E5

; Data from 1581 to 1583 (3 bytes)
	.db $21 $93 $15

; Data from 1584 to 1584 (1 bytes)
	.db $E5

; Data from 1585 to 1587 (3 bytes)
	.db $CD $E9 $0D

; Data from 1588 to 1588 (1 bytes)
	.db $F1

; Data from 1589 to 1589 (1 bytes)
	.db $F1

; Data from 158A to 158C (3 bytes)
	.db $CD $25 $08

; Data from 158D to 158F (3 bytes)
	.db $21 $5A $C0

; Data from 1590 to 1591 (2 bytes)
	.db $36 $00

; Data from 1592 to 1592 (1 bytes)
	.db $C9

; Data from 1593 to 159E (12 bytes)
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00

; Data from 159F to 15A0 (2 bytes)
.ends

.section "screen_test_screen_update" free
screen_test_screen_update:
	.db $3E $02

; Data from 15A1 to 15A1 (1 bytes)
	.db $F5

; Data from 15A2 to 15A2 (1 bytes)
	.db $33

; Data from 15A3 to 15A5 (3 bytes)
	.db $CD $00 $0F

; Data from 15A6 to 15A6 (1 bytes)
	.db $33

; Data from 15A7 to 15A7 (1 bytes)
	.db $7D

; Data from 15A8 to 15A8 (1 bytes)
	.db $B7

; Data from 15A9 to 15AA (2 bytes)
	.db $28 $0D

; Data from 15AB to 15AD (3 bytes)
	.db $3A $5A $C0

; Data from 15AE to 15AE (1 bytes)
	.db $F5

; Data from 15AF to 15AF (1 bytes)
	.db $33

; Data from 15B0 to 15B2 (3 bytes)
	.db $CD $46 $08

; Data from 15B3 to 15B3 (1 bytes)
	.db $33

; Data from 15B4 to 15B6 (3 bytes)
	.db $21 $5A $C0

; Data from 15B7 to 15B7 (1 bytes)
	.db $34

; Data from 15B8 to 15B8 (1 bytes)
	.db $C1

; Data from 15B9 to 15B9 (1 bytes)
	.db $E1

; Data from 15BA to 15BA (1 bytes)
	.db $E5

; Data from 15BB to 15BB (1 bytes)
	.db $C5

; Data from 15BC to 15BD (2 bytes)
	.db $36 $07

; Data from 15BE to 15BE (1 bytes)
	.db $C9

;.ends
.ends
