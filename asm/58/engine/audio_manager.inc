_engine_audio_manager_sfx_right:
		ld hl, _sfx_right_psg
		push hl
		call play_sfx
		pop af
		ret

_engine_audio_manager_sfx_wrong:
		ld hl, _sfx_wrong_psg
		push hl
		call play_sfx
		pop af
		ret

_engine_audio_manager_sfx_cheat:
		ld hl, _sfx_cheat_psg
		push hl
		call play_sfx
		pop af
		ret

 play_sfx:
		call _devkit_PSGSFXGetStatus
		ld a, l
		or a
		ret nz
		call _devkit_SFX_CHANNEL2
		ld h, l
		pop de
		pop bc
		push bc
		push de
		push hl
		inc sp
		push bc
		call _devkit_PSGSFXPlay
		pop af
		inc sp
		ret