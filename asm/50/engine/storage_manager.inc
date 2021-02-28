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
	;.db $CD $6D $08
	call _devkit_SMS_SRAM

; Data from 1144 to 1144 (1 bytes)
	push hl

; Data from 1145 to 1147 (3 bytes)
	;.db $CD $52 $08
	call _devkit_SMS_enableSRAM

; Data from 1148 to 1148 (1 bytes)
	pop bc

; Data from 1149 to 1149 (1 bytes)
	ld l, c

; Data from 114A to 114A (1 bytes)
	ld h, b

; Data from 114B to 114B (1 bytes)
	xor a

; Data from 114C to 114C (1 bytes)
	ld (hl), a

; Data from 114D to 114D (1 bytes)
	inc hl

; Data from 114E to 114E (1 bytes)
	ld (hl), a

; Data from 114F to 114F (1 bytes)
	inc hl

; Data from 1150 to 1150 (1 bytes)
	xor a

; Data from 1151 to 1151 (1 bytes)
	ld (hl), a

; Data from 1152 to 1152 (1 bytes)
	inc hl

; Data from 1153 to 1153 (1 bytes)
	ld (hl), a

; Data from 1154 to 1156 (3 bytes)
	;.db $21 $04 $00
	ld hl, $0004

; Data from 1157 to 1157 (1 bytes)
	add hl, bc

; Data from 1158 to 1159 (2 bytes)
	ld (hl), $00

; Data from 115A to 115C (3 bytes)
	;.db $21 $05 $00
	ld hl, $0005

; Data from 115D to 115D (1 bytes)
	add hl, bc

; Data from 115E to 115F (2 bytes)
	ld (hl), $FE

; Data from 1160 to 1162 (3 bytes)
	;.db $C3 $67 $08
	jp _devkit_SMS_disableSRAM
