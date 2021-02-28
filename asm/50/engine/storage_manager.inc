_engine_storage_manager_availabl:
		call _devkit_SMS_SRAM
		push hl
		call _devkit_SMS_enableSRAM
		pop hl
		ld c, (hl)
		inc hl
		ld b, (hl)
		inc hl
		ld e, (hl)
		inc hl
		ld d, (hl)
		ld a, c
		sub a, $04		; MAGIC			0xACE0B004
		jr nz, ++	;$13
		ld a, b
		sub a, $B0		; MAGIC			0xACE0B004
		jr nz, +++
		ld a, e
		sub a, $E0		; MAGIC			0xACE0B004
		jr nz, ++
		ld a, d
		sub a, $AC		; MAGIC			0xACE0B004
		jr nz, ++
	+:
		ld a, $01
		jr ++++
	++:
	+++:
		xor a
	++++:
		ld l, a
		push hl
		call _devkit_SMS_disableSRAM
		pop hl
		ret

; Data from 1107 to 1109 (3 bytes)
_engine_storage_manager_read:
		call _devkit_SMS_SRAM
		push hl
		call _devkit_SMS_enableSRAM
		pop iy
		ld c, (iy + $04)
		ld hl, $C02A		; ro->record_album_index
		ld (hl), c
		jp _devkit_SMS_disableSRAM
	
_engine_storage_manager_write:
		call _devkit_SMS_SRAM
		push hl
		call _devkit_SMS_enableSRAM
		pop bc
		ld l, c
		ld h, b
		ld (hl), $04		; MAGIC			0xACE0B004
		inc hl
		ld (hl), $B0		; MAGIC			0xACE0B004
		inc hl
		ld (hl), $E0		; MAGIC			0xACE0B004
		inc hl
		ld (hl), $AC		; MAGIC			0xACE0B004
		ld hl, $0004
		add hl, bc
		ex de, hl
		ld a, ($C02A)		; ro->record_album_index
		ld (de), a
		ld hl, $0005
		add hl, bc
		ld (hl), $FE		; savegame->terminal = FINAL;
		jp _devkit_SMS_disableSRAM

; Data from 1141 to 1143 (3 bytes)
_engine_storage_manager_erase:
		call _devkit_SMS_SRAM
		push hl
		call _devkit_SMS_enableSRAM
		pop bc
		ld l, c
		ld h, b
		xor a				; savegame->Magic = 0x00000000;
		ld (hl), a
		inc hl
		ld (hl), a
		inc hl
		xor a				; savegame->save_album_index = 0;
		ld (hl), a
		inc hl
		ld (hl), a
		ld hl, $0004
		add hl, bc
		ld (hl), $00
		ld hl, $0005
		add hl, bc
		ld (hl), $FE		; FINAL		0xFE
		jp _devkit_SMS_disableSRAM