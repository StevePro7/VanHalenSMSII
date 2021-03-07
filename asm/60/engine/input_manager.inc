;.section "Input manager" free
engine_input_manager_update:
		ld hl, ($C146)	; Finput_manager$curr_joypad1$0$0 = $C146
		ld ($C148), hl	; Finput_manager$prev_joypad1$0$0 = $C148
		call devkit_SMS_getKeysStatus
		ld ($C146), hl	; Finput_manager$curr_joypad1$0$0 = $C146
		ret

engine_input_manager_hold:
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld b, $00
		ld iy, $C146
		ld a, (iy + $00)
		and c
		ld e, a
		ld a, (iy + $01)
		and b
		or e
		jr z, A$input_manager$109
		ld a, c
		ld iy, $C148
		and (iy + $00)
		ld c, a
		ld a, b
		and (iy + $01)
		or c
		jr z, A$input_manager$112
A$input_manager$109:
		ld l, $00
		ret
A$input_manager$112:
		ld l, $01
		ret

engine_input_manager_move:
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld a, ($C146)
		and c
		ld l, a
		ret

;.ends