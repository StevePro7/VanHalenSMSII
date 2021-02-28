_screen_title_screen_load:
		call _devkit_SMS_displayOff
		call _engine_content_manager_load_til
		call _engine_content_manager_load_spr
		call _engine_content_manager_load_tit
		ld hl, $150A					; engine_font_manager_draw_text( ..., 10, 21 );
		push hl
		ld hl, press_start				; engine_font_manager_draw_text( LOCALE_PRESS_START
		push hl
		call _engine_font_manager_draw_text
		pop af
		ld hl, $0C06					; engine_font_manager_draw_text( ..., 6, 12 );
		ex (sp), hl
		ld hl, title_record_label		; engine_font_manager_draw_text( LOCALE_RECORD_TEXT
		push hl
		call _engine_font_manager_draw_text
		pop af
		ld hl, $0C14					; engine_font_manager_draw_text( ..., 20, 12 );
		ex (sp), hl
		ld hl, title_covers_label		; engine_font_manager_draw_text( LOCALE_COVERS_TEXT
		push hl
		call _engine_font_manager_draw_text
		pop af
		ld hl, $171C					; engine_font_manager_draw_text( ..., 28, 23 );
		ex (sp), hl
		ld hl, title_build_label		; engine_font_manager_draw_text( LOCALE_BUILD_VALUE
		push hl
		call _engine_font_manager_draw_text
		pop af
		pop af
		call _devkit_SMS_displayOn
		ld hl, $0032		; TITLE_FLASH_DELAY	50
		push hl
		call _engine_delay_manager_load
		ld hl, $004B		; TITLE_VALUE_RESET	75
		ex (sp), hl
		call _engine_reset_manager_load
		pop af
		xor a
		push af
		inc sp
		call _engine_record_manager_init
		inc sp
		call _engine_storage_manager_availabl
		ld a, l
		or a
		jr z, +	;$03
		call _engine_storage_manager_read
+:
		ld hl, record_album_index		; record_album_index = $C02A		; ro->record_album_index
		ld b, (hl)
		push bc
		inc sp
		call _engine_record_manager_init
		inc sp
		ld hl, record_album_index		; record_album_index = $C02A		; ro->record_album_index
		ld b, (hl)
		push bc
		inc sp
		call _engine_cursor_manager_init
		inc sp
		ld hl, title_screen_event		; title_screen_event = $C054
		ld (hl), $00					; event_stage_start = 0
		ld hl, title_screen_flash		; title_screen_flash = $C055
		ld (hl), $00					; flash = 0;
		ret

press_start:
	; "PRESS START"
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00

title_record_label:
	; "RECORD"
	.db $52 $45 $43 $4F $52 $44 $00

title_covers_label:
	; "COVERS"
	.db $43 $4F $56 $45 $52 $53 $00

title_build_label:
	; "V1.0"
	.db $56 $31 $2E $30 $00

_screen_title_screen_update:
		push ix
		ld ix, $0000
		add ix, sp
		push af
		dec sp
		ld a, (ix + $04)
		ld (ix - 2), a
		ld a, (ix + $05)
		ld (ix - 1), a
		ld a, (title_screen_event)	; title_screen_event = $C054
		dec a
		jr nz, $36
		call _engine_reset_manager_update
		ld c, l
		ld a, c
		or a
		jr z, $1B
		push bc
		ld hl, $150A			; engine_font_manager_draw_text( ..., 10, 21 );
		push hl
		ld hl, blank_clear		; engine_font_manager_draw_text( LOCALE_BLANK_CLEAR
		push hl
		call _engine_font_manager_draw_text
		pop af
		ld hl, $1715			; engine_font_manager_draw_text( ..., 21, 23 );
		ex (sp), hl
		ld hl, blank_clear		; engine_font_manager_draw_text( LOCALE_BLANK_CLEAR
		push hl
		call _engine_font_manager_draw_text
		pop af
		pop af
		pop bc
		ld a, c
		or a
		jr z, ++
		ld c, $03				; screen_type_scroll = 3
		jr +++
++:
		ld c, $02				; screen_type_title = 2
+++:
		ld l, (ix - 2)
		ld h, (ix - 1)
		ld (hl), c
		jr $5C

		call _engine_delay_manager_update
		ld (ix - 3), l
		ld a, l
	or a
	jr z, $29
	ld hl, title_screen_flash	; title_screen_flash = $C055

; Data from 13B3 to 13B4 (2 bytes)
	;.db $3E $01
	ld a, $01

; Data from 13B5 to 13B5 (1 bytes)
	sub a, (hl)

; Data from 13B6 to 13B6 (1 bytes)
	ld (hl), a

; Data from 13B7 to 13B9 (3 bytes)
	;.db $3A $61 $C0
	ld a,(title_screen_flash)	; title_screen_flash = $C055
	
; Data from 13BA to 13BA (1 bytes)
	or a

; Data from 13BB to 13BC (2 bytes)
	;.db $28 $0F
	jr z, ++++	;$0F
	

; Data from 13BD to 13BF (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A				; engine_font_manager_draw_text( LOCALE_PRESS_START, 10, 21 );

; Data from 13C0 to 13C0 (1 bytes)
	push hl

; Data from 13C1 to 13C3 (3 bytes)
	;.db $21 $07 $14
	ld hl, $1371
	

; Data from 13C4 to 13C4 (1 bytes)
	push hl

; Data from 13C5 to 13C7 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 13C8 to 13C8 (1 bytes)
	pop af

; Data from 13C9 to 13C9 (1 bytes)
	pop af

; Data from 13CA to 13CB (2 bytes)
	;.db $18 $0D
	jr +++++	;$0D
++++:
; Data from 13CC to 13CE (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A

; Data from 13CF to 13CF (1 bytes)
	push hl

; Data from 13D0 to 13D2 (3 bytes)
	;.db $21 $13 $14
	;ld hl, $_engine_content_manager_load_spr
	ld hl, press_start2

; Data from 13D3 to 13D3 (1 bytes)
	push hl

; Data from 13D4 to 13D6 (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text

; Data from 13D7 to 13D7 (1 bytes)
	pop af

; Data from 13D8 to 13D8 (1 bytes)
	pop af
+++++:
; Data from 13D9 to 13DA (2 bytes)
	;.db $3E $10
	ld a, $10		; input_type_fire1

; Data from 13DB to 13DB (1 bytes)
	push af

; Data from 13DC to 13DC (1 bytes)
	inc sp

; Data from 13DD to 13DF (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 13E0 to 13E0 (1 bytes)
	inc sp

; Data from 13E1 to 13E1 (1 bytes)
	ld a, l

; Data from 13E2 to 13E2 (1 bytes)
	or a

; Data from 13E3 to 13E4 (2 bytes)
	;.db $28 $15
	jr z, $15

; Data from 13E5 to 13E7 (3 bytes)
	;.db $21 $0A $15
	ld hl, $150A

; Data from 13E8 to 13E8 (1 bytes)
	push hl

; Data from 13E9 to 13EB (3 bytes)
	;.db $21 $13 $14
	;ld hl, $1413
	ld hl, press_start2

; Data from 13EC to 13EC (1 bytes)
	push hl

; Data from 13ED to 13EF (3 bytes)
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text
	

; Data from 13F0 to 13F0 (1 bytes)
	pop af

; Data from 13F1 to 13F1 (1 bytes)
	pop af

; Data from 13F2 to 13F4 (3 bytes)
	;.db $CD $70 $0A
	call _engine_audio_manager_sfx_right

; Data from 13F5 to 13F7 (3 bytes)
	;.db $21 $60 $C0
	ld hl, $C054

; Data from 13F8 to 13F9 (2 bytes)
	;.db $36 $01
	ld (hl), $01

; Data from 13FA to 13FC (3 bytes)
	;.db $DD $6E $FE
	ld l, (ix - 2)
	
; Data from 13FD to 13FF (3 bytes)
	;.db $DD $66 $FF
	ld h, (ix - 1)

; Data from 1400 to 1401 (2 bytes)
	;.db $36 $02
	ld (hl), $02

; Data from 1402 to 1403 (2 bytes)
	;.db $DD $F9
	ld sp, ix

; Data from 1404 to 1405 (2 bytes)
	;.db $DD $E1
	pop ix

; Data from 1406 to 1406 (1 bytes)
	ret

; Data from 1407 to 1412 (12 bytes)
blank_clear:
	; "           "
	.dsb 11, $20
	.db $00

; Data from 1413 to 141E (12 bytes)
press_start2:
	; "PRESS START"
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00