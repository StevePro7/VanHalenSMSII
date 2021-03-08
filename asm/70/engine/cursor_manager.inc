.section "engine_cursor_manager_init" free
engine_cursor_manager_init:
		ld bc, $C026		; $C026 = $C026
		xor a
		ld (bc),a
		ld hl, $C027		; $C027 = $C027
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
		call divuchar				; co->$C026 = index / MAX_GRID_Y;
		pop af
		ld a, l
		pop bc
		ld (bc), a
		ld a, $03					; MAX_GRID_Y	3
		push af
		inc sp
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		push af
		inc sp
		call moduchar				; co->$C027 = index % MAX_GRID_Y;
		pop af
		ld c, l
		ld hl, $C027		; $C027 = $C027
		ld (hl), c
		jp update_values

.ends

.section "engine_cursor_manager_load" free
engine_cursor_manager_load:
		; MAX_GRID_X	4
		; MAX_GRID_Y	3
		push ix
		ld ix, $0000
		add ix, sp
		push af
		push af
		ld (ix -3), $00
;.ends
;.section "cursor_goto_01" free
cursor_goto_01:
		ld a, $4A
		add a, (ix - 3)
		ld (ix - 2), a
		ld a, $11
		adc a, $00
		ld (ix - 1), a
		ld c, $00
;.ends
;.section "cursor_goto_02" free
cursor_goto_02:
		ld l, c
		add hl, hl
		add hl, bc
		ld a, l
		add a, (ix - 3)
		ld e, a
		ld hl, cursor_gridX
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
		ld de, $C14A				; $C14A = $C14A
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
		call engine_font_manager_draw_text
		pop af
		pop af
		pop bc
		inc c
		ld a, c
		sub a, $04				; MAX_GRID_X	4
		jr c, cursor_goto_02
		inc (ix - 3)
		ld a, (ix - 3)
		sub a, $03				; MAX_GRID_Y	3
		jr c, cursor_goto_01
		ld sp, ix
		pop ix
		ret

.ends

.section "engine_cursor_manager_save" free
engine_cursor_manager_save:
		ld a, ($C026)		; $C026 = $C026
		ld c, a
		add a, a
		add a, c
		ld c, a
		ld hl, $C026		; $C026 = $C026
		inc hl
		ld l, (hl)
		add hl, bc
		ret

.ends

.section "engine_cursor_manager_draw" free
engine_cursor_manager_draw:
		push ix
		ld ix, $0000				; tile + 0 
		add ix, sp
		push af
		push af
		ld hl, $C026		; $C026 = $C026
		inc hl
		inc hl
		ld c, (hl)
		ld hl, $C026		; $C026 = $C026
		inc hl
		inc hl
		inc hl
		ld b, (hl)
		push bc
		ld hl, $0120
		push hl
		push bc
		call devkit_SMS_addSprite
		pop af
		pop af
		pop bc
		ld a, c
		add a, $28
		ld e, a
		push bc
		push de
		ld hl, $0125				; tile + 5
		push hl
		push bc
		inc sp
		ld a, e
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, b
		add a, $10
		ld d, a
		push bc
		push de
		ld hl, $012C				; tile + 12
		push hl
		ld e, c
		push de
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $0131				; tile + 17
		push hl
		push de
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $08
		ld (ix - 4), a
		push bc
		push de
		ld hl, $0121				; tile + 1
		push hl
		push bc
		inc sp
		ld a, (ix - 4)
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $10
		ld (ix - 1), a
		push bc
		push de
		ld hl, $0122				; tile + 2
		push hl
		push bc
		inc sp
		ld a, (ix - 1)
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $18
		ld (ix - 2), a
		push bc
		push de
		ld hl, $0123				; tile + 3
		push hl
		push bc
		inc sp
		ld a, (ix - 2)
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, c
		add a, $20
		ld (ix - 3), a
		push bc
		push de
		ld hl, $0124				; tile + 4
		push hl
		push bc
		inc sp
		ld a, (ix - 3)
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		ld a, b
		add a, $08
		ld b, a
		push bc
		push de
		ld hl, $0126				; tile + 6
		push hl
		push bc
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		pop bc
		push de
		ld hl, $012B 				; tile + 11
		push hl
		push bc
		inc sp
		ld a, e
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $012D				; tile + 13
		push hl
		push de
		inc sp
		ld a, (ix - 4)
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $012E				; tile + 14
		push hl
		push de
		inc sp
		ld a, (ix - 1)
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		push de
		ld hl, $012F				; tile + 15
		push hl
		push de
		inc sp
		ld a, (ix - 2)
		push af
		inc sp
		call devkit_SMS_addSprite
		pop af
		pop af
		pop de
		ld hl, $0130				; tile + 16
		push hl
		push de
		inc sp
		ld a, (ix - 3)
		push af
		inc sp
		call devkit_SMS_addSprite
		ld sp, ix
		pop ix
		ret

