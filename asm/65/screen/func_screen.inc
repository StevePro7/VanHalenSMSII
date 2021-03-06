.section "Func screen" free
; Data from 15BF to 15C1 (3 bytes)
_screen_func_screen_load:
	.db $CD $2B $08

; Data from 15C2 to 15C4 (3 bytes)
	.db $CD $A2 $0A

; Data from 15C5 to 15C7 (3 bytes)
	.db $CD $E3 $0A

; Data from 15C8 to 15CA (3 bytes)
	.db $CD $51 $0B

; Data from 15CB to 15CD (3 bytes)
	.db $21 $06 $0C

; Data from 15CE to 15CE (1 bytes)
	.db $E5

; Data from 15CF to 15D1 (3 bytes)
	.db $21 $23 $16

; Data from 15D2 to 15D2 (1 bytes)
	.db $E5

; Data from 15D3 to 15D5 (3 bytes)
	.db $CD $E9 $0D

; Data from 15D6 to 15D6 (1 bytes)
	.db $F1

; Data from 15D7 to 15D9 (3 bytes)
	.db $21 $14 $0C

; Data from 15DA to 15DA (1 bytes)
	.db $E3

; Data from 15DB to 15DD (3 bytes)
	.db $21 $2A $16

; Data from 15DE to 15DE (1 bytes)
	.db $E5

; Data from 15DF to 15E1 (3 bytes)
	.db $CD $E9 $0D

; Data from 15E2 to 15E2 (1 bytes)
	.db $F1

; Data from 15E3 to 15E3 (1 bytes)
	.db $F1

; Data from 15E4 to 15E6 (3 bytes)
	.db $21 $22 $16

; Data from 15E7 to 15E7 (1 bytes)
	.db $56

; Data from 15E8 to 15EA (3 bytes)
	.db $21 $21 $16

; Data from 15EB to 15EB (1 bytes)
	.db $5E

; Data from 15EC to 15EC (1 bytes)
	.db $D5

; Data from 15ED to 15EF (3 bytes)
	.db $21 $31 $16

; Data from 15F0 to 15F0 (1 bytes)
	.db $E5

; Data from 15F1 to 15F3 (3 bytes)
	.db $CD $E9 $0D

; Data from 15F4 to 15F4 (1 bytes)
	.db $F1

; Data from 15F5 to 15F5 (1 bytes)
	.db $F1

; Data from 15F6 to 15F8 (3 bytes)
	.db $21 $22 $16

; Data from 15F9 to 15F9 (1 bytes)
	.db $46

; Data from 15FA to 15FC (3 bytes)
	.db $3A $21 $16

; Data from 15FD to 15FE (2 bytes)
	.db $C6 $07

; Data from 15FF to 15FF (1 bytes)
	.db $4F

; Data from 1600 to 1600 (1 bytes)
	.db $C5

; Data from 1601 to 1603 (3 bytes)
	.db $21 $36 $16

; Data from 1604 to 1604 (1 bytes)
	.db $E5

; Data from 1605 to 1607 (3 bytes)
	.db $CD $E9 $0D

; Data from 1608 to 1608 (1 bytes)
	.db $F1

; Data from 1609 to 1609 (1 bytes)
	.db $F1

; Data from 160A to 160C (3 bytes)
	.db $21 $22 $16

; Data from 160D to 160D (1 bytes)
	.db $46

; Data from 160E to 1610 (3 bytes)
	.db $3A $21 $16

; Data from 1611 to 1612 (2 bytes)
	.db $C6 $0E

; Data from 1613 to 1613 (1 bytes)
	.db $4F

; Data from 1614 to 1614 (1 bytes)
	.db $C5

; Data from 1615 to 1617 (3 bytes)
	.db $21 $3B $16

; Data from 1618 to 1618 (1 bytes)
	.db $E5

; Data from 1619 to 161B (3 bytes)
	.db $CD $E9 $0D

; Data from 161C to 161C (1 bytes)
	.db $F1

; Data from 161D to 161D (1 bytes)
	.db $F1

; Data from 161E to 1620 (3 bytes)
	.db $C3 $25 $08

; Data from 1621 to 1621 (1 bytes)
	.db $04

; Data from 1622 to 1622 (1 bytes)
	.db $14

; Data from 1623 to 1629 (7 bytes)
	.db $52 $45 $43 $4F $52 $44 $00

; Data from 162A to 1630 (7 bytes)
	.db $43 $4F $56 $45 $52 $53 $00

; Data from 1631 to 1635 (5 bytes)
	.db $31 $39 $38 $34 $00

; Data from 1636 to 163A (5 bytes)
	.db $31 $39 $38 $36 $00

; Data from 163B to 163F (5 bytes)
	.db $31 $39 $38 $38 $00

; Data from 1640 to 1640 (1 bytes)
_screen_func_screen_update:
	.db $C1

; Data from 1641 to 1641 (1 bytes)
	.db $E1

; Data from 1642 to 1642 (1 bytes)
	.db $E5

; Data from 1643 to 1643 (1 bytes)
	.db $C5

; Data from 1644 to 1645 (2 bytes)
	.db $36 $08

; Data from 1646 to 1646 (1 bytes)
	.db $C9

.ends