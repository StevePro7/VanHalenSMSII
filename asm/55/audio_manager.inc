A$asm_manager$59:	
C$asm_manager.c$11$0$0:	
C$asm_manager.c$30$1$1:	
G$engine_asm_manager_clear_VRAM$:	
_engine_asm_manager_clear_VRAM:	
		ld a, $00
		out (Port_VDPAddress), a
		ld a, $40
		out (Port_VDPAddress), a
		ld bc, $4000
A$asm_manager$65:	
		ld a, $00
		out (Port_VDPData), a
		dec bc
		ld a, b
		or c
		jp nz, A$asm_manager$65
		ret
	
A$audio_manager$60:	
C$audio_manager.c$18$0$0:	
C$audio_manager.c$20$1$15:	
G$engine_audio_manager_sfx_right:	
_engine_audio_manager_sfx_right:	
		ld hl, _sfx_right_psg	; _sfx_right_psg = $1A5C
		push hl
		call A$audio_manager$123
		pop af
		ret
	
A$audio_manager$81:	
C$audio_manager.c$22$1$15:	
C$audio_manager.c$24$1$16:	
G$engine_audio_manager_sfx_wrong:	
_engine_audio_manager_sfx_wrong:	
		ld hl, _sfx_wrong_psg	; _sfx_wrong_psg = $1A7C
		push hl
		call A$audio_manager$123
		pop af
		ret
	
A$audio_manager$102:	
C$audio_manager.c$26$1$16:	
C$audio_manager.c$28$1$17:	
G$engine_audio_manager_sfx_cheat:	
_engine_audio_manager_sfx_cheat:	
		ld hl, _sfx_cheat_psg	; _sfx_cheat_psg = $1A39
		push hl
		call A$audio_manager$123
		pop af
		ret
	
A$audio_manager$123:	
C$audio_manager.c$31$1$17:	
C$audio_manager.c$36$1$19:	
Faudio_manager$play_sfx$0$0:	
		call A$_snd_manager$258
		ld a, l
		or a
		ret nz
		call A$_snd_manager$339
		ld h, l
		pop de
		pop bc
		push bc
		push de
		push hl
		inc sp
		push bc
		call A$_snd_manager$206
		pop af
		inc sp
		ret