_engine_input_manager_update:
		ld hl, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C152
		ld (Finput_manager$prev_joypad1$0$0), hl	; Finput_manager$prev_joypad1$0$0 = $C154
		call _devkit_SMS_getKeysStatus
		ld (Finput_manager$curr_joypad1$0$0), hl	; Finput_manager$curr_joypad1$0$0 = $C152
		ret

; Data from ED3 to ED5 (3 bytes)
_engine_input_manager_hold:
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld b, $00
		ld iy, Finput_manager$curr_joypad1$0$0
		ld a, (iy + $00)
		and c
		ld e, a
		ld a, (iy + $01)
		and b
		or e
		jr z, +
		ld a, c
		ld iy, Finput_manager$prev_joypad1$0$0
		and (iy + $00)
		ld c, a
		ld a, b
		and (iy + $01)
		or c
		jr z, ++
+:
		ld l, $00
		ret
++:
		ld l, $01
		ret

; Data from F00 to F02 (3 bytes)
_engine_input_manager_move:
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld a, (Finput_manager$curr_joypad1$0$0)
		and c
		ld l, a
		ret