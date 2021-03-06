_engine_screen_manager_init:
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		ld (Fscreen_manager$next_screen_type), a		; Fscreen_manager$next_screen_type = $C02C
		ld hl, Fscreen_manager$curr_screen_type			; Fscreen_manager$curr_screen_type = $C02B
		ld (hl), $00
		ld hl, _screen_none_screen_load					; _screen_none_screen_load = $1195
		ld (Fscreen_manager$load_method$0$0), hl		; Fscreen_manager$load_method$0$0 = $C02D
		ld hl, _screen_splash_screen_load				; _screen_splash_screen_load = $119D
		ld (Fscreen_manager$load_method$0$0 + 2), hl	; Fscreen_manager$load_method$0$0 + 2 = $C02F
		ld hl, _screen_title_screen_load				; _screen_title_screen_load = $1220
		ld (_RAM_C031_), hl
		ld hl, _screen_scroll_screen_load				; _screen_scroll_screen_load = $1389
		ld (_RAM_C033_), hl
		ld hl, _screen_select_screen_load				; _screen_select_screen_load = $13EA
		ld (_RAM_C035_), hl
		ld hl, _screen_record_screen_load				; _screen_record_screen_load = $14E2
		ld (_RAM_C037_), hl
		ld hl, _screen_none_screen_update				; _screen_none_screen_update = $1196
		ld (Fscreen_manager$update_method$0$), hl		; Fscreen_manager$update_method$0$ = $C039
		ld hl, _screen_splash_screen_update				; _screen_splash_screen_update = $11B9
		ld (Fscreen_manager$update_method$0$ + 2), hl	; Fscreen_manager$update_method$0$ + 2 = $C03B
		ld hl, _screen_title_screen_update				; _screen_title_screen_update = $12BE
		ld (_RAM_C03D_), hl
		ld hl, _screen_scroll_screen_update				; _screen_scroll_screen_update = $138F
		ld (_RAM_C03F_), hl
		ld hl, _screen_select_screen_update				; _screen_select_screen_update = $144D
		ld (_RAM_C041_), hl
		ld hl, _screen_record_screen_update				; _screen_record_screen_update = $14E8
		ld (_RAM_C043_), hl
		ret

_engine_screen_manager_update:
		ld a, (Fscreen_manager$curr_screen_type)	; Fscreen_manager$curr_screen_type = $C02B
		ld iy, Fscreen_manager$next_screen_type	; Fscreen_manager$next_screen_type = $C02C
		sub (iy+0)
		jr z, A$screen_manager$193
		ld a, (iy+0)
		ld iy, Fscreen_manager$curr_screen_type	; Fscreen_manager$curr_screen_type = $C02B
		ld (iy+0), a
		ld bc, Fscreen_manager$load_method$0$0	; Fscreen_manager$load_method$0$0 = $C02D
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld h, (hl)
		ld l, c
		call ___sdcc_call_hl
A$screen_manager$193:
		ld bc, Fscreen_manager$update_method$0$	; Fscreen_manager$update_method$0$ = $C039
		ld iy, Fscreen_manager$curr_screen_type	; Fscreen_manager$curr_screen_type = $C02B
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld b, (hl)
		ld hl, Fscreen_manager$next_screen_type	; Fscreen_manager$next_screen_type = $C02C
		push hl
		ld l, c
		ld h, b
		call ___sdcc_call_hl
		pop af
		ret