; Data from DBD to DBE (2 bytes)
_engine_font_manager_draw_char:
		push ix
		ld ix, $0000
		add ix, sp
		ld a, (ix + $04)
		add a, $E0
		ld c, a
		push bc
		ld h, (ix + $06)
		ld l, (ix + $05)				; TEXT_ROOT	5
		push hl
		call _devkit_SMS_setNextTileatXY
		pop af
		pop bc
		ld hl, _font__tilemap__bin
		ld l, (hl)
		ld h, $00
		ld b, $00
		add hl, bc
		push hl
		call _devkit_SMS_setTile
		pop af
		pop ix
		ret

; Data from DE9 to DEA (2 bytes)
_engine_font_manager_draw_text:
		push ix
		ld ix, $0000
		add ix, sp
		dec sp
		ld c, (ix + $06)
		ld (ix -1), $00
		ld a, (ix + $04)
		add a, (ix - 1)
		ld e, a
		ld a, (ix + $05)
		adc a, $00
		ld d, a
		ld a, (de)
		or a
		jr z, $2D						; todo calculate label to jump relative to!
		add a, $E0
		ld b, a
		ld d, c
		inc c
		ld (ix + $06), c
		push bc
		ld a, (ix + $07)
		push af
		inc sp
		push de
		inc sp
		call _devkit_SMS_setNextTileatXY
		pop af
		pop bc
		ld hl, _font__tilemap__bin
		ld e, (hl)
		ld d, $00
		ld a, b
		ld l, a
		rla
		sbc a, a
		ld h, a
		add hl, de
		push bc
		push hl
		call _devkit_SMS_setTile
		pop af
		pop bc
		inc (ix - 1)
		jr $C2							; todo calculate label to jump relative to!
		inc sp
		pop ix
		ret

; Data from E3B to E3C (2 bytes)
_engine_font_manager_draw_data:
	push ix

