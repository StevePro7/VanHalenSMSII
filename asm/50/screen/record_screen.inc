_screen_record_screen_load:
		call _engine_scroll_manager_reset
		jp load_record

_screen_record_screen_update:
		push ix
		ld ix, $0000
		add ix, sp
		ld a, $04			; input_type_left
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld a, l
		or a
		jr z, +;
		call _engine_record_manager_decrement
		call load_record
+:
		ld a, $08			; input_type_right
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld a, l
		or a
		jr z, ++
		call _engine_record_manager_increment
		call load_record
++:
		ld a, $10		; input_type_fire2
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld c, l
		push bc
		ld a, $20		; input_type_fire2
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		pop bc
		ld e, (ix + $04)
		ld d, (ix + $05)
		ld a, c
		or a
		jr nz, +++
		or l
		jr z, ++++
+++:
		push de
		xor a
		push af
		inc sp
		call _devkit_SMS_setBGScrollY
		inc sp
		pop de
		ld hl, $C02A		; ro->record_album_index
		ld b, (hl)
		push de
		push bc
		inc sp
		call _engine_record_manager_init
		inc sp
		pop de
		ld hl, $C02A		; ro->record_album_index
		ld b, (hl)
		push de
		push bc
		inc sp
		call _engine_cursor_manager_init
		inc sp
		call _engine_storage_manager_write
		pop de
		ld a, $04
		ld (de), a
		jr +++++
++++:
		ld a, $05
		ld (de), a
+++++:
		pop ix
		ret

; static void load_record()
load_record:
		call _devkit_SMS_displayOff
		call _engine_asm_manager_clear_VRAM
		call _engine_record_manager_load
		jp _devkit_SMS_displayOn