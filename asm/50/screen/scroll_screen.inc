; Data from 1389 to 138B (3 bytes)
_screen_scroll_screen_load:
	;.db $21 $56 $C0
	ld hl, $C056				; todo	offset	??

; Data from 138C to 138D (2 bytes)
	ld (hl), $00

; Data from 138E to 138E (1 bytes)
	ret

; Data from 138F to 138F (1 bytes)
_screen_scroll_screen_update:
	dec sp

; Data from 1390 to 1392 (3 bytes)
	;.db $3A $56 $C0
	ld a, ($C056)

; Data from 1393 to 1394 (2 bytes)
	sub a, $20						; TOP_SCROLL	32

; Data from 1395 to 1396 (2 bytes)
	;jr nz, $04
	jr nz, +

; Data from 1397 to 1398 (2 bytes)
	;ld a, $01
	ld a, $01

; Data from 1399 to 139A (2 bytes)
	;jr $01
	jr ++
+:
; Data from 139B to 139B (1 bytes)
	xor a
++:
; Data from 139C to 139C (1 bytes)
	inc sp

; Data from 139D to 139D (1 bytes)
	push af

; Data from 139E to 139E (1 bytes)
	inc sp

; Data from 139F to 13A2 (4 bytes)
	.db $FD $21 $56 $C0

; Data from 13A3 to 13A5 (3 bytes)
	.db $FD $46 $00

; Data from 13A6 to 13A8 (3 bytes)
	.db $FD $34 $00

; Data from 13A9 to 13A9 (1 bytes)
	push bc

; Data from 13AA to 13AA (1 bytes)
	inc sp

; Data from 13AB to 13AD (3 bytes)
	.db $CD $46 $08

; Data from 13AE to 13AE (1 bytes)
	inc sp

; Data from 13AF to 13B0 (2 bytes)
	ld a, $10

; Data from 13B1 to 13B1 (1 bytes)
	push af

; Data from 13B2 to 13B2 (1 bytes)
	inc sp

; Data from 13B3 to 13B5 (3 bytes)
	;.db $CD $D3 $0E
	call $0ED3

; Data from 13B6 to 13B6 (1 bytes)
	inc sp

; Data from 13B7 to 13B7 (1 bytes)
	.db $4D

; Data from 13B8 to 13BA (3 bytes)
	;.db $21 $03 $00
	ld hl, $0003

; Data from 13BB to 13BB (1 bytes)
	add hl, sp

; Data from 13BC to 13BC (1 bytes)
	ld a, (hl)

; Data from 13BD to 13BD (1 bytes)
	inc hl

; Data from 13BE to 13BE (1 bytes)
	ld h, (hl)

; Data from 13BF to 13BF (1 bytes)
	ld l, a

; Data from 13C0 to 13C0 (1 bytes)
	ld a, c

; Data from 13C1 to 13C1 (1 bytes)
	or a

; Data from 13C2 to 13C3 (2 bytes)
	jr nz, $0C

; Data from 13C4 to 13C7 (4 bytes)
	.db $FD $21 $00 $00

; Data from 13C8 to 13C9 (2 bytes)
	.db $FD $39

; Data from 13CA to 13CC (3 bytes)
	.db $FD $7E $00

; Data from 13CD to 13CD (1 bytes)
	or a

; Data from 13CE to 13CF (2 bytes)
	jr z, $16

; Data from 13D0 to 13D0 (1 bytes)
	.db $E5

; Data from 13D1 to 13D2 (2 bytes)
	ld a, $04						; TOP_OFFSET	4

; Data from 13D3 to 13D3 (1 bytes)
	push af

; Data from 13D4 to 13D4 (1 bytes)
	inc sp

; Data from 13D5 to 13D7 (3 bytes)
	;.db $CD $34 $10
	;call $1034
	call _engine_scroll_manager_load
	
; Data from 13D8 to 13D8 (1 bytes)
	inc sp

; Data from 13D9 to 13DA (2 bytes)
	ld a, $20						; TOP_SCROLL	32

; Data from 13DB to 13DB (1 bytes)
	push af

; Data from 13DC to 13DC (1 bytes)
	inc sp

; Data from 13DD to 13DF (3 bytes)
	;.db $CD $46 $08
	call $0846				; todo

; Data from 13E0 to 13E0 (1 bytes)
	inc sp

; Data from 13E1 to 13E1 (1 bytes)
	pop hl

; Data from 13E2 to 13E3 (2 bytes)
	ld (hl), $04

; Data from 13E4 to 13E5 (2 bytes)
	jr $02

; Data from 13E6 to 13E7 (2 bytes)
	ld (hl), $03

; Data from 13E8 to 13E8 (1 bytes)
	inc sp

; Data from 13E9 to 13E9 (1 bytes)
	ret
