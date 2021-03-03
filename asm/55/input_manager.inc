A$input_manager$64:	
C$input_manager.c$10$0$0:	
C$input_manager.c$12$1$19:	
G$engine_input_manager_update$0$:	
_engine_input_manager_update:	
		ld hl, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C146
		ld (Finput_manager$prev_joypad1$0$0), hl	; Finput_manager$prev_joypad1$0$0 = $C148
		call A$_sms_manager$874
		ld (Finput_manager$curr_joypad1$0$0), hl	; Finput_manager$curr_joypad1$0$0 = $C146
		ret
	
A$input_manager$88:	
C$input_manager.c$17$1$19:	
C$input_manager.c$19$1$21:	
G$engine_input_manager_hold$0$0:	
_engine_input_manager_hold:	
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld b, $00
		ld iy, Finput_manager$curr_joypad1$0$0	; Finput_manager$curr_joypad1$0$0 = $C146
		ld a, (iy+0)
		and c
		ld e, a
		ld a, (iy+1)
		and b
		or e
		jr z, A$input_manager$109
		ld a, c
		ld iy, Finput_manager$prev_joypad1$0$0	; Finput_manager$prev_joypad1$0$0 = $C148
		and (iy+0)
		ld c, a
		ld a, b
		and (iy+1)
		or c
		jr z, A$input_manager$112
A$input_manager$109:	
		ld l, $00
		ret
	
A$input_manager$112:	
		ld l, $01
		ret
	
A$input_manager$130:	
C$input_manager.c$22$1$21:	
C$input_manager.c$24$1$23:	
G$engine_input_manager_move$0$0:	
_engine_input_manager_move:	
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld a, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C146
		and c
		ld l, a
		ret
