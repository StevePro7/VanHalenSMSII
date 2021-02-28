_screen_select_screen_load:
		ld a, ($C045)
		or a
		jr nz, $2B
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
		ld hl, $C045		; so->scroll_value_offset
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
		ld hl, $C057		; static unsigned char event_stage
		ld (hl), $00
		ld hl, $C058		; static unsigned char flash
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
		ld a, ($C057)		; static unsigned char event_stage
		dec a
		jr nz, $2A
		ld a, ($C058)		; static unsigned char flash
		or a
		jr z, +	;$03
		call _engine_cursor_manager_draw
+:
		call _engine_delay_manager_update
		ld a, l
	or a
	jr z, ++	;$07
	ld hl, $C058		; static unsigned char flash

; Data from 14FC to 14FD (2 bytes)
	;.db $3E $01
	ld a, $01		; flash = 1;

; Data from 14FE to 14FE (1 bytes)
	;.db $96
	sub a, (hl)

; Data from 14FF to 14FF (1 bytes)
	;.db $77
	ld (hl), a
++:
; Data from 1500 to 1502 (3 bytes)
	;.db $CD $B3 $11
	call _engine_reset_manager_update

; Data from 1503 to 1503 (1 bytes)
	pop de

; Data from 1504 to 1504 (1 bytes)
	pop bc

; Data from 1505 to 1505 (1 bytes)
	push bc

; Data from 1506 to 1506 (1 bytes)
	push de

; Data from 1507 to 1507 (1 bytes)
	ld a, l

; Data from 1508 to 1508 (1 bytes)
	or a

; Data from 1509 to 150A (2 bytes)
	;.db $28 $04
	jr z, +++	;$04

; Data from 150B to 150C (2 bytes)
	;.db $3E $05
	ld a, $05		; screen_type_record	5

; Data from 150D to 150E (2 bytes)
	;.db $18 $02
	jr ++++	;$02
+++:
; Data from 150F to 1510 (2 bytes)
	;.db $3E $04
	ld a, $04		; screen_type_select	4
++++:
; Data from 1511 to 1511 (1 bytes)
	;.db $02
	ld (bc), a

; Data from 1512 to 1512 (1 bytes)
	ret

; Data from 1513 to 1515 (3 bytes)
	;.db $CD $13 $0C
	call _engine_cursor_manager_draw

; Data from 1516 to 1517 (2 bytes)
	;.db $3E $10
	ld a, $10		; input_type_fire1

; Data from 1518 to 1518 (1 bytes)
	push af

; Data from 1519 to 1519 (1 bytes)
	inc sp

; Data from 151A to 151C (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 151D to 151D (1 bytes)
	inc sp

; Data from 151E to 151E (1 bytes)
	ld a, l

; Data from 151F to 151F (1 bytes)
	or a

; Data from 1520 to 1521 (2 bytes)
	;.db $28 $13
	jr z, +++++	;$13

; Data from 1522 to 1524 (3 bytes)
	;.db $CD $05 $0C
	;call $0C05
	call _engine_cursor_manager_save

; Data from 1525 to 1525 (1 bytes)
	;.db $45
	ld b, l

; Data from 1526 to 1526 (1 bytes)
	push bc

; Data from 1527 to 1527 (1 bytes)
	inc sp

; Data from 1528 to 152A (3 bytes)
	;.db $CD $7D $0F
	call _engine_record_manager_init

; Data from 152B to 152B (1 bytes)
	inc sp

; Data from 152C to 152E (3 bytes)
	;.db $CD $70 $0A
	call _engine_audio_manager_sfx_right

; Data from 152F to 1531 (3 bytes)
	;.db $21 $57 $C0
	ld hl, $C057		; static unsigned char event_stage

; Data from 1532 to 1533 (2 bytes)
	;.db $36 $01
	ld (hl), $01

; Data from 1534 to 1534 (1 bytes)
	ret
+++++:
; Data from 1535 to 1536 (2 bytes)
	;.db $3E $04
	ld a, $04		; input_type_left

; Data from 1537 to 1537 (1 bytes)
	push af

; Data from 1538 to 1538 (1 bytes)
	inc sp

; Data from 1539 to 153B (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 153C to 153C (1 bytes)
	inc sp

; Data from 153D to 153D (1 bytes)
	ld a, l

; Data from 153E to 153E (1 bytes)
	or a

; Data from 153F to 1540 (2 bytes)
	;.db $28 $03
	jr z, ++++++	;$03

; Data from 1541 to 1543 (3 bytes)
	;.db $CD $3E $0D
	call _engine_cursor_manager_decX
++++++:
; Data from 1544 to 1545 (2 bytes)
	;.db $3E $08
	ld a, $08		; input_type_right

; Data from 1546 to 1546 (1 bytes)
	push af

; Data from 1547 to 1547 (1 bytes)
	inc sp

; Data from 1548 to 154A (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 154B to 154B (1 bytes)
	inc sp

; Data from 154C to 154C (1 bytes)
	ld a, l

; Data from 154D to 154D (1 bytes)
	or a

; Data from 154E to 154F (2 bytes)
	;.db $28 $03
	jr z, +++++++	;$03

; Data from 1550 to 1552 (3 bytes)
	;.db $CD $51 $0D
	;call $0D51
	call _engine_cursor_manager_incX
+++++++:
; Data from 1553 to 1554 (2 bytes)
	;.db $3E $01
	ld a, $01		; input_type_up

; Data from 1555 to 1555 (1 bytes)
	push af

; Data from 1556 to 1556 (1 bytes)
	inc sp

; Data from 1557 to 1559 (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 155A to 155A (1 bytes)
	inc sp

; Data from 155B to 155B (1 bytes)
	ld a, l

; Data from 155C to 155C (1 bytes)
	or a

; Data from 155D to 155E (2 bytes)
	;.db $28 $03
	jr z, $03
+++++++
; Data from 155F to 1561 (3 bytes)
	;.db $CD $63 $0D
	call _engine_cursor_manager_decY

; Data from 1562 to 1563 (2 bytes)
	;.db $3E $02
	ld a, $02		; input_type_down

; Data from 1564 to 1564 (1 bytes)
	push af

; Data from 1565 to 1565 (1 bytes)
	inc sp

; Data from 1566 to 1568 (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 1569 to 1569 (1 bytes)
	inc sp

; Data from 156A to 156A (1 bytes)
	ld a, l

; Data from 156B to 156B (1 bytes)
	or a

; Data from 156C to 156D (2 bytes)
	;.db $28 $03
	jr z, ++++++++	;$03

; Data from 156E to 1570 (3 bytes)
	;.db $CD $76 $0D
	call _engine_cursor_manager_incY
++++++++:
; Data from 1571 to 1571 (1 bytes)
	pop bc

; Data from 1572 to 1572 (1 bytes)
	pop hl

; Data from 1573 to 1573 (1 bytes)
	push hl

; Data from 1574 to 1574 (1 bytes)
	push bc

; Data from 1575 to 1576 (2 bytes)
	;.db $36 $04
	ld (hl), $04		; screen_type_select	4

; Data from 1577 to 1577 (1 bytes)
	ret