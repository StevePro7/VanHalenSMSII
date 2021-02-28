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
	jr nz, +++	;$03
	or l
	jr z, $29
+++:
; Data from 15CA to 15CA (1 bytes)
	push de

; Data from 15CB to 15CB (1 bytes)
	xor a

; Data from 15CC to 15CC (1 bytes)
	push af

; Data from 15CD to 15CD (1 bytes)
	inc sp

; Data from 15CE to 15D0 (3 bytes)
	;.db $CD $46 $08
	call _devkit_SMS_setBGScrollY

; Data from 15D1 to 15D1 (1 bytes)
	inc sp

; Data from 15D2 to 15D2 (1 bytes)
	pop de

; Data from 15D3 to 15D5 (3 bytes)
	;.db $21 $2A $C0
	ld hl, $C02A		; ro->record_album_index

; Data from 15D6 to 15D6 (1 bytes)
	ld b, (hl)

; Data from 15D7 to 15D7 (1 bytes)
	push de

; Data from 15D8 to 15D8 (1 bytes)
	push bc

; Data from 15D9 to 15D9 (1 bytes)
	inc sp

; Data from 15DA to 15DC (3 bytes)
	;.db $CD $7D $0F
	call _engine_record_manager_init

; Data from 15DD to 15DD (1 bytes)
	inc sp

; Data from 15DE to 15DE (1 bytes)
	pop de

; Data from 15DF to 15E1 (3 bytes)
	;.db $21 $2A $C0
	ld hl, $C02A		; ro->record_album_index

; Data from 15E2 to 15E2 (1 bytes)
	ld b, (hl)

; Data from 15E3 to 15E3 (1 bytes)
	push de

; Data from 15E4 to 15E4 (1 bytes)
	push bc

; Data from 15E5 to 15E5 (1 bytes)
	inc sp

; Data from 15E6 to 15E8 (3 bytes)
	;.db $CD $67 $0B
	call _engine_cursor_manager_init

; Data from 15E9 to 15E9 (1 bytes)
	inc sp

; Data from 15EA to 15EC (3 bytes)
	;.db $CD $1A $11
	call _engine_storage_manager_write

; Data from 15ED to 15ED (1 bytes)
	pop de

; Data from 15EE to 15EF (2 bytes)
	;.db $3E $04
	ld a, $04

; Data from 15F0 to 15F0 (1 bytes)
	;ld (de), a
	ld (de), a

; Data from 15F1 to 15F2 (2 bytes)
	;.db $18 $03
	jr +++++	; $03

; Data from 15F3 to 15F4 (2 bytes)
	;.db $3E $05
	ld a, $05

; Data from 15F5 to 15F5 (1 bytes)
	ld (de), a
+++++:

; Data from 15F6 to 15F7 (2 bytes)
	;.db $DD $E1
	pop ix

; Data from 15F8 to 15F8 (1 bytes)
	ret

; static void load_record()
load_record:
		call _devkit_SMS_displayOff
		call _engine_asm_manager_clear_VRAM
		call _engine_record_manager_load
		jp _devkit_SMS_displayOn