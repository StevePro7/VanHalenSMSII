;.section "Screen manager" free
engine_screen_manager_init:
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		ld (next_screen_type), a		; next_screen_type = $C02C
		ld hl, $C02B			; Fscreen_manager$curr_screen_type = $C02B
		ld (hl), $00
		ld hl, screen_none_screen_load					; screen_none_screen_load = $1195
		ld (load_method_type), hl		; load_method_type = $C02D
		ld hl, screen_splash_screen_load				; screen_splash_screen_load = $119D
		ld (load_method_type + 2), hl	; load_method_type + 2 = $C02F
		ld hl, screen_title_screen_load					; screen_title_screen_load = $1220
		ld (_RAM_C031_), hl
		ld hl, screen_scroll_screen_load				; screen_scroll_screen_load = $1389
		ld (_RAM_C033_), hl
		ld hl, screen_select_screen_load				; screen_select_screen_load = $13EA
		ld (_RAM_C035_), hl
		ld hl, screen_record_screen_load				; screen_record_screen_load = $14E2
		ld (_RAM_C037_), hl
		ld hl, screen_none_screen_update				; screen_none_screen_update = $1196
		ld (update_method_type), hl		; update_method_type = $C039
		ld hl, screen_splash_screen_update				; screen_splash_screen_update = $11B9
		ld (update_method_type + 2), hl	; update_method_type + 2 = $C03B
		ld hl, screen_title_screen_update				; screen_title_screen_update = $12BE
		ld (_RAM_C03D_), hl
		ld hl, screen_scroll_screen_update				; screen_scroll_screen_update = $138F
		ld (_RAM_C03F_), hl
		ld hl, screen_select_screen_update				; screen_select_screen_update = $144D
		ld (_RAM_C041_), hl
		ld hl, screen_record_screen_update				; screen_record_screen_update = $14E8
		ld (_RAM_C043_), hl
		ret

engine_screen_manager_update:
		ld a, ($C02B)	; $C02B = $C02B
		ld iy, next_screen_type		; next_screen_type = $C02C
		sub (iy+0)
		jr z, A$screen_manager$193
		ld a, (iy+0)
		ld iy, $C02B		; $C02B = $C02B
		ld (iy+0), a
		ld bc, load_method_type		; load_method_type = $C02D
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld h, (hl)
		ld l, c
		call sdcc_call_hl
A$screen_manager$193:
		ld bc, update_method_type		; update_method_type = $C039
		ld iy, $C02B		; $C02B = $C02B
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld b, (hl)
		ld hl, next_screen_type		; next_screen_type = $C02C
		push hl
		ld l, c
		ld h, b
		call sdcc_call_hl
		pop af
		ret

;.ends