; Data from B67 to B69 (3 bytes)
_engine_cursor_manager_init:
		ld bc, cursor_index_x		; cursor_index_x = $C026
		xor a
		ld (bc),a
		ld hl, cursor_index_y		; cursor_index_y = $C027
		ld (hl),$00
		push bc
		ld a, $03					; MAX_GRID_Y	3
		push af
		inc sp
		ld hl, $0005
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call __divuchar
		pop af
		ld a, l
		pop bc
		ld (bc), a
		ld a, 03
		push af
		inc sp
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call __moduchar
		pop af
		ld c, l
		ld hl, cursor_index_y			; cursor_index_y = $C027
		ld (hl), c
		jp update_values

_engine_cursor_manager_load:
		push ix
		ld ix, $0000
		add ix, sp
		push af
		push af
		ld (ix -3), $00
		ld a, $4A
		add a, (ix - 3)
		ld (ix - 2), a
		ld a, $11
		adc a, $00
		ld (ix - 1), a
		ld c, $00
		ld l, c
		add hl, hl
		add hl, bc
		ld a, l
		add a, (ix - 3)
		ld e, a
		ld hl, _cursor_gridX
		ld b, $00
		add hl, bc
		ld b, (hl)
		ld l, (ix - 2)
		ld h, (ix - 1)
		ld a, (hl)
		ld (ix - 4), a
		ld h, $00
		ld l, e
		add hl, hl
		ld de, $C14A				; stevepro TODO - what is this variable?
		add hl, de
		ld e, (hl)
		inc hl
		ld d, (hl)
		ld a, (ix - 4)
		add a, (ix + 04)
		push bc
		push af
		inc sp
		push bc
		inc sp
		push de
		call _engine_font_manager_draw_text
		pop af
		pop af
		pop bc
		inc c
		ld a, c
		sub a, $04				; MAX_GRID_X	4
		jr c, $C4
		inc (ix - 3)
		ld a, (ix - 3)
		sub a, $03				; MAX_GRID_Y	3
		jr c, $A9
		ld sp, ix
		pop ix
		ret

; Data from C05 to C07 (3 bytes)
_engine_cursor_manager_save:
		ld a, (cursor_index_x)		; cursor_index_x = $C026
		ld c, a
		add a, a
		add a, c
		ld c, a
		ld hl, cursor_index_x		; cursor_index_x = $C026
		inc hl
		ld l, (hl)
		add hl, bc
		ret

; Data from C13 to C14 (2 bytes)
_engine_cursor_manager_draw:
		push ix
		ld ix, $0000
		add ix, sp
		push af
		push af
		ld hl, cursor_index_x		; cursor_index_x = $C026
		inc hl
		inc hl
		ld c, (hl)
		ld hl, cursor_index_x		; cursor_index_x = $C026
		inc hl
		inc hl
		inc hl
		ld b, (hl)
		push bc
		ld hl, $0120
		push hl
		push bc
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop bc
		ld a, c
		add a, $28
		ld e, a
		push bc
		push de
		ld hl, $0125
		push hl
		push bc
		inc sp
		ld a, e
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, b
		add a, $10
		ld d, a
		push bc
		push de
		ld hl, $012C
		push hl
		ld e, c
		push de
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $0131
		push hl
		push de
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $08
		ld (ix - 4), a
		push bc
		push de
		ld hl, $0121
		push hl
		push bc
		inc sp
		ld a, (ix - 4)
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $10
		ld (ix - 1), a
		push bc
		push de
		ld hl, $0122
		push hl
		push bc
		inc sp
		ld a, (ix - 1)
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $18
		ld (ix - 2), a
		push bc
		push de
		ld hl, $0123
		push hl
		push bc
		inc sp
		ld a, (ix - 2)
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $20
		ld (ix - 3), a
		push bc
		push de
		ld hl, $0124
		push hl
		push bc
		inc sp
		ld a, (ix - 3)
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, b
		add a, $08
		ld b, a
		push bc
		push de
		ld hl, $0126
		push hl
		push bc
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		push de
		ld hl, $012B 
		push hl
		push bc
		inc sp
		ld a, e
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $012D
		push hl
		push de
		inc sp
		ld a, (ix - 4)
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $012E
		push hl
		push de
		inc sp
		ld a, (ix - 1)
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $012F
		push hl
		push de
		inc sp
		ld a, (ix - 2)
		push af
		inc sp
		call _devkit_SMS_addSprite
		pop af
		pop af
		pop de
		ld hl, $0130
		push hl
		push de
		inc sp
		ld a, (ix - 3)
		push af
		inc sp
		call _devkit_SMS_addSprite
		ld sp, ix
		pop ix
		ret

; Data from D3E to D40 (3 bytes)
_engine_cursor_manager_decX:
		ld bc, cursor_index_x		; cursor_index_x = $C026
		ld a, (bc)
		or a						; if( 0 == co->cursor_index_x )
		jr nz, +
		ld a, $03					; co->cursor_index_x = MAX_GRID_X - 1;
		ld (bc), a
		jp update_values
