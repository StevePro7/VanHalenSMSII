.section "engine_record_manager_init" free
engine_record_manager_init:
		ld hl, $C02A		; $C02A = $C02A
		ld iy, $0002
		add iy, sp
		ld a, (iy + $00)
		ld (hl), a
		ret

.ends

.section "engine_record_manager_load" free
engine_record_manager_load:
		push ix
		ld ix, $0000
		add ix, sp
		dec sp
		ld a, ($C02A)		; ro->$C02A
		ld (ix - 1), a
		ld l, a
		ld h, $00
		add hl, hl
		ld c, l
		ld b, h
		ld hl, $C162		; $C162 = $C162
		add hl, bc
		ld e, (hl)
		inc hl
		ld d, (hl)
		ld hl, $C17A		; $C17A = $C17A
		add hl, bc
		ld c, (hl)
		inc hl
		ld b, (hl)
		ld a, (ix - 1)
		add a, $89
		ld l, a
		ld a, $00
		adc a, $11
		ld h, a
		ld h, (hl)
		push bc
		push de
		push hl
		inc sp
		call devkit_SMS_mapROMBank
		inc sp
		pop de
		ld hl, $0000					; RECORD_TILES	0
		push hl
		push de
		call devkit_SMS_loadPSGaidencompress
		pop af
		ld hl, $0000					; devkit_SMS_loadSTMcompressedTileMap( 0, 0
		ex (sp), hl
		call devkit_SMS_loadSTMcompressedTil
		pop af
		pop af
		ld hl, ($C192)	; $C192 = $C192
		push hl
		call devkit_SMS_loadBGPalette
		pop af
		inc sp
		pop ix
		ret

.ends

.section "engine_record_manager_decrement" free
engine_record_manager_decrement:
		ld bc, $C02A			; ro->$C02A
		ld a, (bc)
		or a								; if( 0 == ro->$C02A )
		jr nz, record_goto_01
		ld a, $0B
		ld (bc), a							; ro->$C02A = MAX_RECORDS - 1;
		ret
;.ends
;.section "record_goto_01" free
record_goto_01:
		add a, $FF
		ld (bc), a							; ro->$C02A--;
		ret

.ends

.section "engine_record_manager_increment" free
engine_record_manager_increment:
		ld bc, $C02A		; ro->$C02A
		ld a, (bc)
		cp $0B							; if( ( MAX_RECORDS - 1 ) == ro->$C02A )
		jr nz, record_goto_02
		xor a							; ro->$C02A = 0;
		ld (bc), a
		ret
;.ends
;.section "record_goto_02" free
record_goto_02:
		inc a							; ro->$C02A++;
		ld (bc), a
		ret

.ends