; Data from E3D to E40 (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from E41 to E42 (2 bytes)
	add ix, sp

; Data from E43 to E43 (1 bytes)
	push af

; Data from E44 to E46 (3 bytes)
	;.db $DD $7E $06
	ld a, (ix + $06)

; Data from E47 to E49 (3 bytes)
	;.db $DD $77 $FF
	ld (ix - 1), a

; Data from E4A to E4D (4 bytes)
	;.db $DD $36 $FE $00
	ld (ix - 2), $00

; Data from E4E to E50 (3 bytes)
	;.db $21 $0A $00
	ld hl, $000A

; Data from E51 to E51 (1 bytes)
	push hl

; Data from E52 to E54 (3 bytes)
	;.db $DD $6E $04
	ld l, (ix + $04)

; Data from E55 to E57 (3 bytes)
	;.db $DD $66 $05
	ld h, (ix + $05)

; Data from E58 to E58 (1 bytes)
	push hl

; Data from E59 to E5B (3 bytes)
	;.db $CD $65 $1B
	call __divuint

; Data from E5C to E5C (1 bytes)
	pop af

; Data from E5D to E5D (1 bytes)
	pop af

; Data from E5E to E5E (1 bytes)
	ld e, l

; Data from E5F to E5F (1 bytes)
	ld d, h

; Data from E60 to E60 (1 bytes)
	push hl

; Data from E61 to E61 (1 bytes)
	push de

; Data from E62 to E64 (3 bytes)
	;.db $01 $0A $00
	ld bc, $000A

; Data from E65 to E65 (1 bytes)
	push bc

; Data from E66 to E68 (3 bytes)
	;.db $DD $4E $04
	ld c, (ix + $04)

; Data from E69 to E6B (3 bytes)
	;.db $DD $46 $05
	ld b, (ix + $05)
	
; Data from E6C to E6C (1 bytes)
	push bc

; Data from E6D to E6F (3 bytes)
	;.db $CD $FA $1E
	call __moduint

; Data from E70 to E70 (1 bytes)
	pop af

; Data from E71 to E71 (1 bytes)
	pop af

; Data from E72 to E72 (1 bytes)
	ld b, l

; Data from E73 to E73 (1 bytes)
	pop de

; Data from E74 to E74 (1 bytes)
	pop hl

; Data from E75 to E77 (3 bytes)
	;.db $DD $75 $04
	ld (ix + $04), l

; Data from E78 to E7A (3 bytes)
	;.db $DD $74 $05
	ld (ix + $05), h

; Data from E7B to E7B (1 bytes)
	ld a, b

; Data from E7C to E7D (2 bytes)
	add a, $10

; Data from E7E to E7E (1 bytes)
	ld c, a

; Data from E7F to E7F (1 bytes)
	ld a, d

; Data from E80 to E80 (1 bytes)
	or e

; Data from E81 to E82 (2 bytes)
	jr nz, $0B

; Data from E83 to E83 (1 bytes)
	or b

; Data from E84 to E85 (2 bytes)
	jr nz, $08

; Data from E86 to E88 (3 bytes)
	;.db $DD $7E $FE
	ld a, (ix - 2)

; Data from E89 to E89 (1 bytes)
	or a

; Data from E8A to E8B (2 bytes)
	jr z, $02

; Data from E8C to E8D (2 bytes)
	;.db $0E $00
	ld c, $00

; Data from E8E to E90 (3 bytes)
	;.db $DD $46 $FF
	ld b, (ix - 1)

; Data from E91 to E93 (3 bytes)
	;.db $DD $35 $FF
	dec (ix - 1)

; Data from E94 to E96 (3 bytes)
	;.db $DD $7E $FF
	ld a, (ix - 1)

; Data from E97 to E99 (3 bytes)
	;.db $DD $77 $06
	ld (ix + $06), a

; Data from E9A to E9A (1 bytes)
	push bc

; Data from E9B to E9D (3 bytes)
	;.db $DD $7E $07
	ld a, (ix + $07)

; Data from E9E to E9E (1 bytes)
	push af

; Data from E9F to E9F (1 bytes)
	inc sp

; Data from EA0 to EA0 (1 bytes)
	push bc

; Data from EA1 to EA1 (1 bytes)
	inc sp

; Data from EA2 to EA4 (3 bytes)
	;.db $CD $23 $09
	call _devkit_SMS_setNextTileatXY

; Data from EA5 to EA5 (1 bytes)
	pop af

; Data from EA6 to EA6 (1 bytes)
	pop bc

; Data from EA7 to EA9 (3 bytes)
	;.db $21 $B8 $17
	ld hl, _font__tilemap__bin

; Data from EAA to EAA (1 bytes)
	ld l, (hl)

; Data from EAB to EAC (2 bytes)
	ld h, $00

; Data from EAD to EAD (1 bytes)
	ld a, c

; Data from EAE to EAE (1 bytes)
	rla

; Data from EAF to EAF (1 bytes)
	sbc a, a

; Data from EB0 to EB0 (1 bytes)
	ld b, a

; Data from EB1 to EB1 (1 bytes)
	add hl, bc

; Data from EB2 to EB2 (1 bytes)
	push hl

; Data from EB3 to EB5 (3 bytes)
	;.db $CD $4C $09
	call _devkit_SMS_setTile

; Data from EB6 to EB6 (1 bytes)
	pop af

; Data from EB7 to EB9 (3 bytes)
	;.db $DD $34 $FE
	inc (ix - 2)

; Data from EBA to EBC (3 bytes)
	;.db $DD $7E $FE
	ld a, (ix - 2)

; Data from EBD to EBE (2 bytes)
	;.db $D6 $05
	sub a, $05

; Data from EBF to EC0 (2 bytes)
	;.db $38 $8D
	jr c, $8D

; Data from EC1 to EC2 (2 bytes)
	;.db $DD $F9
	ld sp, ix

; Data from EC3 to EC4 (2 bytes)
	pop ix

; Data from EC5 to EC5 (1 bytes)
	ret