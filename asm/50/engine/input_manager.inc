_engine_input_manager_update:
		ld hl, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C152
		ld (Finput_manager$prev_joypad1$0$0), hl	; Finput_manager$prev_joypad1$0$0 = $C154
		call _devkit_SMS_getKeysStatus
		ld (Finput_manager$curr_joypad1$0$0), hl	; Finput_manager$curr_joypad1$0$0 = $C152
		ret

; Data from ED3 to ED5 (3 bytes)
_engine_input_manager_hold:
	;.db $21 $02 $00
	ld hl, $0002

; Data from ED6 to ED6 (1 bytes)
	add hl, sp

; Data from ED7 to ED7 (1 bytes)
	ld c, (hl)

; Data from ED8 to ED9 (2 bytes)
	;.db $06 $00
	ld b, $00

; Data from EDA to EDD (4 bytes)
	;.db $FD $21 $52 $C1
	ld iy, Finput_manager$curr_joypad1$0$0

; Data from EDE to EE0 (3 bytes)
	;.db $FD $7E $00
	ld a, (iy + $00)

; Data from EE1 to EE1 (1 bytes)
	and c

; Data from EE2 to EE2 (1 bytes)
	ld e, a

; Data from EE3 to EE5 (3 bytes)
	;.db $FD $7E $01
	ld a, (iy + $01)

; Data from EE6 to EE6 (1 bytes)
	and b

; Data from EE7 to EE7 (1 bytes)
	or e

; Data from EE8 to EE9 (2 bytes)
	jr z, $10

; Data from EEA to EEA (1 bytes)
	ld a, c

; Data from EEB to EEE (4 bytes)
	;.db $FD $21 $54 $C1
	ld iy, Finput_manager$prev_joypad1$0$0

; Data from EEF to EF1 (3 bytes)
	;.db $FD $A6 $00
	and (iy + $00)

; Data from EF2 to EF2 (1 bytes)
	ld c, a

; Data from EF3 to EF3 (1 bytes)
	ld a, b

; Data from EF4 to EF6 (3 bytes)
	;.db $FD $A6 $01
	and (iy + $01)

; Data from EF7 to EF7 (1 bytes)
	or c

; Data from EF8 to EF9 (2 bytes)
	jr z, $03

; Data from EFA to EFB (2 bytes)
	ld l, $00

; Data from EFC to EFC (1 bytes)
	ret

; Data from EFD to EFE (2 bytes)
	ld l, $01

; Data from EFF to EFF (1 bytes)
	ret

; Data from F00 to F02 (3 bytes)
_engine_input_manager_move:
	;.db $21 $02 $00
	ld hl, $0002

; Data from F03 to F03 (1 bytes)
	add hl, sp

; Data from F04 to F04 (1 bytes)
	ld c, (hl)

; Data from F05 to F07 (3 bytes)
	;.db $3A $52 $C1
	ld a, (Finput_manager$curr_joypad1$0$0)

; Data from F08 to F08 (1 bytes)
	and c

; Data from F09 to F09 (1 bytes)
	ld l, a

; Data from F0A to F0A (1 bytes)
	ret