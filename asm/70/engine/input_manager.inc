.section "engine_input_manager_update" free
engine_input_manager_update:
		ld hl, ($C146)	; Finput_manager$$C146$0$0 = $C146
		ld ($C148), hl	; Finput_manager$$C148$0$0 = $C148
		call devkit_SMS_getKeysStatus
		ld ($C146), hl	; Finput_manager$$C146$0$0 = $C146
		ret

.ends

.section "engine_input_manager_hold" free
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
		jr z, input_goto_01
		ld a, c
		ld iy, $C148
		and (iy + $00)
		ld c, a
		ld a, b
		and (iy + $01)
		or c
		jr z, input_goto_02
;.ends
;.section "input_goto_01" free
input_goto_01:
		ld l, $00
		ret
;.ends
;.section "input_goto_02" free
input_goto_02:
		ld l, $01
		ret

.ends

.section "engine_input_manager_move" free
engine_input_manager_move:
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld a, ($C146)
		and c
		ld l, a
		ret
.ends
