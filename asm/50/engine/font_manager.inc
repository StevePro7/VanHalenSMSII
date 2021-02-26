; Data from DBD to DBE (2 bytes)
_engine_font_manager_draw_char:
	push ix

; Data from DBF to DC2 (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from DC3 to DC4 (2 bytes)
	add ix, sp

; Data from DC5 to DC7 (3 bytes)
	;.db $DD $7E $04
	ld a, (ix + $04)

; Data from DC8 to DC9 (2 bytes)
	add a, $E0

; Data from DCA to DCA (1 bytes)
	ld c, a

; Data from DCB to DCB (1 bytes)
	push bc

; Data from DCC to DCE (3 bytes)
	;.db $DD $66 $06
	ld h, (ix + $06)

; Data from DCF to DD1 (3 bytes)
	;.db $DD $6E $05
	ld l, (ix + $05)

; Data from DD2 to DD2 (1 bytes)
	push hl

; Data from DD3 to DD5 (3 bytes)
	;.db $CD $23 $09
	call _devkit_SMS_setNextTileatXY

; Data from DD6 to DD6 (1 bytes)
	pop af

; Data from DD7 to DD7 (1 bytes)
	pop bc

; Data from DD8 to DDA (3 bytes)
	;.db $21 $B8 $17
	ld hl, _font__tilemap__bin

; Data from DDB to DDB (1 bytes)
	ld l, (hl)

; Data from DDC to DDD (2 bytes)
	ld h, $00

; Data from DDE to DDF (2 bytes)
	ld b, $00

; Data from DE0 to DE0 (1 bytes)
	add hl, bc

; Data from DE1 to DE1 (1 bytes)
	push hl

; Data from DE2 to DE4 (3 bytes)
	;.db $CD $4C $09
	call _devkit_SMS_setTile

; Data from DE5 to DE5 (1 bytes)
	pop af

; Data from DE6 to DE7 (2 bytes)
	pop ix

; Data from DE8 to DE8 (1 bytes)
	ret

; Data from DE9 to DEA (2 bytes)
_engine_font_manager_draw_text:
	push ix

; Data from DEB to DEE (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from DEF to DF0 (2 bytes)
	add ix, sp

; Data from DF1 to DF1 (1 bytes)
	dec sp

; Data from DF2 to DF4 (3 bytes)
	;.db $DD $4E $06
	ld c, (ix + $06)

; Data from DF5 to DF8 (4 bytes)
	;.db $DD $36 $FF $00
	ld (ix -1), $00

; Data from DF9 to DFB (3 bytes)
	;.db $DD $7E $04
	ld a, (ix + $04)

; Data from DFC to DFE (3 bytes)
	;.db $DD $86 $FF
	add a, (ix - 1)

; Data from DFF to DFF (1 bytes)
	ld e, a

; Data from E00 to E02 (3 bytes)
	;.db $DD $7E $05
	ld a, (ix + $05)

; Data from E03 to E04 (2 bytes)
	adc a, $00

; Data from E05 to E05 (1 bytes)
	ld d, a

; Data from E06 to E06 (1 bytes)
	ld a, (de)

; Data from E07 to E07 (1 bytes)
	or a

; Data from E08 to E09 (2 bytes)
	jr z, $2D

; Data from E0A to E0B (2 bytes)
	add a, $E0

; Data from E0C to E0C (1 bytes)
	ld b, a

; Data from E0D to E0D (1 bytes)
	ld d, c

; Data from E0E to E0E (1 bytes)
	inc c

; Data from E0F to E11 (3 bytes)
	;.db $DD $71 $06
	ld (ix + $06), c

; Data from E12 to E12 (1 bytes)
	push bc

; Data from E13 to E15 (3 bytes)
	;.db $DD $7E $07
	ld a, (ix + $07)

; Data from E16 to E16 (1 bytes)
	push af

; Data from E17 to E17 (1 bytes)
	inc sp

; Data from E18 to E18 (1 bytes)
	push de

; Data from E19 to E19 (1 bytes)
	inc sp

; Data from E1A to E1C (3 bytes)
	;.db $CD $23 $09
	call _devkit_SMS_setNextTileatXY

; Data from E1D to E1D (1 bytes)
	pop af

; Data from E1E to E1E (1 bytes)
	pop bc

; Data from E1F to E21 (3 bytes)
	;.db $21 $B8 $17
	ld hl, _font__tilemap__bin

; Data from E22 to E22 (1 bytes)
	ld e, (hl)

; Data from E23 to E24 (2 bytes)
	ld d, $00

; Data from E25 to E25 (1 bytes)
	ld a, b

; Data from E26 to E26 (1 bytes)
	ld l, a

; Data from E27 to E27 (1 bytes)
	rla

; Data from E28 to E28 (1 bytes)
	sbc a, a

; Data from E29 to E29 (1 bytes)
	ld h, a

; Data from E2A to E2A (1 bytes)
	add hl, de

; Data from E2B to E2B (1 bytes)
	push bc

; Data from E2C to E2C (1 bytes)
	push hl

; Data from E2D to E2F (3 bytes)
	;.db $CD $4C $09
	call _devkit_SMS_setTile

; Data from E30 to E30 (1 bytes)
	pop af

; Data from E31 to E31 (1 bytes)
	pop bc

; Data from E32 to E34 (3 bytes)
	;.db $DD $34 $FF
	inc (ix - 1)

; Data from E35 to E36 (2 bytes)
	jr $C2

; Data from E37 to E37 (1 bytes)
	inc sp

; Data from E38 to E39 (2 bytes)
	pop ix

; Data from E3A to E3A (1 bytes)
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