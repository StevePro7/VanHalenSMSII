_screen_select_screen_load:
		ld a, (G$global_scroll_object$0$0)		; G$global_scroll_object$0$0 = $C045
		or a
		jr nz, A$select_screen$136
		call _devkit_SMS_displayOff
		call _engine_asm_manager_clear_VRAM
		call _engine_content_manager_load_til
		call _fngine_content_manager_load_tit
		call _engine_content_manager_load_spr
		ld hl, $0806	; x = $06	y = $08
		push hl
		ld hl, select_record_label
		push hl
		call _engine_font_manager_draw_text
		pop af
		ld hl, $0814	; x = $08	y = $14 (20)
		ex (sp), hl
		ld hl, select_covers_label
		push hl
		call _engine_font_manager_draw_text
		pop af
		pop af
		call _devkit_SMS_displayOn
A$select_screen$136:
		ld hl, G$global_scroll_object$0$0		; so->scroll_value_offset	; $C045
		ld b, (hl)
		push bc
		inc sp
		call _engine_cursor_manager_load
		inc sp
		ld hl, $000F		; SELECT_FLASH_DELAY	15
		push hl
		call _engine_delay_manager_load
		ld hl, $004B		; SELECT_VALUE_RESET	75
		ex (sp), hl
		call _engine_reset_manager_load
		pop af
		ld hl, select_screen_event		; static unsigned char event_stage	; select_screen_event = $C057
		ld (hl), $00
		ld hl, select_screen_flash		; static unsigned char flash	; select_screen_flash = $C058
		ld (hl), $01
		ret

select_record_label:
	; "RECORD"
	.db $52 $45 $43 $4F $52 $44 $00

select_covers_label:
; Data from 14DC to 14E2 (7 bytes)
	; "COVERS"
	.db $43 $4F $56 $45 $52 $53 $00
	
_screen_select_screen_update:
		ld a, (select_screen_event)		; static unsigned char event_stage	; $C057
		dec a
		jr nz, A$select_screen$250
		ld a, (select_screen_flash)		; static unsigned char flash		; $C058
		or a
		jr z, A$select_screen$207
		call _engine_cursor_manager_draw
A$select_screen$207:
		call _engine_delay_manager_update
		ld a, l
		or a
		jr z, A$select_screen$225
		ld hl, select_screen_flash		; static unsigned char flash	; select_screen_flash = $C058
		ld a, $01						; flash = 1;
		sub a, (hl)
		ld (hl), a
A$select_screen$225:
		call _engine_reset_manager_update
		pop de
		pop bc
		push bc
		push de
		ld a, l
		or a
		jr z, A$select_screen$239
		ld a, $05		; screen_type_record	5
		jr A$select_screen$241
A$select_screen$239:
		ld a, $04		; screen_type_select	4
A$select_screen$241:
		ld (bc), a
		ret

A$select_screen$250:
		call _engine_cursor_manager_draw
		ld a, $10		; input_type_fire1
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$294
		call _engine_cursor_manager_save
		ld b, l
		push bc
		inc sp
		call _engine_record_manager_init
		inc sp
		call _engine_audio_manager_sfx_right
		ld hl, select_screen_event 		; static unsigned char event_stage	; select_screen_event = $C057
		ld (hl), $01
		ret
A$select_screen$294:
		ld a, $04		; input_type_left
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$313
		call _engine_cursor_manager_decX
A$select_screen$313:
		ld a, $08		; input_type_right
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$332
		call _engine_cursor_manager_incX
A$select_screen$332:
		ld a, $01		; input_type_up
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$351
		call _engine_cursor_manager_decY
A$select_screen$351:
		ld a, $02		; input_type_down
		push af
		inc sp
		call _engine_input_manager_hold
		inc sp
		ld a, l
		or a
		jr z, A$select_screen$370
		call _engine_cursor_manager_incY
A$select_screen$370:
		pop bc
		pop hl
		push hl
		push bc
		ld (hl), $04		; screen_type_select	4
		ret