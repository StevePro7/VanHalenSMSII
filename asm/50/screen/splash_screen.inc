; Data from 119D to 119F (3 bytes)
_screen_splash_screen_load:
	;.db $CD $2B $08
	call $082B

; Data from 11A0 to 11A2 (3 bytes)
	;.db $CD $A2 $0A
	call $0AA2

; Data from 11A3 to 11A5 (3 bytes)
	;.db $CD $B8 $0A
	call $0AB8

; Data from 11A6 to 11A8 (3 bytes)
	;.db $CD $25 $08
	call $0825

; Data from 11A9 to 11AB (3 bytes)
	;.db $21 $96 $00
	ld hl, $0096

; Data from 11AC to 11AC (1 bytes)
	;.db $E5
	push hl

; Data from 11AD to 11AF (3 bytes)
	;.db $CD $CD $10
	call $10CD

; Data from 11B0 to 11B2 (3 bytes)
	;.db $21 $4B $00
	ld hl, $004B

; Data from 11B3 to 11B3 (1 bytes)
	;.db $E3
	ex (sp), hl

; Data from 11B4 to 11B6 (3 bytes)
	;.db $CD $08 $11
	call $1108

; Data from 11B7 to 11B7 (1 bytes)
	;.db $F1
	pop af

; Data from 11B8 to 11B8 (1 bytes)
	;.db $C9
	ret

; Data from 11B9 to 11BA (2 bytes)
_screen_splash_screen_update:
	;.db $DD $E5
	push ix

; Data from 11BB to 11BE (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from 11BF to 11C0 (2 bytes)
	;.db $DD $39
	add ix, sp

; Data from 11C1 to 11C1 (1 bytes)
	;.db $F5
	push af

; Data from 11C2 to 11C4 (3 bytes)
	;.db $CD $E6 $10
	call $10E6

; Data from 11C5 to 11C7 (3 bytes)
	;.db $DD $75 $FE
	ld (ix - 2), l

; Data from 11C8 to 11C9 (2 bytes)
	;.db $3E $10
	ld a, $10

; Data from 11CA to 11CA (1 bytes)
	;.db $F5
	push af

; Data from 11CB to 11CB (1 bytes)
	;.db $33
	inc sp

; Data from 11CC to 11CE (3 bytes)
	;.db $CD $D3 $0E
	call $0ED3

; Data from 11CF to 11CF (1 bytes)
	;.db $33
	inc sp

; Data from 11D0 to 11D2 (3 bytes)
	;.db $DD $75 $FF
	ld (ix - 1), l

; Data from 11D3 to 11D4 (2 bytes)
	;.db $3E $20
	ld a, $20

; Data from 11D5 to 11D5 (1 bytes)
	;.db $F5
	push af

; Data from 11D6 to 11D6 (1 bytes)
	;.db $33
	inc sp

; Data from 11D7 to 11D9 (3 bytes)
	;.db $CD $00 $0F
	call $0F00

; Data from 11DA to 11DA (1 bytes)
	;.db $33
	inc sp

; Data from 11DB to 11DB (1 bytes)
	;.db $7D
	ld a, l

; Data from 11DC to 11DC (1 bytes)
	;.db $B7
	or a

; Data from 11DD to 11DE (2 bytes)
	;.db $28 $1C
	jr z, $1C

; Data from 11DF to 11E1 (3 bytes)
	;.db $CD $1D $11
	call $111D

; Data from 11E2 to 11E2 (1 bytes)
	;.db $7D
	ld a, l

; Data from 11E3 to 11E3 (1 bytes)
	;.db $B7
	or a

; Data from 11E4 to 11E5 (2 bytes)
	;.db $28 $18
	jr z, $18

; Data from 11E6 to 11E8 (3 bytes)
	;.db $CD $AB $10
	call $10AB

; Data from 11E9 to 11EB (3 bytes)
	;.db $CD $3F $11
	call $113F

; Data from 11EC to 11EE (3 bytes)
	;.db $21 $1C $17
	ld hl, $171C

; Data from 11EF to 11EF (1 bytes)
	;.db $E5
	push hl

; Data from 11F0 to 11F2 (3 bytes)
	;.db $21 $1B $12
	ld hl, $121B

; Data from 11F3 to 11F3 (1 bytes)
	;.db $E5
	push hl

; Data from 11F4 to 11F6 (3 bytes)
	;.db $CD $E9 $0D
	call $0DE9

; Data from 11F7 to 11F7 (1 bytes)
	;.db $F1
	pop af

; Data from 11F8 to 11F8 (1 bytes)
	;.db $F1
	pop af

; Data from 11F9 to 11FA (2 bytes)
	;.db $18 $03
	jr $03

; Data from 11FB to 11FD (3 bytes)
	;.db $CD $3F $11
	call $113F

; Data from 11FE to 1200 (3 bytes)
	;.db $DD $6E $04
	ld l, (ix + $04)

; Data from 1201 to 1203 (3 bytes)
	;.db $DD $66 $05
	ld h, (ix + $05)

; Data from 1204 to 1206 (3 bytes)
	;.db $DD $7E $FE
	ld a, (ix - 2)

; Data from 1207 to 1207 (1 bytes)
	;.db $B7
	or a

; Data from 1208 to 1209 (2 bytes)
	;.db $20 $06
	jr nz, $06

; Data from 120A to 120C (3 bytes)
	;.db $DD $7E $FF
	ld a, (ix - 1)

; Data from 120D to 120D (1 bytes)
	;.db $B7
	or a

; Data from 120E to 120F (2 bytes)
	;.db $28 $04
	jr z, $04

; Data from 1210 to 1211 (2 bytes)
	;.db $36 $02
	ld (hl), $02

; Data from 1212 to 1213 (2 bytes)
	;.db $18 $02
	jr $02

; Data from 1214 to 1215 (2 bytes)
	;.db $36 $01
	ld (hl), $01

; Data from 1216 to 1217 (2 bytes)
	;.db $DD $F9
	ld sp, ix

; Data from 1218 to 1219 (2 bytes)
	;.db $DD $E1
	pop ix

; Data from 121A to 121A (1 bytes)
	;.db $C9
	ret

; Data from 121B to 121F (5 bytes)
; "5150"
	.db $35 $31 $35 $30 $00
