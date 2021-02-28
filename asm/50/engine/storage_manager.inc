_engine_storage_manager_availabl:
	call _devkit_SMS_SRAM
	push hl
	call _devkit_SMS_enableSRAM
	pop hl
	ld c, (hl)
	inc hl

; Data from 10E2 to 10E2 (1 bytes)
	ld b, (hl)

; Data from 10E3 to 10E3 (1 bytes)
	inc hl

; Data from 10E4 to 10E4 (1 bytes)
	ld e, (hl)

; Data from 10E5 to 10E5 (1 bytes)
	inc hl

; Data from 10E6 to 10E6 (1 bytes)
	ld d, (hl)

; Data from 10E7 to 10E7 (1 bytes)
	ld a, c

; Data from 10E8 to 10E9 (2 bytes)
	sub a, $04		; MAGIC			0xACE0B004

; Data from 10EA to 10EB (2 bytes)
	jr nz, $13

; Data from 10EC to 10EC (1 bytes)
	ld a, b

; Data from 10ED to 10EE (2 bytes)
	sub a, $B0		; MAGIC			0xACE0B004

; Data from 10EF to 10F0 (2 bytes)
	jr nz, $0E

; Data from 10F1 to 10F1 (1 bytes)
	ld a, e

; Data from 10F2 to 10F3 (2 bytes)
	sub a, $E0		; MAGIC			0xACE0B004

; Data from 10F4 to 10F5 (2 bytes)
	jr nz, ++++	;$09

; Data from 10F6 to 10F6 (1 bytes)
	ld a, d

; Data from 10F7 to 10F8 (2 bytes)
	sub a, $AC		; MAGIC			0xACE0B004

; Data from 10F9 to 10FA (2 bytes)
	jr nz, ++++;	$04

; Data from 10FB to 10FC (2 bytes)
	ld a, $01

; Data from 10FD to 10FE (2 bytes)
	jr $01
++++:
; Data from 10FF to 10FF (1 bytes)
	xor a

; Data from 1100 to 1100 (1 bytes)
	ld l, a

; Data from 1101 to 1101 (1 bytes)
	push hl

; Data from 1102 to 1104 (3 bytes)
	;.db $CD $67 $08
	call _devkit_SMS_disableSRAM

; Data from 1105 to 1105 (1 bytes)
	pop hl

; Data from 1106 to 1106 (1 bytes)
	ret

; Data from 1107 to 1109 (3 bytes)
_engine_storage_manager_read:
	;.db $CD $6D $08
	call _devkit_SMS_SRAM

; Data from 110A to 110A (1 bytes)
	push hl

; Data from 110B to 110D (3 bytes)
	;.db $CD $52 $08
	call _devkit_SMS_enableSRAM

; Data from 110E to 110F (2 bytes)
	;.db $FD $E1
	pop iy

; Data from 1110 to 1112 (3 bytes)
	;.db $FD $4E $04
	ld c, (iy + $04)

; Data from 1113 to 1115 (3 bytes)
	;.db $21 $2A $C0
	ld hl, $C02A		; ro->record_album_index

; Data from 1116 to 1116 (1 bytes)
	ld (hl), c

; Data from 1117 to 1119 (3 bytes)
	;.db $C3 $67 $08
	jp _devkit_SMS_disableSRAM

; Data from 111A to 111C (3 bytes)
_engine_storage_manager_write:
	;.db $CD $6D $08
	call _devkit_SMS_SRAM

; Data from 111D to 111D (1 bytes)
	push hl

; Data from 111E to 1120 (3 bytes)
	;.db $CD $52 $08
	call _devkit_SMS_enableSRAM

; Data from 1121 to 1121 (1 bytes)
	pop bc

; Data from 1122 to 1122 (1 bytes)
	ld l, c

; Data from 1123 to 1123 (1 bytes)
	ld h, b

; Data from 1124 to 1125 (2 bytes)
	ld (hl), $04		; MAGIC			0xACE0B004

; Data from 1126 to 1126 (1 bytes)
	inc hl

; Data from 1127 to 1128 (2 bytes)
	ld (hl), $B0		; MAGIC			0xACE0B004

; Data from 1129 to 1129 (1 bytes)
	inc hl

; Data from 112A to 112B (2 bytes)
	ld (hl), $E0		; MAGIC			0xACE0B004

; Data from 112C to 112C (1 bytes)
	inc hl

; Data from 112D to 112E (2 bytes)
	ld (hl), $AC		; MAGIC			0xACE0B004

; Data from 112F to 1131 (3 bytes)
	;.db $21 $04 $00
	ld hl, $0004

; Data from 1132 to 1132 (1 bytes)
	add hl, bc

; Data from 1133 to 1133 (1 bytes)
	ex de, hl

; Data from 1134 to 1136 (3 bytes)
	;.db $3A $2A $C0
	ld a, ($C02A)		; ro->record_album_index

; Data from 1137 to 1137 (1 bytes)
	ld (de), a

; Data from 1138 to 113A (3 bytes)
	;.db $21 $05 $00
	ld hl, $0005

; Data from 113B to 113B (1 bytes)
	add hl, bc

; Data from 113C to 113D (2 bytes)
	ld (hl), $FE		; savegame->terminal = FINAL;

; Data from 113E to 1140 (3 bytes)
	;.db $C3 $67 $08
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