+:
		add a, $FF					; co->cursor_index_x--;
		ld (bc), a
		jp update_values

; Data from D51 to D53 (3 bytes)
_engine_cursor_manager_incX:
		ld bc, cursor_index_x		; cursor_index_x = $C026
		ld a, (bc)
		cp $03						; if( MAX_GRID_X - 1 == co->cursor_index_x )
		jr nz, +
		xor a						; co->cursor_index_x = 0;
		ld (bc), a
		jp update_values
+:
		inc a						; co->cursor_index_x++;
		ld (bc), a
		jp update_values

; Data from D63 to D65 (3 bytes)
_engine_cursor_manager_decY:
	ld bc, cursor_index_y		; cursor_index_y = $C027
	ld a, (bc)
	or a
	jr nz, $06

; Data from D6A to D6B (2 bytes)
	ld a, $02

; Data from D6C to D6C (1 bytes)
	ld (bc), a

; Data from D6D to D6F (3 bytes)
	jp update_values

; Data from D70 to D71 (2 bytes)
	add a, $FF

; Data from D72 to D72 (1 bytes)
	ld (bc), a

; Data from D73 to D75 (3 bytes)
	jp update_values

; Data from D76 to D78 (3 bytes)
_engine_cursor_manager_incY:
	ld bc, cursor_index_y		; cursor_index_y = $C027

; Data from D79 to D79 (1 bytes)
	ld a, (bc)

; Data from D7A to D7B (2 bytes)
	cp $02

; Data from D7C to D7D (2 bytes)
	jr nz, $05

; Data from D7E to D7E (1 bytes)
	xor a

; Data from D7F to D7F (1 bytes)
	ld (bc), a

; Data from D80 to D82 (3 bytes)
	jp update_values

; Data from D83 to D83 (1 bytes)
	inc a

; Data from D84 to D84 (1 bytes)
	ld (bc), a

; Data from D85 to D87 (3 bytes)
	jp update_values

update_values:
; Data from D88 to D8A (3 bytes)
	ld bc, $1146

; Data from D8B to D8D (3 bytes)
	ld hl, cursor_index_x		; cursor_index_x = $C026

; Data from D8E to D8E (1 bytes)
	ld l, (hl)

; Data from D8F to D90 (2 bytes)
	ld h, $00

; Data from D91 to D91 (1 bytes)
	add hl, bc

; Data from D92 to D92 (1 bytes)
	ld c, (hl)

; Data from D93 to D95 (3 bytes)
	ld de, _cursor_gridY		; _cursor_gridY$114A 

; Data from D96 to D98 (3 bytes)
	ld hl, cursor_index_x		; cursor_index_x = $C026

; Data from D99 to D99 (1 bytes)
	inc hl

; Data from D9A to D9A (1 bytes)
	ld l, (hl)

; Data from D9B to D9C (2 bytes)
	ld h, $00

; Data from D9D to D9D (1 bytes)
	add hl, de

; Data from D9E to D9E (1 bytes)
	ld e, (hl)

; Data from D9F to D9F (1 bytes)
	dec c

; Data from DA0 to DA0 (1 bytes)
	ld a, c

; Data from DA1 to DA1 (1 bytes)
	rlca

; Data from DA2 to DA2 (1 bytes)
	rlca

; Data from DA3 to DA3 (1 bytes)
	rlca

; Data from DA4 to DA5 (2 bytes)
	and $F8

; Data from DA6 to DA6 (1 bytes)
	ld d, a

; Data from DA7 to DA9 (3 bytes)
	;.db $21 $28 $C0
	ld hl, cursor_value_x		; cursor_value_x = $C028

; Data from DAA to DAA (1 bytes)
	ld (hl), d

; Data from DAB to DAD (3 bytes)
	;.db $01 $29 $C0
	ld bc, cursor_value_y		; cursor_value_y = $C029

; Data from DAE to DAE (1 bytes)
	dec e

; Data from DAF to DAF (1 bytes)
	ld a, e

; Data from DB0 to DB0 (1 bytes)
	rlca

; Data from DB1 to DB1 (1 bytes)
	rlca

; Data from DB2 to DB2 (1 bytes)
	rlca

; Data from DB3 to DB4 (2 bytes)
	and $F8

; Data from DB5 to DB5 (1 bytes)
	ld e, a

; Data from DB6 to DB6 (1 bytes)
	ld (bc), a

; Data from DB7 to DB7 (1 bytes)
	inc d

; Data from DB8 to DB8 (1 bytes)
	ld (hl), d

; Data from DB9 to DB9 (1 bytes)
	dec e

; Data from DBA to DBA (1 bytes)
	ld a, e

; Data from DBB to DBB (1 bytes)
	ld (bc), a

; Data from DBC to DBC (1 bytes)
	ret
