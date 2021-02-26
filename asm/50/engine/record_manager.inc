; Data from F0B to F0D (3 bytes)
_engine_record_manager_init:
		ld hl, record_album_index		; record_album_index = $C02A
		ld iy, $0002
		add iy, sp
		ld a, (iy + $00)
		ld (hl), a
		ret

; Data from F8B to F8C (2 bytes)
_engine_record_manager_load:
		push ix
		ld ix, $0000
		add ix, sp
		dec sp
		ld a, (record_album_index)		; ro->record_album_index
		ld (ix - 1), a
		ld l, a
		ld h, $00
		add hl, hl
		ld c, l
		ld b, h
		ld hl, $C162		; todo		; record_tiles_data	?
		add hl, bc
		ld e, (hl)
		inc hl
		ld d, (hl)
		ld hl, $C17A		; todo		; record_tilemap_data	?
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
		call _devkit_SMS_mapROMBank
		inc sp
		pop de
		ld hl, $0000					; RECORD_TILES	0
		push hl
		push de
		call _devkit_SMS_loadPSGaidencompress
		pop af
		ld hl, $0000					; devkit_SMS_loadSTMcompressedTileMap( 0, 0
		ex (sp), hl
		call _devkit_SMS_loadSTMcompressedTil
		pop af
		pop af
		ld hl, ($C192)			; todo		record_palette_data ??
		push hl
		call _devkit_SMS_loadBGPalette
		pop af
		inc sp
		pop ix
		ret

; Data from F6F to F71 (3 bytes)
_engine_record_manager_decrement:
	;.db $01 $2A $C0
	ld bc, $C02A		; ro->record_album_index

; Data from FE4 to FE4 (1 bytes)
	;ld a, (bc)
	ld a, (bc)

; Data from FE5 to FE5 (1 bytes)
	or a		; if( 0 == ro->record_album_index )

; Data from FE6 to FE7 (2 bytes)
	jr nz, $04

; Data from FE8 to FE9 (2 bytes)
	ld a, $0B

; Data from FEA to FEA (1 bytes)
	ld (bc), a		; ro->record_album_index = MAX_RECORDS - 1;

; Data from FEB to FEB (1 bytes)
	ret

; Data from FEC to FED (2 bytes)
	add a, $FF

; Data from FEE to FEE (1 bytes)
	ld (bc), a		; ro->record_album_index--;

; Data from FEF to FEF (1 bytes)
	ret

; Data from F7E to F80 (3 bytes)
_engine_record_manager_increment:
	.db $01 $2A $C0

; Data from F81 to F81 (1 bytes)
	.db $0A

; Data from F82 to F83 (2 bytes)
	.db $FE $0B

; Data from F84 to F85 (2 bytes)
	.db $20 $03

; Data from F86 to F86 (1 bytes)
	.db $AF

; Data from F87 to F87 (1 bytes)
	.db $02

; Data from F88 to F88 (1 bytes)
	ret

; Data from F89 to F89 (1 bytes)
	.db $3C

; Data from F8A to F8A (1 bytes)
	.db $02

; Data from F8B to F8B (1 bytes)
	ret
