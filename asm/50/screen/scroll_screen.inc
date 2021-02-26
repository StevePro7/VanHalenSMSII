; Data from 1389 to 138B (3 bytes)
_screen_scroll_screen_load:
		ld hl, $C056				; todo	offset	??
		ld (hl), $00
		ret
	
_screen_scroll_screen_update:
		dec sp
		ld a, ($C056)
		sub a, $20						; TOP_SCROLL	32
		jr nz, +
		ld a, $01
		jr ++
	+:
		xor a

	++:
		inc sp
		push af
		inc sp
		ld iy, $C056
		ld b, (iy + $00)
		inc (iy + $00)
		push bc
		inc sp
		call _devkit_SMS_setBGScrollY
		inc sp
		ld a, $10
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld c, l
		ld hl, $0003
		add hl, sp
		ld a, (hl)
		inc hl
		ld h, (hl)
		ld l, a
		ld a, c
		or a
		jr nz, $0C
		ld iy, $0000
		add iy, sp
		ld a, (iy + $00)
		or a
		jr z, $16
		push hl
		ld a, $04						; TOP_OFFSET	4
		push af
		inc sp
		call _engine_scroll_manager_load
		inc sp
		ld a, $20						; TOP_SCROLL	32
		push af
		inc sp
		call _devkit_SMS_setBGScrollY
		inc sp
		pop hl
		ld (hl), $04					; screen_type_select = 4
		jr +
		ld (hl), $03					; screen_type_scroll = 3
+:
		inc sp
		ret