.ends

.section "engine_cursor_manager_decX" free
engine_cursor_manager_decX:
		ld bc, $C026		; $C026 = $C026
		ld a, (bc)
		or a						; if( 0 == co->$C026 )
		jr nz, decX_goto
		ld a, $03					; co->$C026 = MAX_GRID_X - 1;
		ld (bc), a
		jp update_values
;.ends
;.section "decX_goto" free
decX_goto:
		add a, $FF					; co->$C026--;
		ld (bc), a
		jp update_values

.ends

.section "engine_cursor_manager_incX" free
engine_cursor_manager_incX:
		ld bc, $C026		; $C026 = $C026
		ld a, (bc)
		cp $03						; if( MAX_GRID_X - 1 == co->$C026 )
		jr nz, incX_goto
		xor a						; co->$C026 = 0;
		ld (bc), a
		jp update_values
;.ends
;.section "incX_goto" free
incX_goto:
		inc a						; co->$C026++;
		ld (bc), a
		jp update_values

.ends

.section "engine_cursor_manager_decY" free
engine_cursor_manager_decY:
		ld bc, $C027		; $C027 = $C027
		ld a, (bc)
		or a						; if( 0 == co->$C027 )
		jr nz, decY_goto
		ld a, $02					; co->$C027 = MAX_GRID_Y - 1;
		ld (bc), a
		jp update_values
;.ends
;.section "decY_goto" free
decY_goto:
		add a, $FF					; co->$C027--;
		ld (bc), a
		jp update_values

.ends

.section "engine_cursor_manager_incY" free
engine_cursor_manager_incY:
		ld bc, $C027		; $C027 = $C027
		ld a, (bc)
		cp $02						; if( MAX_GRID_Y - 1 == co->$C027 )
		jr nz, incY_goto
		xor a						; co->$C027 = 0;
		ld (bc), a
		jp update_values
;.ends
;.section "incY_goto" free
incY_goto:
		inc a						; co->$C027++;
		ld (bc), a
		jp update_values

.ends

.section "update_values" free
update_values:
		; unsigned char grid_x = cursor_gridX[ co->$C026 ];
		ld bc, cursor_gridX		; cursor_gridX = $1146
		ld hl, $C026		; $C026 = $C026
		ld l, (hl)
		ld h, $00
		add hl, bc
		ld c, (hl)
		; unsigned char grid_y = cursor_gridY[ co->$C027 ];
		ld de, cursor_gridY		; cursor_gridY = $114A 
		ld hl, $C026		; $C026 = $C026
		inc hl
		ld l, (hl)
		ld h, $00
		add hl, de
		ld e, (hl)
		dec c
		ld a, c
		rlca						; co->$C028 = ( grid_x - 1 ) * TILE_PIXEL;
		rlca
		rlca
		and $F8
		ld d, a
		ld hl, $C028		; $C028 = $C028
		ld (hl), d
		ld bc, $C029		; $C029 = $C029
		dec e
		ld a, e
		rlca						; co->$C029 = ( grid_y - 1 ) * TILE_PIXEL;
		rlca
		rlca
		and $F8
		ld e, a
		ld (bc), a
		inc d						; co->$C028 += 1;
		ld (hl), d
		dec e						; co->$C029 -= 1;
		ld a, e
		ld (bc), a
		ret

.ends
